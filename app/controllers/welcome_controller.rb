class WelcomeController < ApplicationController
 
  def index
    @user_name = User.find(session[:user_id])
    

    puts "_______________________________________________"

    puts session[:user_id]
    puts "Utilisateur"
    puts @user_name

    puts "_______________________________________________"


  end


end
