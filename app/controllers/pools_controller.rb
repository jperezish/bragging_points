class PoolsController < ApplicationController
  def index
    @pools = Pool.all
  end

  def show
  @pool = Pool.find(params[:id])
  end

  def edit
    
  end
end
