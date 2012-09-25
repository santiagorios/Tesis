class KnowledgeAreasController < ApplicationController
  def show
    @knowledge_area = KnowledgeArea.find(params[:id])
    @entries = @knowledge_area.entries.where(:published => true).all(:order => 'date DESC')
    if @entries.count == 0
      respond_to do |format|
        format.html { render :template => 'pages/empty_section', :locals => { :model => @department } }
      end
    end
  end

  def index
    @knowledge_areas = KnowledgeArea.paginate(:page => params[:page])
  end

  def timeline
    @knowledge_area = KnowledgeArea.find(params[:id])
    @entries = @knowledge_area.entries.where(:published => true).all(:order => 'date DESC')
    respond_to do |format|
      format.json
    end
  end

end
