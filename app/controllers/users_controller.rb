class UsersController < ApplicationController

  # user一覧を表示
  def index
    @users = User.all.page(params[:page]) #ページネーション
  end

  def show
    @User = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save #ユーザー登録成功時
        flash[:success] = 'ゆーざーをとうろくしました'
        redirect_to @user
      else #ユーザー登録失敗時
        flash.now[:danger] = 'ゆーざーのとうろくにしっぱいしました'
        render :new
      end
  end

  # ストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
