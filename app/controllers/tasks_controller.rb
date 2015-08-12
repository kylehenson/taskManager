class TasksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  def create
    list = List.find(params['list_id'])
    @task = list.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task successfully created."
      redirect_to list_path(list)
    else
      flash[:errors] = @task.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "successfully updated task"
      redirect_to list_path(@task.list_id)
    else
      flash[:errors] = @task.errors.full_messages.join(', ')
      render :edit
    end
  end

  def change_status
    byebug
    @task = Task.find(params[:task_id].to_i)
    @task.status = params[:status]
    if @task.save
      respond_with @task
    else
      respond_with({:errors => @task.errors}, :status => 422, :location => tasks_path)
    end
  end

  private

  def task_params
    params.require(:task).permit(:title,
                                 :notes,
                                 :status,
                                 :start_date,
                                 :due_date)
  end

end
