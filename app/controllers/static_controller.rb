class StaticController < ApplicationController
  def index
    @random_number= rand(10000)
    @user = User.first
    @all_gossips_array = Gossip.all

  end
  
  def team
  end

  def conta
  end
end
