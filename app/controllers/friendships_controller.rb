class FriendshipsController < ApplicationsController
  
  before_action :authenticate_user!
  
  def create
    friend = User.find(params[:friend_id])
    friendship.create(friendship_params.merge!(friend_id: params[:friiend_id], user_id: current_user.id)) unless current_user.follows_or_same?(friend)
    redirect_to root_path
  end
  
  
  private
  
  def friendship_params
    params.permit(:friend_id, :user_id)
  end
end