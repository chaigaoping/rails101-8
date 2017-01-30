class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(groups_params)
    if @group.save
      redirect_to groups_path
      flash[:notice] = "Created"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(groups_params)
      flash[:notice] = "Updated"
      redirect_to groups_path
    else
      redner :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:alert] = "Deleted"
    redirect_to groups_path
  end

  private

  def groups_params
    params.require(:group).permit(:title, :description)
  end
end
