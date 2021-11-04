class GossipController < ApplicationController


  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

   def show
     # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage

     @gossip = Gossip.joins(:likes).group('gossips.id').select('gossips.*, COUNT(*) as likes_count').find_by(id: params[:id])

     @gossip_title = @gossip.title 
     @gossip_content = @gossip.content
     @gossip_author = @gossip.find_author.first_name
     @gossip_author_id = @gossip.user_id
     @gossip_likes_counter = @gossip.likes_count
    #  likes_count vient de la requete sql ligne 10
   end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @title = ""
    @content = ""
  end

  def create
    @title = params[:gossip_title]
    @content = params[:gossip_content]
    @gossip = Gossip.new(title: @title, content: @content, user: current_user, likes_counter: 0)
      
      if @gossip.save # essaie de sauvegarder en base @gossip
          sleep 5
          redirect_to "/"
      
      else
        # render "/gossip/new"
        render :action => :new
        
        #render new_gossip_path(@gossip)  
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      end
    
    
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
  end

  def edit
    unless current_user
      redirect_to session_new_path
    else
    @gossip = Gossip.find(params[:id])
    #Récupère les valeurs pour chaque input
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    end
  end

  def update
    unless current_user
      redirect_to session_new_path
    else
      @gossip = Gossip.find(params[:id])

      # gossip_title = params.require(:gossip).permit(:title)
      # puts gossip_title
      # gossip_content = params.require(:gossip).permit(:content)
      # puts gossip_content

      gossip_params = params.require(:gossip).permit(:title, :content)
      # Pour valider les infos (sinon pas permis par Ruby)
      # require : permet de vérifier qu'une info est présente et la renvoie
      #permit: autoriser les informations pour qu'elles passent
      # @gossip.update_attributes(gossip_params)
      # puts @gossip.errors
      # redirect_to gossip_path

      if @gossip.update(title: gossip_params["title"], content: gossip_params["content"])
        redirect_to gossip_path, alert: "Your resume is saved!"
      else
        render 'edit', alert: "Oops! There was a problem, please try again"
      end
  
        
      # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
      # pour info, le contenu de ce formulaire sera accessible dans le hash params
      # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end
  end

  def destroy
    unless current_user
      redirect_to session_new_path
    else
      # Méthode qui récupère le potin concerné et le détruit en base
      # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      redirect_to '/'
    end

  end
end
