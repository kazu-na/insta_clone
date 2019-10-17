class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :edit_pass, :update, :destroy]
  before_action :correct_user,   only: [:edit, :edit_pass, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "メールを確認してアカウントを有効にしてください。"
      redirect_to root_url
    else
      render 'new'
    end
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

  private

    def user_params
      params.require(:user).permit(:name, :username, :email,
                                   :password, :password_confirmation,
                                   :sex, :introduce, :website,
                                   :phone)
    end

    # beforeアクション

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end

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