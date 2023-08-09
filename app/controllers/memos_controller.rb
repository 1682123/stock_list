class MemosController < ApplicationController
  def index
    # ログインユーザーの投稿のみの表示
    @user_memos = current_user.memos.order("created_at DESC")
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.create(memo_params)
    if @memo.save
      redirect_to memos_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def memo_params
    params.require(:memo).permit(:title, :memo).merge(user_id: current_user.id)
  end

end
