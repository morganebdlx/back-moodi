class ApplicationController < ActionController::API
  before_action :authenticate_user!
  
  def ping
    render json: { message: "pong depuis Rails" }
  end
end
