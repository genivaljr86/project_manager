module ApplicationHelper
  def avatar_url(user, size)
    if user.avatar_url.present?
      user.avatar_url
    else
      default_url = "#{root_url}assets/avatars/default_small.png"
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"
    end
  end

  def link_to_icon(icon_name, url_or_object, options={})
    options.merge!({ :class => "icon #{icon_name}", :id => "#{icon_name}" })
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

  def dom_class_first(object, array)
    if (object == array.first)
      return "first"
    end
    nil
  end
end
