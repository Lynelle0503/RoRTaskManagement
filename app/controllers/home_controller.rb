class HomeController < ApplicationController

  def index
    if !Current.session
      redirect_to new_session_path
    end
  end
end
