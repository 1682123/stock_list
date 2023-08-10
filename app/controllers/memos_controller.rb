class MemosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_memo, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]


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
    if @memo.update(memo_params)
      redirect_to memos_path
    else
      render :edit
    end
  end

  def destroy
    @memo.destroy
    redirect_to memos_path
  end

  private
  def memo_params
    params.require(:memo).permit(:title, :memo).merge(user_id: current_user.id)
  end

  def set_memo
    @memo = Memo.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @memo.user_id
      redirect_to action: :index
    end
  end
end
