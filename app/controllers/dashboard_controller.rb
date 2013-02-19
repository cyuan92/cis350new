class DashboardController < ApplicationController
  before_filter :authenticate_patient!
  def index
  end
end
