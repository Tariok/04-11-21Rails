class CityController < ApplicationController
  def show
    @city = City.find(params[:id])
    @city_id = params[:id]
    @city_name = @city.name


    @city_users = User.joins(:city).where(cities: {id: @city_id})
    # On cherche dans la classe User en suivant la relation "belongs_to :city" (au singulier)
    # et on cherche dans la table des cities (au pluriel) les id qui correspondent au @city_id

    @city_all_gossips = Gossip.joins(:user).where(users: { city_id: @city_id })





  end
end
