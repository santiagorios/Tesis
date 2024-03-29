class EntriesController < ApplicationController
  before_filter :require_login, :only => [:new, :edit, :create, :update, :destroy, :myentries]
  before_filter :is_owner?, :only => [:edit, :update, :destroy, :show]
  def is_owner?
    entry = Entry.find(params[:id])
    unless current_user.nil?
      unless entry.owned_by?(current_user)
        unless entry.published
          redirect_to root_path
        end
      end
    else
      unless entry.published
        redirect_to root_path, :notice => t('application.please_sign_in')
      end
    end
  end

  def myentries
    @entries = current_user.entries.paginate(:page => params[:page]).order('date DESC')

    if @entries.empty?
      respond_to do |format|
        format.html { render :template => 'pages/myempty', :locals => { :model => Entry } }
      end
    else
      respond_to do |format|
        format.html { render :template => 'entries/index' }
        format.json { render json: @entries }
        format.js { render :template => 'entries/index' }
      end
    end
  end

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.where(:published => true).paginate(:page => params[:page]).order('date DESC')

    if @entries.empty?
      respond_to do |format|
        format.html { render :template => 'pages/empty' }
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @entries }
        format.js
      end
    end

  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # timeline.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = Entry.new
    @entry.images.build
    @entry.documents.build
    @programs = current_user.programs

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = current_user.entries.find(params[:id])
    @programs = current_user.programs
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = current_user.entries.new(params[:entry])

    respond_to do |format|
      if @entry.save
        session[:mixpanel] = "mixpanel.track('crear actividad');"
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = current_user.entries.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = current_user.entries.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :ok }
    end
  end

  def search
    @entries = Entry.search(params[:search]).paginate(:page => params[:page])
    @collection = @entries
    respond_to do |format|
      format.html { render :template => 'pages/search' }
      format.js { render :template => 'pages/search' }
    end
  end
end
