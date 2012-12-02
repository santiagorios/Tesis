class ProjectsController < ApplicationController

  def myprojects
    @projects = current_user.projects.paginate(:page => params[:page])

    respond_to do |format|
      format.html { render :template => 'projects/index' }
      format.json { render json: @projects }
      format.js { render :template => 'projects/index' }
    end
  end

  def index
    @projects = Project.where(:published => true).paginate(:page => params[:page]).order('id DESC')

    if @projects.empty?
      respond_to do |format|
        format.html { render :template => 'pages/empty' }
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @projects }
        format.js
      end
    end
  end

  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # timeline.html.erb
      format.json { render json: @project }
    end
  end

  def new
    @project = Project.new
    @programs = current_user.programs
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  def edit
    @project = current_user.projects.find(params[:id])
    @programs = current_user.programs
  end

  def create
    @project = current_user.projects.new(params[:project])

    respond_to do |format|
      if @project.save
        session[:mixpanel] = "mixpanel.track('crear proyecto');"
        format.html { redirect_to @project, notice: t('project.create') }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @project = current_user.projects.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: t('project.update') }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = current_user.programs.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :ok }
    end
  end

  def search
    @projects = Project.search(params[:search]).paginate(:page => params[:page])
    @collection = @projects
    respond_to do |format|
      format.html { render :template => 'pages/search' }
      format.js { render :template => 'pages/search' }
    end
  end
end
