class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home recommendations]

  def home
  end

  def about
  end

  def contact
  end

  def recommendations
  end
end
