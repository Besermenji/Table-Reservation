class TablesController < ApplicationController
  before_action :set_restaurant
  before_action :set_table, only: [:show, :edit, :update, :destroy]
  before_action only: [:show, :edit, :update, :destroy, :new] do
    restaurant_authorization(@restaurant)
  end

  def index
    @tables = @restaurant.tables.all
  end

  def new
    @table = @restaurant.tables.new
  end

  def create
    @table = @restaurant.tables.create(table_params)
    if @table.save
      name = @table.name
      redirect_to @restaurant 
      flash[:notice] = "Table #{name} created"
    else
      render 'new'
      flash[:error] = "Unable to create table. Please try again"
    end
  end

  def destroy
    @table = @restaurant.tables.find(params[:id])
    @table.destroy
    redirect_to @restaurant
  end

  def edit
    @table = @restaurant.tables.find(params[:id])
  end

  def update
    @table = @restaurant.tables.find(params[:id])
    @table.update table_params
    if @table.save
      flash[:notice] = "Your table was updated succesfully"
      redirect_to @restaurant 
    else
      render 'edit'
    end
  end


  private 
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_table
    @table = @restaurant.tables.find(params[:id])
  end

  private

    def table_params
      params.require(:table).permit(:name,:no_chairs, :delete, :lock_version)
    end

end
