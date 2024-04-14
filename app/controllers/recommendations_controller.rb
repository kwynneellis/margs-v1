class RecommendationsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  before_action :set_property, only: %i[new create index show edit update destroy]
  before_action :set_recommendation, only: %i[edit update show destroy]

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

  def edit
  end

  def update
    @recommendation.update(recommendation_params)

    redirect_to property_recommendations_path(@property)
  end

  def destroy
    @recommendation.destroy

    redirect_to property_recommendations_path(@property), status: :see_other
  end

  private

  def set_property
    @property = Property.find(params[:property_id])
  end

  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:title, :subtitle, :description, :embedded_map, :recommendation_category)
  end
end
