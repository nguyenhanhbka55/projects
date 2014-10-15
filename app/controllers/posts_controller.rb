class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    #render json: @posts
  end

 
  def show
    render json: @post
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end
    
  def create
    @post = Post.new(post_params)    
      if @post.save       
       redirect_to action: :index, notice: 'Post was successfully created'       
      else        
        render action: 'new', notice: 'unprocessable_entity'       
      end
  end

 
  
  def update    
      if @post.update(post_params)      
       render json: @post
      else
        flash[:notice] = 'Post was updated'
      end    
  end

  def destroy
    @post.destroy    
    flash[:notice] = "Post deleted"
    redirect_to posts_url    
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end  

    def post_params
      params.require(:post).permit(:subject, :content, :published_at)
    end

end
