class RepositoriesController < ApplicationController

  def index
    if params[:search_key]
      @repo = Repository.where("name LIKE ? OR description LIKE ?", 
      "%#{params[:search_key]}%", "%#{params[:search_key]}%")
    else
      @repo = Repository.all
    end
  end

  def show
    @repo = Repository.find(params[:id])
    @user_id = @repo.collaborations.pluck(:user_id)
    @un_selected_user = User.includes(:repositories)
    .where.not(id: @user_id)
    .where.not(id: @repo.owner.id)
    .collect { |u| [ u.full_name, u.id ] }
    @collaborator=User.find(@user_id).pluck(:first_name)
  end

  def new
    @repo = Repository.new
    @usr = User.all.collect { |u| [ [u.first_name, u.last_name].join(' ') , u.id ] }
  end

  def create
    @repo = Repository.new(repo_params)
    if @repo.save
      redirect_to @repo
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @repo = Repository.find(params[:id])
  end

  def update
    @repo = Repository.find(params[:id])

    if @repo.update(repo_params)
      redirect_to @repo
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @repo = Repository.find(params[:id])
    @repo.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def repo_params
      params.require(:repository).permit(:name, :description, :user_id, :search_key)
    end
end
