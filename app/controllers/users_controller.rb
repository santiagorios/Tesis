class UsersController < ApplicationController
  before_filter :require_login, :only => [:edit, :update, :myaccount]

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
    @user = User.find(params[:id])
  end

  def myaccount 
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to entries_path, :notice => t('user.update_success')
    else
      render :action => 'edit'
    end
  end
end
