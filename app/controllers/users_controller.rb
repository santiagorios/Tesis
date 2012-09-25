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
    render "edit"
  end
  
  def update
    @user = User.find(params[:id])
    if session[:knowledge_area_department] == 1
      session[:knowledge_area_department] = nil
      department = Department.find_by_name(params[:user][:department_name])
      knowledge_area = KnowledgeArea.find_by_name(params[:user][:knowledge_area_name])
      knowledge_area.department = department
    end
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to entries_path, :notice => t('user.update_success') }
        format.json { respond_with_bip @user }
      else
        if !@user.errors[:knowledge_area_department].nil? and !@user.errors[:knowledge_area_department].empty?
          session[:knowledge_area_department] = 1
        end
        format.html { render :action => 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
      format.json { render json: @entries }
      format.js { render :template => 'entries/index' }
    end
  end

  def timeline
    @user = User.find(params[:id])
    @entries = @user.entries.where(:published => true).all(:order => 'date DESC')

    respond_to do |format|
      format.html
      format.json
    end
  end
end
