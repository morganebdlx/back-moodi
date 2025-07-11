class Api::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_for_authentication(email: params[:email])

    if user&.valid_password?(params[:password])
      sign_in(user)
      render json: {
        user: {
          id: user.id,
          email: user.email
        }
      }, status: :ok
    else
      render json: { error: "Email ou mot de passe incorrect" }, status: :unauthorized
    end
  end

  def show
  if current_user
    render json: current_user, status: :ok
  else
    render json: { error: "Pas connecté" }, status: :unauthorized
  end


  def destroy
    sign_out(current_user)
    render json: { message: "Déconnexion réussie" }, status: :ok
  end
end
