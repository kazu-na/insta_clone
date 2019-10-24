class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.page(params[:page])
      @comment = Comment.new
      @comments = @micropost.comments
    else
      redirect_to login_url
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
    @comment = Comment.new
    @comments = @micropost.comments
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました！"
      redirect_to root_url
    else
      @feed_items = []
      render '/microposts/new'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :image)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
