class FamiliesController < ApplicationController
  before_action :require_login

  def index
    @family = Member.where(family_id: session[:user_id])
  end

  def create
  	new_family = Family.new(family_params)
  	if new_family.save
  		render json: new_family
  	else
  	end
  end

  def destroy
  	family = Family.find_by(id: current_user.id)
  	if family.destroy
  		flash[:success] = "Your ENTIRE account has been deleted"
  	else
  	end
  end

  private
  def family_params
  	params.require(:family).permit :surname, :email, :password
  end

  def require_login
    !current_user
  end
end
