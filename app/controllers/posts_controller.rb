class PostController < ApplicationController
    before_action : set_post , only : %i [show edit update destory] 
    #GET /posts or /posts.json 

    def index 
        @posts = Post.all    
    end 
    # GET  posts/1 or /posts/1.json
    def show 
    end 
    # GET /posts/new
    def new
        @post = Post.new
    end 
    # GET /posts/1/edit 
    def edit
    end
 # POST /posts or /posts.json
 def create 
    @post.save 
    format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end 
end 
 # DELETE /posts/1 or /posts/1.json
 def destory
    @post.destory
    respond_to do |format|
        ormat.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
        format.json { head :no_content }
      end
    end
private 
def set_post 
    @post = Post.find(params[:id]) 
end
 
def post_params 
    params.require(:post).permit(:title, :body, :published_at)
end
end 
