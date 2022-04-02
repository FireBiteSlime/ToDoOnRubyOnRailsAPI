class MainController < ApplicationController
  def index
		@projects = Project.all
    render :json => @projects.to_json( :include => [:todos] ) 
  end

  def create
    if (params[:project_id].empty?)
      Todo.create(text: params[:text], isCompleted: false, project_id: params[:project_id])
    else
      project = Project.create(title:params[:title])
      Todo.create(text: params[:text], isCompleted: false, project_id: project["id"])
    end
    render :json => todo
  end

  def update
    todo = Todo.find(params[:id])
		todo.isCompleted = !todo.isCompleted
		todo.save
		render :json => todo
  end
end
