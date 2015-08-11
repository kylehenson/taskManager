class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    if list.save
      flash[:notice] = "List successfully created"
      redirect_to lists_path
    else
      flash[:errors] = list.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      flash[:notice] = "Successfully updated list"
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    flash[:notice] = "Successfully deleted list."
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end

end
