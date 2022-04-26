class ApplicationController < ActionController::Base
before_action :set_user_id
before_action :set_q

    def after_sign_in_path_for(resource)
        root_path
    end

      # ログアウト後に遷移するpathを設定
    def after_sign_out_path_for(resource)
        root_path
    end

    def set_user_id
        @user = current_user
    end
  
    def set_q
        @q = Room.ransack(params[:q])
    end
end

