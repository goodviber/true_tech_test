class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :add1, :street, :town, :country, :postcode, :password, :password_confirmation, :user_image, :remove_user_image)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :add1, :street, :town, :country, :postcode, :password, :password_confirmation, :current_password, :user_image, :remove_user_image)
  end

end
