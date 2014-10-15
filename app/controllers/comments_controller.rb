class CommentsController < ApplicationController
  #respond_to :xml, :html, :json
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    respond_with @comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    #@comment = @post.comments.new
    @comment = @post.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @post.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        redirect_to action: 'index'
        #format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        #format.json { render :show, status: :created, location: @comment }
      else
        render action: 'new'        
        #format.html { render :new }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        redirect_to action: 'show', notice: 'Comment was successfully updated'        
        #format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        #format.json { render :show, status: :ok, location: @comment }      
      else
        render action: 'edit'
        #format.html { render :edit }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    #respond_to do |format|
      #format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      #format.json { head :no_content }
    #end
    flash[:notice] = "Comments deleted"
    redirect_to comments_url
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :commente)

    end
end
