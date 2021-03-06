class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :edit_pass, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user,   only: [:edit, :edit_pass, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    redirect_to root_url and return unless @user.activated?
  end

  def new
    @user = User.new
  end

  def create
    auth = request.env["omniauth.auth"]
      if auth.present?
        unless @auth = Authorization.find_from_auth(auth)
          @auth = Authorization.create_from_auth(auth)
        end
      user = @auth.user
      redirect_back_or user
      else
        @user = User.new(user_params)
        if @user.save
          @user.send_activation_email
          flash[:info] = "メールを確認してアカウントを有効にしてください。"
          redirect_to root_url
        else
          render 'new'
        end
      end
  end

  #認証に失敗した際の処理
  def auth_failure 
    render 'new'
  end

  def edit
  end

  def edit_pass
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールを更新しました！"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :username, :email,
                                   :password, :password_confirmation,
                                   :sex, :introduce, :website,
                                   :phone, :image_name)
    end

    # beforeアクション

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
