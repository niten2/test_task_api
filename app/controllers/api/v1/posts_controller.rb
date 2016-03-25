class Api::V1::PostsController < Api::V1::BaseController
  before_action :authenticate_api_v1_user!, only: [:create]

  def index
    page = params[:page]
    per_page = params[:per_page]

    @posts = Post.order('published_at DESC').paginate(page: page, per_page: per_page)
    set_header
    respond_with @posts
  end

  def show
    @post = Post.where(id: params[:id]).take

    if @post
      respond_with @post
    else
      render json: { error: "Not found" }, status: 404
    end

  end

  def create
   @post = Post.create(post_params.merge(author: current_api_v1_user.id))
   respond_with :api, :v1, @post
  end

private

  def post_params
    params.permit(:title, :body, :published_at)
  end

  def set_header
    response.headers["posts"]  = @posts.count.to_s
    response.headers["pages"]  = @posts.total_pages.to_s
  end

end
