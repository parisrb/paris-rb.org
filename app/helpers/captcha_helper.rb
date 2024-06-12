module CaptchaHelper
  def captcha_field_tag
    tag :input, type: "text", name: honeypot_field_name, id: honeypot_field_name, style: style
  end

  private

  def honeypot_field_name
    controller.class.honeypot_field_name
  end

  def style
    # various ways to hide the honeypot field
    [ "display:none;", "visibility:hidden; position: absolute;", "position:absolute; top:-9999px; left:-9999px;", "height:0; width:0; opacity:0;" ].sample
  end
end
