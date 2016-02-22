class AddManagerController < ApplicationController
  
  def index
    @user = User.new
    @restaurants = Restaurant.all
  end

  def create
	  user = User.new(user_params)
	  
	  unless user.save
            flash[:alert] = "Not all parameters are valid!"
	    redirect_to add_manager_path
	  else
            user.add_role :manager
	    flash[:notice] = "Manager succesfully created, he must confirm his email!"
	    redirect_to root_path  
	  end
  end

  private
  def user_params
    params.require(:user).permit(:email, 
				 :first_name, 
				 :last_name, 
				 :adress, 
				 :password, 
				 :password_confirmation, 
				 :restaurant_id)
  end
end
