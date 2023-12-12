class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[about recommendations]

  def about
  end

  def contact
  end

  def recommendations
  end
end
