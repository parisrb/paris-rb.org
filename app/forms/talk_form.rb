class TalkForm < ApplicationForm
  properties :duration,
    :level,
    :pitch,
    :preferred_month_talk,
    :speaker_email,
    :speaker_name,
    :title

  validates :duration,
    inclusion: { in: Talk.duration.values },
    presence: true

  validates :level,
    inclusion: { in: Talk.level.values },
    presence: true

  # validates :preferred_month_talk,
  #   inclusion: {
  #     allow_blank: true,
  #     in: preferred_month_values
  #   }

  validates :speaker_email,
    format: { with: /\A[^@]+@[^@]+\z/ },
    presence: true

  validates :speaker_name,
    presence: true

  validates :title,
    presence: true

  def preferred_month_options
    @preferred_month_options ||= begin
      today = Date.today
      (0..3).map do |n|
        date = today + n.months
        [I18n.l(date, format: '%B'), date.strftime('%B').downcase]
      end
    end
  end

  def preferred_month_values
    @preferred_month_values ||= preferred_month_options.map(&:first)
  end
end
