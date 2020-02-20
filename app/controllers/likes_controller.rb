class LikesController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    @like = Like.new(user_id: current_user.id,product_id: params[:product_id])
    @like.save

  end

  def destroy
    @like = Like.find_by(user_id: params[:user_id],product_id: params[:product_id])
    @like.destroy
  end


end

