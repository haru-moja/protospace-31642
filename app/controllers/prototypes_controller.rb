class PrototypesController < ApplicationController
  def index
    @user = current_user
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    
    @prototype= Prototype.new(prototype_params)
    if @prototype.save
      redirect_to '/'
    else
    render action: :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    if @prototype.user == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render action: :edit 
    end
  end
  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to '/'
  end
  
  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
