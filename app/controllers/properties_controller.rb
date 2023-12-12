class PropertiesController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :set_property, only: %i[show edit update]

  def index
    @properties = Property.all
  end

  def show
  end

  def edit
  end

  def update
    @property.update(property_params)

    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:address, :title, :description, :description2, :price_per_night, :minimum_nights, :cleaning_fee, :max_guests, :bedrooms, :bathrooms, :pet_friendly)
  end
end
