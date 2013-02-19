class HomeController < ApplicationController
  def index
    if patient_signed_in?
      redirect_to :controller => 'dashboard', :action => 'index'
    elsif therapist_signed_in?
      redirect_to :controller => 'therapist_dashboard', :action => 'index'
    end
  end
end
