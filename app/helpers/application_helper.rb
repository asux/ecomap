module ApplicationHelper
  # Set title
  #
  #   - title @page.title
  def title(text, &block)
    title = text.to_s || (yield if block_given?)
    @page_title = @title = strip_tags(title)
  end

  def show_link(resource, html_options={}, &block)
    html_options.reverse_merge!(:title => t(:show_link))
    if can?(:show, resource)
      if block_given?
        link_to(resource, html_options, &block)
      else
        link_to(html_options[:title], resource, html_options)
      end
    end
  end

  def edit_link(resource, html_options={}, &block)
    html_options.reverse_merge!(:title => t(:edit_link))
    if can?(:update, resource)
      if block_given?
        link_to([:edit, resource], html_options, &block)
      else
        link_to(html_options[:title], [:edit, resource], html_options)
      end
    end
  end

  def destroy_link(resource, html_options={}, &block)
    html_options.reverse_merge!({
      :title => t(:destroy_link),
      :confirm => t(:confirm_destroy_message),
      :method => :delete})
    if can?(:destroy, resource)
      if block_given?
        link_to(resource, html_options, &block)
      else
        link_to(html_options[:title], resource, html_options)
      end
    end
  end

  def index_link(resource, html_options={}, &block)
    resource_class = resource.is_a?(Class) ? resource : resource.class
    html_options.reverse_merge!(:title => t(:index_link, :model => resource_class.human_name))
    if can?(:index, resource)
      if block_given?
        link_to([resource_class], html_options, &block)
      else
        link_to(html_options[:title], [resource_class], html_options)
      end
    end
  end

  def new_link(resource, html_options={}, &block)
    resource_class = resource.is_a?(Class) ? resource : resource.class
    html_options.reverse_merge!(:title => t(:new_link, :model => resource_class.human_name))
    if can?(:create, resource)
      if block_given?
        link_to([:new, resource_class.name.underscore.to_sym], html_options, &block)
      else
        link_to(html_options[:title], [:new, resource_class.name.underscore.to_sym], html_options)
      end
    end
  end

  def back_link(resource, html_options={}, &block)
    html_options.reverse_merge!(:title => t(:back_link))
    index_link(resource, html_options, &block)
  end
end
