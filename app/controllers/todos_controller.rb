class TodosController < ApplicationController
    def index
      render plain: Todo.order(:due_date).map { |todo| todo.to_pleasent_string }.join("\n")
    end
    def show
        todo_id = params[:id]
        todo = Todo.find(todo_id)
        render plain: todo.to_pleasent_string
    end
  end