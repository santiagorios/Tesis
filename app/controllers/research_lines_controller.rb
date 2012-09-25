class ResearchLinesController < ApplicationController
  def show
    @research_line = ResearchLine.find(params[:id])
    @entries = @research_line.entries.where(:published => true).all(:order => 'date DESC')
    if @entries.count == 0
      respond_to do |format|
        format.html { render :template => 'pages/empty_section', :locals => { :model => @department } }
      end
    end
  end

  def index
    @research_lines= ResearchLine.paginate(:page => params[:page])
  end

  def timeline
    @research_line = ResearchLine.find(params[:id])
    @entries = @research_line.entries.where(:published => true).all(:order => 'date DESC')
    respond_to do |format|
      format.json
    end
  end

end
