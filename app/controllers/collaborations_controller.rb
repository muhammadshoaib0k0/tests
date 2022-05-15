class CollaborationsController < ApplicationController
  def create
    @repo= Repository.find(params[:repository_id])
    @collab=Collaboration.new(user_id:params[:user_id], repository_id:params[:repository_id])
    @collab.save

    redirect_to @repo

  end  
end
