module ApplicationHelper
  # Set title
  #
  #   - title @page.title
  def title(text, &block)
    title = text.to_s || (yield if block_given?)
    @page_title = @title = strip_tags(title)
  end
end
