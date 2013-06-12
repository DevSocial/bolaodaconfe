module ApplicationHelper
  def error_tag(model, attribute)
    if model.errors.has_key? attribute
      content_tag :span, model.errors[attribute].first, :class => 'help-inline'
    end
  end
end
