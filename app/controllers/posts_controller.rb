class PostsController < ApplicationController
  load_and_authorize_resource :only => [:destroy]
  def create
    debugger	
    params[:post]
  end
end
