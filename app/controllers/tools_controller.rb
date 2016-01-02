class ToolsController < ApplicationController

  before_action :set_tool
  layout 'blank'

  def embed_view
  end

  private

  def set_tool
    @tool = Tool.find_by_slug(params[:slug])
  end

end
