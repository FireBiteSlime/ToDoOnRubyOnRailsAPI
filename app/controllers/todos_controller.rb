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
        if (todos_params[:project_id] < 0)
          project = Project.create(title: todos_params[:title])
          Todo.create(text: todos_params[:text], isCompleted: false, project_id: project["id"])
          render :json => project.to_json( :include => [:todos] )
        else
          todo = Todo.create(text: todos_params[:text], isCompleted: false, project_id: todos_params[:project_id])
          render :json => todo
        end
    end

    private
        def todos_params
            params.permit(:project_id,:title,:id,:text)
        end
  end