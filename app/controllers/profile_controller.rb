class ProfileController < ApplicationController
  def show
    
      received_id = params[:id]
      @user = User.find(received_id)
      @user_first_name = @user.first_name
      @user_last_name = @user.last_name
      @user_age = @user.age
      @user_description = @user.description
      user_city_id = @user.city_id
      @user_city = City.find(user_city_id)
      @user_email = @user.email

  end
end
