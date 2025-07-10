class ApplicationController < ActionController::API
  def ping
    render json: { message: "pong depuis Rails" }
  end
end
