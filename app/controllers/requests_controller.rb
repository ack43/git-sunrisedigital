class RequestsController < ApplicationController
  def submit_form
    @request = Request.new(request_params)
    validator(@request)
    unless @errors
      RequestNotifier.received(@request.message).deliver
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