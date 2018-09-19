class TalkController < ApplicationController
  # indexを除くアクションでユーザーログインされていないユーザーはindexに飛ば
  before_action :move_to_index, except: [:index, :show]



  # トップページ画面
  def index
    @post = Post.includes(:user).order("id DESC").page(params[:page]).per(7)
  end

  # 新規投稿画面
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.update(talk_params)
    end
  end

  # ストロングパラメータ
  def create
    Post.create(text: talk_params[:text], user_id: current_user.id, image: talk_params[:image])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.includes(:user)
  end

  # privateメソッド
  private
  def talk_params
    params.permit(:text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
