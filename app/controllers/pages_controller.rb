class PagesController < ApplicationController
  def home
    if current_user
      redirect_to profile_path
    end
  end
end
