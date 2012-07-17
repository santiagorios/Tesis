class UsersController < ApplicationController
  before_filter :require_login, :only => [:edit, :update, :myaccount]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      @user.create_profile
      login(params[:user][:email], params[:user][:password], false)
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

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if @user == current_user
      @entries = @user.entries.paginate(:page => params[:page]).order('date DESC')
    else
      @entries = @user.entries.where(:published => true).paginate(:page => params[:page]).order('date DESC')
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
      format.js { render :template => 'entries/index' }
    end
  end
end
