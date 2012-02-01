class UserDecorator < ApplicationDecorator
  decorates :user

  def member_since
    model.created_at.strftime("%b %e, %Y")
  end

  def current_sign_in_at
   handle_none model.current_sign_in_at do
     model.current_sign_in_at.strftime("%d/%m/%Y %l:%M%p")
   end
  end

  def sign_in_count
   handle_none model.sign_in_count do
     model.sign_in_count
   end
  end

  def last_sign_in_at
   handle_none model.last_sign_in_at do
     model.last_sign_in_at.strftime("%d/%m/%Y %l:%M%p")
   end
  end

  def current_sign_in_ip
   handle_none model.current_sign_in_ip do
     model.current_sign_in_ip
   end
  end

  def last_sign_in_ip
    handle_none model.last_sign_in_ip do
      model.last_sign_in_ip
    end
  end

  private

  def handle_none(value)
    if value.present?
      yield
    else
      h.content_tag :span, "None given", class: "none"
    end
  end
end
