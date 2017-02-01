class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]

  def index
    @group = Group.find(params[:group_id])
    @posts = Post.all
  end

  def show
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
  end

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(posts_params)
    @post.group = @group
    @post.user = current_user
    if @post.save
      redirect_to group_path(@group)
      flash[:notice] = "Created"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to account_posts_path
      flash[:notice] = "Updated"
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "Deleted"
    redirect_to account_posts_path
  end

  private

  def posts_params
    params.require(:post).permit(:content)
  end
end
