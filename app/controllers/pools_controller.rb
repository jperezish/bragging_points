class PoolsController < ApplicationController
  def index
    @pools = Pool.all
  end

  def show
  @pool = Pool.find(params[:id])
  end

  def edit
    @pool = Pool.find(params[:id])
  end

  def update
    @pool = Pool.find(params[:id])
    @pool.update(pool_params)
    redirect_to @pool
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.save
    redirect_to @pool
  end

  def destroy
    @pool = Pool.find(params[:id])
    @pool.destroy
    redirect_to pools_url
  end

private

  def pool_params
    params.require(:pool).permit(:name, :status)
  end
end
