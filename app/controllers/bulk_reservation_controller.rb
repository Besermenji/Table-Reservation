# a class that is used for reserving tables in bulks
class BulkReservationController < ApplicationController
  before_action :set_restaurant
  before_action :set_start_end_time

  def bulk_reserve
    if are_reservable?
      @restaurant.tables.find_each do |table|
        next unless params[('table ' << table.id.to_s).to_sym]
        create_booking(table)
      end
      create_rating
      redirect_to guest_index_path
    else
      redirect_to @restaurant
    end
  end

  private

  # set the restaurant instance variable
  #   to the current restaurant from the view
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # creates new booking for given table
  def create_booking(table)
    booking = Booking.new(table_id: table.id,
                          start_time: @start_date,
                          end_time: @end_date,
                          length: params[:hours],
                          user_id: current_user.id)
    booking.table = table
    booking.save
  end

  # sets the object that represents starting time
  #   of the reservation
  def set_start_end_time
    @start_date = Time.zone.local(*params[:reservation].sort.map(&:last)
      .map(&:to_i))
    @end_date = @start_date + params[:hours].to_i.hours
  end

  # returns true if all tables can be reserved
  #   else, returns false
  def are_reservable?
    reservable = true
    @restaurant.tables.find_each do |table|
      table.bookings.find_each do |booking|
        next unless @end_date.between?(booking.start_time, booking.end_time) ||
                    @start_date.between?(booking.start_time, booking.end_time)
        reservable = false
      end
    end
    reservable
  end

  def create_rating
    Rating.create(rating: nil,
                  visitor_id: current_user.id,
                  visited_id: @restaurant.id,
                  visited_date: @start_date)
  end
end
