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
        project = Project.create(title: todos_params[:title])
        if (project.valid?)
          todo = Todo.create(text: todos_params[:text], isCompleted: false, project_id: project["id"])
          if (todo.valid?)
            render :json => project.to_json( :include => [:todos] )
          else
            render :json => todo.errors.full_messages
          end
        else
          todo = Todo.create(text: todos_params[:text], isCompleted: false, project_id: todos_params[:project_id])
          if (todo.valid?)
            render :json => todo
          else
            render :json => todo.errors.full_messages
          end
        end
    end

    private
        def todos_params
            params.permit(:project_id,:title,:id,:text)
        end
end