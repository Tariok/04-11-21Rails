class CommentController < ApplicationController
  def new()
  end

  def create()    
    @content = params[:comment_content]
    @gossip_id = params[:gossip_id]
    @comment = Comment.new(content: @content, gossip_id: @gossip_id, user_id: User.all.sample.id)
      
      if @comment.save # essaie de sauvegarder en base @gossip
          # sleep 5
          redirect_to gossip_path(@gossip_id)
      
      else
        # render "/gossip/new"
        render :action => :new
        
        #render new_gossip_path(@gossip)  
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(content: params["comment_content"])
      redirect_to gossip_path(@comment.gossip_id), alert: "Your resume is saved!"
    else
      render 'edit', alert: "Oops! There was a problem, please try again"
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@comment.gossip_id)
  end


end

