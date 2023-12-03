class EnquiriesController < ApplicationController
  before_action :set_property, only: %i[new create]

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

  private

  def set_property
    @property = Property.find(params[:property_id])
  end

  def enquiry_params
    params.require(:enquiry).permit(:check_in)
  end
end
