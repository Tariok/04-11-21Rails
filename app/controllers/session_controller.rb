class SessionController < ApplicationController
  def new
    # La création d'une session se fera au 
    # travers de la page de login où l'on demande 
    # mot de passe et email. 
  end

  def create
    # qui effectuera l'authentification (traitement des 
    # informations saisies dans la page login et sauvegarde de 
    # l'info de l'utilisateur connecté dans session)

    # TODO : chercher un utilisateur avec email = form_email
    user = User.find_by(email: params[:email])


    puts "__ SESSION CONTROLLER CREATE _______________________"
    puts user.first_name
    puts "_______________________________________________"
    

    puts params[:password]

   # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      # TODO : comparer le hash_form_password avec hash_user_password
      # TODO : si tout OK, stocker l'id dans la session = l'user est connecté
      session[:user_id] = user.id
      puts "_______________________________________________"

      puts "User authentifié :"
      puts current_user()
      puts session[:user_id]

      puts "_______________________________________________"


      # redirect_to '/welcome/'
      # sleep 5
      redirect_to '/'

      # redirige où tu veux, avec un flash ou pas
    else 
      # TODO : si ce n'est pas bon, rebasculer l'user sur la page de connection
      flash.now[:danger] = 'Invalid email/password combination'

      puts "_______________________________________________"

      puts "User non-authentifié :"
 
      puts "_______________________________________________"

      render 'new'
    end    
  end

  def destroy
    # qui correspond au logout

    puts "_______________________________________________"

      puts "User déconnecté"
 
      puts "_______________________________________________"

    session[:user_id] = nil
    redirect_to '/'

    puts "_______________________________________________"

      puts session[:user_id].inspect
 
      puts "_______________________________________________"
  end

end

