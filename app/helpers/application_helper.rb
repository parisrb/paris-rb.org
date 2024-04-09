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

    classes = [ class_names("flex items-center gap-2 flex-nowrap"), attributes.delete(:class) ].compact.uniq.join(" ")
    link_to url, class: classes, target: "_blank", rel: "noopener", **attributes do
      concat(content_tag(:span, text)).concat(lucide_icon("external-link", class: "w-[1em] h-[1em]"))
    end
  end
end
