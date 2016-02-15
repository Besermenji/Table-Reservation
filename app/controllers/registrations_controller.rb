class RegistrationsController < Devise::RegistrationsController
    
  def create
    user = User.new(sign_up_params)
    
    unless user.save
      flash[:alert] = "Not all parameters are valid!"
      redirect_to new_user_registration_path
    else
      user.add_role :guest
      flash[:notice] = "Account succesfully created, confirm your email!"
      redirect_to root_path  
    end
  end
  
  private
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :adress, :email, :password, :password_confirmation)
  end

  private
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :adress, :email, :password, :password_confirmation, :current_password)
  end
end

