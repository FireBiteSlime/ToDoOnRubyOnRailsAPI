class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    render :json => @projects.to_json( :include => [:todos] ) 
  end

  def update
  end

  def create
  end
  
end
