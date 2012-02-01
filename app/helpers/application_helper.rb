module ApplicationHelper
  def avatar_url(user, size, default_name=nil)
    if user.avatar_url.present?
      user.avatar_url
    else
      default_url = "#{root_url}assets/avatars/default_#{default_name}.png"
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"
    end
  end

  def gravatar_image_tag(email, html_options = {})
    return unless email
    email = Digest::MD5.hexdigest(email)
    image_tag "http://www.gravatar.com/avatar/#{email}?size=32", html_options
  end

  def link_to_icon(icon_name, url_or_object, options={})
    options.merge!({ :class => "icon #{icon_name}", :id => "#{icon_name}" })
    link_to(image_tag("projects_icons/#{icon_name}.png",{ :title => icon_name }), url_or_object,options)
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

  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end

  def authorized?(permission, thing, &block)
    block.call if can?(permission.to_sym, thing) ||
      current_user.try(:admin?)
    nil
  end
end
