class MemosController < ApplicationController
  def index
    # ログインユーザーの投稿のみの表示
    @user_memos = current_user.memos.order("created_at DESC")
  end
end
