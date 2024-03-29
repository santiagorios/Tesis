# encoding: utf-8
class ProgramsController < ApplicationController
  before_filter :require_login, :only => [:new, :edit, :create, :update, :destroy, :myprograms]
  def is_owner?
    program = Program.find(params[:id])
    unless current_user.nil?
      if !program.owned_by?(current_user)
        unless program.published
          redirect_to root_path
        end
      end
    else
      unless program.published
        redirect_to root_path, :notice => t('application.please_sign_in')
      end
    end
  end
  before_filter :is_owner?, :only => [:show]

  def myprograms
    @user_programs = current_user.programs
    @groups_programs = current_user.groups_programs
    @programs = @user_programs + @groups_programs
    @programs.sort_by(&:created_at)
    @programs = @programs.paginate(:page => params[:page])

    if @programs.empty?
      respond_to do |format|
        format.html { render :template => 'pages/myempty', :locals => { :model => Program } }
      end
    else
      respond_to do |format|
        format.html { render :template => 'programs/index' }
        format.json { render json: @programs }
        format.js { render :template => 'programs/index' }
      end
    end
  end

  def program_type
    @type = ProgramType.find(params[:id])
    @programs = @type.programs.where(:published => true).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'programs/index' }
    end
  end


  def index
    @programs = Program.where(:published => true).paginate(:page => params[:page])

    if @programs.empty?
      respond_to do |format|
        format.html { render :template => 'pages/empty' }
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @programs }
        format.js
      end
    end
  end

  def show
    @program = Program.find(params[:id])

    respond_to do |format|
      format.html # timeline.html.erb
      format.json { render json: @program }
    end
  end

  def new
    @program = Program.new
    @groups = current_user.research_groups
    @types = ProgramType.all


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @program }
    end
  end

  def edit
    @program = current_user.programs.find(params[:id])
    @program = current_user.programs.find(params[:id])
    if @program.nil?
      @program.current_user.groups_programs.find(params[:id])
    end
    @groups = current_user.research_groups
    @types = ProgramType.all
  end

  def create
    @program = current_user.programs.new(params[:program])

    respond_to do |format|
      if @program.save
        session[:mixpanel] = "mixpanel.track('crear programa');"
        format.html { redirect_to @program, notice: t('program.create') }
        format.json { render json: @program, status: :created, location: @program }
      else
        format.html { render action: "new" }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @program = Program.find(params[:id])

    respond_to do |format|
      if @program.update_attributes(params[:program])
        format.html { redirect_to @program, notice: t('program.update') }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy

    respond_to do |format|
      format.html { redirect_to programs_url }
      format.json { head :ok }
    end
  end

  def search
    @programs = Program.search(params[:search]).paginate(:page => params[:page])
    @collection = @programs
    respond_to do |format|
      format.html { render :template => 'pages/search' }
      format.js { render :template => 'pages/search' }
    end
  end
end
