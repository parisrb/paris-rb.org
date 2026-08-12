module CaptchaHelper
  def captcha_field_tag
    safe_join([ honeypot_tag, form_stamp_tag ])
  end

  private

  # Bots fill in every input they find, humans never see this one. It is kept
  # out of the tab order and away from password managers so it cannot be
  # filled in by accident.
  def honeypot_tag
    tag :input,
      type: "text",
      name: honeypot_field_name,
      id: honeypot_field_name,
      style: style,
      tabindex: -1,
      autocomplete: "off",
      aria: { hidden: true }
  end

  def form_stamp_tag
    hidden_field_tag Captcha::STAMP_FIELD_NAME, captcha_form_stamp, id: nil
  end

  def honeypot_field_name
    controller.class.honeypot_field_name
  end

  # Various ways to hide the honeypot field. All of them keep it out of the
  # flow: an in-flow field of zero size still counts as a flex item and adds a
  # gap to the row it sits in.
  def style
    [
      "display:none;",
      "visibility:hidden; position:absolute;",
      "position:absolute; top:-9999px; left:-9999px;",
      "position:absolute; height:0; width:0; opacity:0;"
    ].sample
  end
end
