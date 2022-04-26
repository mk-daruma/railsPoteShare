class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def account
 
  end

  def profile
  end

  def update
    if @user.update(params.require(:user).permit(:user_image ,:name, :introduction))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to:root
    else
      flash[:notice] = "プロフィールの更新ができませんでした。"
      render"profile"
    end
  end
end
