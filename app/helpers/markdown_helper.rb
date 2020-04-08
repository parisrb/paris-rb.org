module MarkdownHelper
  EXTENSIONS = {
    autolink: true,
    fenced_code_blocks: true,
    no_intra_emphasis: true,
    strikethrough: true,
    tables: true
  }.freeze

  RENDERER_OPTIONS = {
    no_styles: true,
    safe_links_only: true,
    with_toc_data: true
  }.freeze

  def markdown(template)
    renderer = Redcarpet::Render::HTML.new(RENDERER_OPTIONS.dup)
    engine = Redcarpet::Markdown.new(renderer, EXTENSIONS.dup)

    engine.render(template)
  end
end
