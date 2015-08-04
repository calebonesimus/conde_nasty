class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :vote_up, :vote_down, :go_to_url]

  def index
    @subreddit = SubReddit.find_by_name(params[:reddit] || "hot_reddit")
    @posts = @subreddit.posts

    # Show a no post page is no posts are assinged to this subreddit
    if @posts.empty?
      render 'no_posts'
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def show
    @comment = Comment.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to root_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote_up
    upvote = @post.up_votes.find_by_user_id(current_user.id)
    downvote = @post.down_votes.find_by_user_id(current_user.id)

    # Creates upvote if no vote is made
    if upvote.nil? && downvote.nil?
      @post.up_votes.create(:user_id => current_user.id)
      redirect_to :back
    # Removes downvote and creates upvote
    elsif upvote.nil?
      downvote.delete
      @post.up_votes.create(:user_id => current_user.id)
      redirect_to :back
    # Removes upvote if one exists
    else
      upvote.delete
      redirect_to :back
    end
  end

  def vote_down
    upvote = @post.up_votes.find_by_user_id(current_user.id)
    downvote = @post.down_votes.find_by_user_id(current_user.id)

    if downvote.nil? && upvote.nil?
      @post.down_votes.create(:user_id => current_user.id)
      redirect_to :back
    elsif downvote.nil?
      upvote.delete
      @post.down_votes.create(:user_id => current_user.id)
      redirect_to :back
    else
      downvote.delete
      redirect_to :back
    end
  end

  def go_to_url
    if current_user
      upvote = @post.up_votes.find_by_user_id(current_user.id)
      if upvote.nil?
        @post.up_votes.create(:user_id => current_user.id)
        redirect_to @post.url
      else
        redirect_to @post.url
      end
    else
      redirect_to @post.url
    end
  end

  def must_sign_in
    flash.alert = "You must be signed in to do that."
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :url, :sub_reddit_id, :user_id)
    end
end
