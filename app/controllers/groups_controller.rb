class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def groups_params
    params.require(:groups).permit(:title, :description)
  end
end
