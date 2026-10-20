class TalksController < ApplicationController
  # Un stamp reste rejouable tant qu'il n'a pas expiré, et un bot peut toujours
  # en redemander un. C'est ce plafond, pas le captcha, qui l'empêche de noyer
  # la boîte.
  MAX_PROPOSALS_PER_HOUR = 10

  include Captcha
  protect_from_spam_with_honeypot only: [ :create ], on_expired_form: :retry_expired_form

  rate_limit to: MAX_PROPOSALS_PER_HOUR, within: 1.hour, only: :create, with: :reject_flood

  def index
    @lineup_talks = Talk.lineup
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(talk_params)
    if @talk.save
      TalkMailer.new_talk(@talk).deliver_later
      @talk.send_slack_notification!
      redirect_to talks_path, notice: "Talk proposed successfully"
    else
      render action: :new
    end
  end

  private

  def talk_params
    params.require(:talk).permit(%i[duration
                                    level
                                    speaker_email
                                    speaker_name
                                    speaker_twitter
                                    preferred_month_talk
                                    title])
  end

  # Le formulaire est rendu à nouveau avec ce qui a été saisi et un stamp
  # frais, plutôt que de perdre la proposition.
  def retry_expired_form
    @talk = Talk.new(talk_params)
    flash.now[:error] = t("talks.form.expired_stamp")
    render action: :new
  end

  def reject_flood
    Rails.logger.warn("[Captcha] Rate limited talks#create (ip=#{request.remote_ip})")
    flash[:error] = t("talks.form.rate_limited")
    redirect_to root_path
  end
end
