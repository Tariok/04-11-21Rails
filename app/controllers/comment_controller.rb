class CommentController < ApplicationController
  def new()
  end

  def create()    

  if current_user    
    @content = params[:comment_content]
    @gossip_id = params[:gossip_id]
    @comment = Comment.new(content: @content, gossip_id: @gossip_id, user_id: current_user.id)
      
    if @comment.save # essaie de sauvegarder en base @gossip
        # sleep 5
        redirect_to gossip_path(@gossip_id)
    
    else
      # render "/gossip/new"
      render :action => :new
      
      #render new_gossip_path(@gossip)  
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end

  else
    redirect_to session_new_path
  end
  end

  def update

    if current_user
      @comment = Comment.find(params[:id])

      if @comment.update(content: params["comment_content"])
        redirect_to gossip_path(@comment.gossip_id), alert: "Your resume is saved!"
      end
    else
      redirect_to session_new_path
    end

  end

  def destroy
    unless current_user
      redirect_to session_new_path
    else
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@comment.gossip_id)
    end
  end


end

