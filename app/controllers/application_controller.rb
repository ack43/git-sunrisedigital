class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  
  def validator(object)
    object.valid?
    model = object.class.name.underscore.to_sym
    field = params["request"].keys.first
    @errors = object.errors[field]

    if @errors.empty?
      # Misunderstanding of variable types.
      # So use just one + `def error_json`:
      # @errors = false
    else
      name = t("activerecord.attributes.request.#{field}")
      @errors.map! { |e| "#{name} #{e}<br />" }
    end
  end
end
