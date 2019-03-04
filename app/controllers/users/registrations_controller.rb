# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def retrieve_labo
  end
  
  def find_labo
    @labo = Affiliation.find_by(cord: params[:cord])
    if @labo
      flash[:notice] = '研究室が確認できました。'
      redirect_to new_user_registration_path(id: @labo.id)
    else
      flash[:alert] = "研究室が見つかりません"
      render "retrieve_labo"
    end
  end
  
  # GET /resource/sign_up
  def new
    @labo = Affiliation.find(params[:id])
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    @user = current_user
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    thanks_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    thanks_path
  end
  private

    
end
