class EnquiriesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :set_property, only: %i[new create index show destroy]
  before_action :set_enquiry, only: %i[show destroy]

  def new
    @enquiry = Enquiry.new
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)
    @enquiry.property = @property
    if @enquiry.save
      redirect_to property_path(@property)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @enquiries = Enquiry.all
  end

  def show
  end

  def destroy
    @enquiry.destroy

    redirect_to property_enquiries_path(property_id: @property.id), status: :see_other
  end

  private

  def set_property
    @property = Property.find(params[:property_id])
  end

  def set_enquiry
    @enquiry = Enquiry.find(params[:id])
  end

  def enquiry_params
    params.require(:enquiry).permit(:first_name, :last_name, :email, :mobile, :check_in, :check_out, :guests, :with_pets, :message, :referral)
  end
end
