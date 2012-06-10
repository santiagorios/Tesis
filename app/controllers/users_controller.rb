class UsersController < ApplicationController
  def new
  	@user = User.new
    @user.build_profile
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		redirect_to root_url, :notice => t("user.signup")
  	else
  		render :new
  	end
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to entries_path, :notice => t('user.update_success')
    else
      render :action => 'edit'
    end
  end
end
