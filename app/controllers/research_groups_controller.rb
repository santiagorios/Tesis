class ResearchGroupsController < ApplicationController
  def show
    @research_group = ResearchGroup.find(params[:id])
    @object = @research_group
    @programs = @research_group.programs.where(:published => true).all(:order => 'id DESC', :group => :id, :limit => 5)
    @projects = @research_group.projects.where(:published => true).all(:order => 'start_date DESC', :group => :id, :limit => 5)
    if @programs.count == 0 && @projects.count == 0
      respond_to do |format|
        format.html { render :template => 'pages/empty_section', :locals => { :model => @research_group } }
      end
    end
  end

  def index
    @research_groups = ResearchGroup.paginate(:page => params[:page])
  end

  def programs
    @object = ResearchGroup.find(params[:id])
    @programs = @object.programs.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/programs' }
    end
  end

  def projects
    @object = ResearchGroup.find(params[:id])
    @projects = @object.projects.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/projects' }
    end
  end

  def results
    @object = ResearchGroup.find(params[:id])
    @results = @object.results.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/results' }
    end
  end


  def search
    @research_groups = ResearchGroup.search(params[:search]).paginate(:page => params[:page])
    @collection = @research_groups
    respond_to do |format|
      format.html { render :template => 'pages/search' }
      format.js { render :template => 'pages/search' }
    end
  end



  def new
    @research_group = ResearchGroup.new

    respond_to do |format|
      format.html # new.html.erb

    end
  end

  def edit
    @research_group = current_user.research_groups.find(params[:id])
  end

  def create
    @research_group = current_user.research_groups.new(params[:research_group])

    respond_to do |format|
      if @research_group.save
        @research_group.add_current_user(current_user)
        format.html { redirect_to @research_group, notice: t('application.research_group_created') }
        format.json { render json: @research_group, status: :created, location: @research_group }
      else
        format.html { render action: "new" }
        format.json { render json: @research_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @research_group = current_user.research_groups.find(params[:id])

    respond_to do |format|
      if @research_group.update_attributes(params[:@research_group])
        @research_group.add_current_user(current_user)
        format.html { redirect_to @research_group, notice: t('application.research_group_updated') }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @research_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @research_group = current_user.research_groups.find(params[:id])
    @research_group.destroy

    respond_to do |format|
      format.html { redirect_to research_groups_url }
      format.json { head :ok }
    end
  end



  def program_type
    @object = ResearchGroup.find(params[:object_id])
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
end
