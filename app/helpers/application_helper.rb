module ApplicationHelper
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

    classes = [ class_names("inline-flex items-center gap-2 flex-nowrap"), attributes.delete(:class) ].compact.uniq.join(" ")
    link_to url, class: classes, target: "_blank", rel: "noopener", **attributes do
      concat(content_tag(:span, text)).concat(lucide_icon("external-link", class: "w-[1em] h-[1em]"))
    end
  end

  def safe_website(url)
    uri = URI.parse(url)
    return nil unless uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
    url
  rescue URI::InvalidURIError
    nil
  end

  def linkedin_url = "https://www.linkedin.com/company/paris-rb/"
  def twitch_url = "https://www.twitch.tv/paris_rb"
  def youtube_url = "https://www.youtube.com/@paris-rb"
  def meetup_url = "https://www.meetup.com/paris_rb/"
  def github_url = "https://github.com/parisrb/paris-rb.org"
  def join_slack_url = "https://join.slack.com/t/parisrb/shared_invite/zt-1io48rnoz-97bt5glsJJAL1f9Gj06CRw"
end
