class ProjectsController < ApplicationController
  def index
    
    @projects = Project.all
    for project in @projects do
      project.todos.sort {|a, b|b.created_at <=> a.created_at}
    end
    render :json => @projects.to_json( :include => [:todos] ) 
  end

  def update
  end

  def create
  end
end
