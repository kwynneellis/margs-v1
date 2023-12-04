class EnquiriesController < ApplicationController
  before_action :set_property, only: %i[new create index]

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

  private

  def set_property
    @property = Property.find(params[:property_id])
  end

  def enquiry_params
    params.require(:enquiry).permit(:first_name, :last_name, :email, :check_in, :check_out, :guests, :with_pets, :message)
  end
end
