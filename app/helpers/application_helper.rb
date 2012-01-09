module ApplicationHelper
  def link_to_icon(icon_name, url_or_object, options={})
    options.merge!({ :class => "icon #{icon_name}" })
    link_to(image_tag("projects_icons/#{icon_name}.png", { :title => icon_name }), url_or_object, options)
  end

  def link_to_new(model, url, html_options = {})
    link_to t("new", model: model.model_name.human),url, html_options
  end

  def link_to_edit(url, html_options = {})
    html_options.reverse_merge!(:class => "green")
    link_to t("edit"), url, html_options
  end

  def link_to_destroy(url, html_options = {})
    html_options.reverse_merge!(:confirm => t('delete') , :method => :delete, :class => "red")
    link_to t("destroy"), url, html_options
  end

  def error_messages_for(resource)
    render :partial => "shared/error_messages",:locals => { :resource => resource}
  end

  def flash_messages
    flash.collect do |name, msg|
      content_tag(:div, msg, :id => "flash_#{name}")
    end.join.html_safe
  end
end
