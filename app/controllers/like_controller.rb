class LikeController < ApplicationController
  def create
    unless current_user
      redirect_to session_new_path
    else
      gossip_id = params[:gossip_id]
      user_like = Like.create(gossip_id: gossip_id, user_id: current_user.id )

      redirect_to "/gossip/#{gossip_id}"
    end
  end


  def destroy
    unless current_user
      redirect_to session_new_path
    else
      Like.find_by(user_id: current_user.id, gossip_id: params[:id]).destroy
      redirect_to "/gossip/#{params[:id]}"


    end      
  end

  def show
  end
end

