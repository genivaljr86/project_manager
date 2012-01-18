module Admin::BaseHelper

  def translate_attribute(model, attribute)
    model.human_attribute_name(attribute)
  end
  alias_method :ta, :translate_attribute
end
