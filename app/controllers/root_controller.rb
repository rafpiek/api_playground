class RootController < ApplicationController
  def index
    render json: { message: 'Welcome to the Rails API!'}
  end
end
