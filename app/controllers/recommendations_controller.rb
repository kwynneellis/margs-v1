class RecommendationsController < ApplicationController
  before_action :set_property, only: %i[new create index show destroy]

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.property = @property
    if @recommendation.save
      redirect_to property_recommendations_path(@property)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @recommendations = Recommendation.all
  end

  private

  def set_property
    @property = Property.find(params[:property_id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:title, :subtitle, :description, :embedded_map, :type)
  end
end
