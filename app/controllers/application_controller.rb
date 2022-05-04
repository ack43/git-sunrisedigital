class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  
  def validator(object)
    object.valid?
    model = object.class.name.underscore.to_sym
    field = params["request"].keys.first
    @errors = object.errors[field]

    if @errors.empty?
      @errors = true
    else
      name = t("activerecord.attributes.request.#{field}")
      @errors.map! { |e| "#{name} #{e}<br />" }
    end
  end
end
