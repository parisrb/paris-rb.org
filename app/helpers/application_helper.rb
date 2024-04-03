module ApplicationHelper
  def page_rel(page)
    if page.prev?
      "next"
    elsif page.prev?
      "prev"
    end
  end
end
