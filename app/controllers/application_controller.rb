class ApplicationController < ActionController::Base
  include Pundit

  before_action :set_paper_trail_whodunnit
end
