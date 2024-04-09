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
end
