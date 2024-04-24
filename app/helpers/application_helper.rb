module ApplicationHelper
  ALERT_KIND_MAPPING = {
    notice: "alert-info",
    success: "alert-success",
    error: "alert-error"
  }

  ALERT_ICON_MAPPING = {
    notice: "information-circle",
    success: "check-circle",
    error: "x-circle"
  }

  def page_rel(page)
    if page.prev?
      "next"
    elsif page.prev?
      "prev"
    end
  end

  def back_to(text = t("back"), path, **attributes)
    classes = [ class_names("flex items-center gap-2"), attributes.delete(:class) ].compact.uniq.join(" ")

    link_to path, class: classes, **attributes do
      lucide_icon("move-left").concat(content_tag(:span, text, class: "link-text"))
    end
  end

  def external_link_to(text, url = nil, **attributes, &block)
    if block_given?
      text = capture(&block)
      url = text
    end

    classes = class_names("inline-flex items-center gap-2 flex-nowrap"), attributes.delete(:class)
    link_to url, class: classes, target: "_blank", rel: "noopener", **attributes do
      concat(content_tag(:span, text)).concat(lucide_icon("external-link", class: "w-4 h-4"))
    end
  end

  def safe_website(url)
    uri = URI.parse(url)
    return nil unless uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
    url
  rescue URI::InvalidURIError
    nil
  end

  def alert(kind:, content:)
    icon = ALERT_ICON_MAPPING[kind.to_sym]
    classes = class_names("alert", ALERT_KIND_MAPPING[kind.to_sym])
    data = {
      controller: "leave-after",
      leave_after_transition_class: "transform ease-out duration-300 transition",
      leave_after_transition_to_class: "opacity-0 scale-90"
    }
    content_tag(:div, class: classes, data: data) do
      # concat lucide icon, class: "h-8 w-8"
      concat content
    end
  end

  def linkedin_url = "https://www.linkedin.com/company/paris-rb/"
  def twitch_url = "https://www.twitch.tv/paris_rb"
  def youtube_url = "https://www.youtube.com/@paris-rb"
  def meetup_url = "https://www.meetup.com/paris_rb/"
  def github_url = "https://github.com/parisrb/paris-rb.org"
  def join_slack_url = "https://join.slack.com/t/parisrb/shared_invite/zt-1io48rnoz-97bt5glsJJAL1f9Gj06CRw"
end
