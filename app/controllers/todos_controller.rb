class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render "index"
    # render plain: Todo.order(:due_date).map { |todo| todo.to_pleasent_string }.join("\n")
  end

  def show
    todo_id = params[:id]
    todo = Todo.find(todo_id)
    render plain: todo.to_pleasent_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create(todo_text: todo_text, due_date: due_date, completed: false)
    render plain: new_todo.to_pleasent_string
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    render plain: todo.to_pleasent_string
  end
end
