class ResultsController < ApplicationController
  before_filter :require_login, :only => [:new, :edit, :create, :update, :destroy, :myresults]
  def myresults
    @results = current_user.results.paginate(:page => params[:page])

    respond_to do |format|
      format.html { render :template => 'results/index' }
      format.json { render json: @results }
      format.js { render :template => 'results/index' }
    end
  end

  def index
    @results = Result.where(:published => true).paginate(:page => params[:page]).order('id DESC')

    if @results.empty?
      respond_to do |format|
        format.html { render :template => 'pages/empty' }
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @results }
        format.js
      end
    end
  end

  def show
    @result = Result.find(params[:id])

    respond_to do |format|
      format.html # timeline.html.erb
      format.json { render json: @result }
    end
  end

  def new
    @result = Result.new
    @result.images.build
    @result.documents.build
    @result_types = ResultType.all
    @projects = current_user.projects

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @result }
    end
  end

  def edit
    @result = current_user.results.find(params[:id])
    @projects = current_user.projects
  end

  def create
    @result = current_user.results.new(params[:result])

    respond_to do |format|
      if @result.save
        session[:mixpanel] = session[:mixpanel] + "mixpanel.track('crear resultado');"
        format.html { redirect_to @result, notice: t('result.create') }
        format.json { render json: @result, status: :created, location: @result }
      else
        format.html { render action: "new" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @result = current_user.results.find(params[:id])

    respond_to do |format|
      if @result.update_attributes(params[:result])
        format.html { redirect_to @result, notice: t('result.update') }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @result = current_user.entries.find(params[:id])
    @result.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :ok }
    end
  end

  def search
    @results = Result.search(params[:search]).paginate(:page => params[:page])
    @collection = @results
    respond_to do |format|
      format.html { render :template => 'pages/search' }
      format.js { render :template => 'pages/search' }
    end
  end
end
