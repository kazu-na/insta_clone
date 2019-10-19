class StaticPagesController < ApplicationController
  def top
    @feed_items = current_user.feed.paginate(page: params[:page]) if logged_in?
  end
end
