class TodosController < ApplicationController
    def index
    end
  
    def update
        project = Project.find(todos_params[:project_id])
        todo = project.todos.find(todos_params[:id])
		todo.isCompleted = !todo.isCompleted
		todo.save
		render :json => todo
    end
  
    def create
        if (todos_params[:project_id].empty?)
            Todo.create(text: todos_params[:text], isCompleted: false, project_id: todos_params[:project_id])
          else
            project = Project.create(title:params[:title])
            Todo.create(text: todos_params[:text], isCompleted: false, project_id: project["id"])
          end
        render :json => todo
    end

    private
        def todos_params
            params.permit(:project_id,:title,:id,:text)
        end
  end