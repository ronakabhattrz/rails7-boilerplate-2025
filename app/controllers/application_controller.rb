class ApplicationController < ActionController::Base
  before_action :check_browser_version

  private

  def check_browser_version
    return if browser.modern?

    flash[:alert] = "Please use a modern browser for the best experience."
  end
end
