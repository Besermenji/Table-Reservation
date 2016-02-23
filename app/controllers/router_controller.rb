class RouterController < ApplicationController
  def index
  path = case current_user.roles.first.name
    when 'sys_admin'  
      restaurants_path
    when 'manager'
      restaurants_path
    when 'guest'
      guest_index_path
    else
      forbidden_acces_path 
    end

    redirect_to path
	    
  end
end
