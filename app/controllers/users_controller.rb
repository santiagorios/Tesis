class UsersController < ApplicationController
  before_filter :require_login, :only => [:edit, :update, :myaccount]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      session[:mixpanel] = "mixpanel.track('crear usuario');"
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
    @object = @user
    if @user == current_user
      @entries = @user.entries.all(:limit => 5)

      @user_programs = @user.programs.all(:limit => 5)
      #@group_programs = @user.groups_programs.all(:limit => 2)
      #@programs = @user_programs + @group_programs
      #@programs.sort_by(&:created_at)
      @programs = @user_programs

      @projects = @user.projects.all(:limit => 5)
    else
      @entries = @user.entries.where(:published => true).all(:limit => 5)

      @user_programs = @user.programs.where(:published => true).all(:limit => 3)
      @group_programs = @user.groups_programs.where(:published => true).all(:limit => 2)
      @programs = @user_programs + @group_programs
      @programs.sort_by(&:created_at)

      @projects = @user.projects.where(:published => true).all(:limit => 5)
    end

    respond_to do |format|
      format.html # timeline.html.erb
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

  def program_type
    @object = User.find(params[:object_id])
    @type = ProgramType.find(params[:type_id])

    @user_programs = @object.programs.where(:program_type_id => @type, :published => true)
    @group_programs = @object.groups_programs.where(:program_type_id => @type, :published => true)

    @programs = @user_programs + @group_programs

    @programs.sort_by(&:created_at)
    @programs = @programs.paginate(:page => params[:page])

    respond_to do |format|
      format.html { render :template => 'pages/programs' }
    end
  end

  def programs
    @object = User.find(params[:id])
    @programs = @object.programs.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/programs' }
    end
  end

  def projects
    @object = User.find(params[:id])
    @projects = @object.projects.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/projects' }
    end
  end

  def results
    @object = User.find(params[:id])
    @results = @object.results.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/results' }
    end
  end

  def entries
    @object = User.find(params[:id])
    @entries = @object.entries.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/entries' }
    end
  end

  def search
    @users = User.search(params[:search]).paginate(:page => params[:page])
    @collection = @users
    respond_to do |format|
      format.html { render :template => 'pages/search' }
      format.js { render :template => 'pages/search' }
    end
  end

  def groups_projects
    @object = User.find(params[:id])
    @projects = @object.groups_projects.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/projects' }
    end
  end

  def groups_programs
    @object = User.find(params[:id])
    @programs = @object.groups_programs.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/programs' }
    end
  end

  def my_groups_projects
    @object = current_user
    @projects = @object.groups_projects.all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/projects' }
    end
  end

  def my_groups_programs
    @object = current_user
    @programs = @object.groups_programs.all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/programs' }
    end
  end

end
