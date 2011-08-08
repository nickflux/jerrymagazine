class ContributorsController < ApplicationController
  
  caches_page :index, :show
  
  def index
    
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end