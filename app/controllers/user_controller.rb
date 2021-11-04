class UserController < ApplicationController
  skip_before_action :verify_authenticity_token

def index 
puts params  
  
end
def create  
  @first_name = params[:first_name]
  @password = params[:password]
  @city = City.find_by name: params[:city]
  @email = params[:email]
  @last_name = params[:last_name]
  @user = User.new(first_name: @first_name, last_name:@last_name, password: @password, email: @email, city: @city)

    if @user.save
      redirect_to '/'
    else
      render "index"
    end
end



end
