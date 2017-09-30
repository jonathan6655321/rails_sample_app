class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if logged_in?
    @feed_items = current_user.feed.paginate(page: params[:page]) unless current_user.nil?
  end

  def help
  end

  def about
  end

  def contact
  end

end
