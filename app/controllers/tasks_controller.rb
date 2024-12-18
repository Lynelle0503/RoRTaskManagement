class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    puts params[:category]
    @task = Task.new(user: Current.session.user,
      name: task_params[:name],
      body: task_params[:body],
      due: task_params[:due],
      done: task_params[:done],
      category: Category.find_by(name: task_params[:category]))
    if @task.save
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @task = Task.find(params[:id])
  end
  def update
    @task = Task.find(params[:id])
    if @task.update(user: Current.session.user,
      name: task_params[:name],
      body: task_params[:body],
      due: task_params[:due],
      done: task_params[:done],
      category: Category.find_by(name: task_params[:category]))
      redirect_to tasks_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def show
    @task = Task.find(params[:id])
  end
  private
  def task_params
    params.require(:task).permit(:name, :body, :due, :done, :category)
  end
end
