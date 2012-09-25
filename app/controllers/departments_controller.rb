class DepartmentsController < ApplicationController
  def show
    @department = Department.find(params[:id])
    @entries = @department.entries.where(:published => true).all(:order => 'date DESC')
    if @entries.count == 0
      respond_to do |format|
        format.html { render :template => 'pages/empty_section', :locals => { :model => @department } }
      end
    end
  end

  def index
  end

  def timeline
    @department = Department.find(params[:id])
    @entries = @department.entries.where(:published => true).all(:order => 'date DESC')
    respond_to do |format|
      format.json
    end
  end

end
