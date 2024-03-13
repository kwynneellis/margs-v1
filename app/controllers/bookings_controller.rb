class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  before_action :set_property, only: %i[new create index show edit update destroy]
  before_action :set_booking, only: %i[edit update show destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.property = @property
    if @booking.save
      redirect_to property_bookings_path(@property)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
  
    # For a monthly view:
    @bookings = Booking.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  
    # Or, for a weekly view:
    # @bookings = Booking.where(start_time: start_date.beginning_of_week..start_date.end_of_week)
  end

  def edit
  end

  def update
    @booking.update(booking_params)

    redirect_to property_bookings_path(@property)
  end

  def destroy
    @booking.destroy

    redirect_to property_bookings_path(@property), status: :see_other
  end

  private

  def set_property
    @property = Property.find(params[:property_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:name, :start_time, :end_time)
  end
end
