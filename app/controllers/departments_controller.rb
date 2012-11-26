class DepartmentsController < ApplicationController
  def show
    @department = Department.find(params[:id])
    @object = @department
    @entries = @department.entries.where(:published => true).all(:order => 'date DESC')
    @programs = @department.programs.where(:published => true).all(:order => 'id DESC', :group => :id)
    @projects = @department.projects.where(:published => true).all(:order => 'start_date DESC', :group => :id)
    @knowledge_areas = @department.knowledge_areas.all(:order => 'id')
    if @entries.count == 0 && @programs.count == 0 && @projects.count == 0 && @knowledge_areas == 0
      respond_to do |format|
        format.html { render :template => 'pages/empty_section', :locals => { :model => @department } }
      end
    end
  end

  def index
    @departments = Department.paginate(:page => params[:page])
  end

  def timeline
    @department = Department.find(params[:id])
    @entries = @department.entries.where(:published => true).all(:order => 'date DESC')
    respond_to do |format|
      format.json
    end
  end

  def programs
    @object = Department.find(params[:id])
    @programs = @object.programs.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/programs' }
    end
  end

  def projects
    @object = Department.find(params[:id])
    @projects = @object.projects.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/projects' }
    end
  end

  def results
    @object = Department.find(params[:id])
    @results = @object.results.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/results' }
    end
  end

  def entries
    @object = Department.find(params[:id])
    @entries = @object.entries.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/entries' }
    end
  end

  def program_type
    @object = Department.find(params[:object_id])
    @type = ProgramType.find(params[:type_id])

    @programs = @object.programs.where(:program_type_id => @type, :published => true)
    @programs = @programs.paginate(:page => params[:page])

    if @programs.count == 0
      respond_to do |format|
        format.html { render :template => 'pages/empty_section_type', :locals => { :model => @object, :type => @type } }
      end
    else
      respond_to do |format|
        format.html { render :template => 'pages/programs' }
      end
    end
  end

  def search
    @departments = Department.search(params[:search]).paginate(:page => params[:page])
    @collection = @departments
    respond_to do |format|
      format.html { render :template => 'pages/search' }
      format.js { render :template => 'pages/search' }
    end
  end

  def knowledge_areas
    @object = Department.find(params[:id])
    @knowledge_areas = @object.knowledge_areas.all(:order => 'id DESC').paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/knowledge_areas' }
    end
  end

end
