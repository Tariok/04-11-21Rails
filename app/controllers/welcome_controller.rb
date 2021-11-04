class WelcomeController < ApplicationController
  def bonjour_name
    @user_name = params[:id]  
    puts params[:id] 
  end
end
