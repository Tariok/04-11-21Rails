class StaticController < ApplicationController
  
  def index
        @all_gossips_array = Gossip.all

  end
  
  def team
  end

  def conta
  end
end
