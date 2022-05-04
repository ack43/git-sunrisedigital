class RequestsController < ApplicationController
  def submit_form
    @request = Request.new(request_params)
    validator(@request)
    if @errors == true || @errors.empty?
      begin
        RequestNotifier.received(@request.message).deliver
      rescue Exception => ex
        Rails.logger.error ''
        Rails.logger.error 'RequestNotifier error:'
        Rails.logger.error "Cannot send e-mail with request"
        Rails.logger.error "Request:"
        Rails.logger.error @request.inspect
        Rails.logger.error "Exception:"
        Rails.logger.error ex.message
        Rails.logger.error ex.inspect
        Rails.logger.error ''
        Rails.logger.error ''
      end
      flash[:success] = "Ваша заявка принята. Менеджер свяжется с вами в ближайшее время!"
    else
      flash[:error] = "В заявке обнаружены ошибки. Введите данные заново."
    end
    
    respond_to do |format|
      format.html { redirect_to root_url(submit: @errors.blank?, type: request_params[:type].downcase) }
      format.js
    end
  end
  
  def validate
    @request = Request.new(request_params)
    validator(@request)
    respond_to do |format|
      format.json { render json: @errors }
    end
  end

  def request_params
    params.require(:request).permit(:name, :phone, :email, :type)
  end
end