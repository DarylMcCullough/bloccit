class PostsController < ApplicationController
   before_action :require_sign_in, except: :show
   before_action :authorize_user, except: [:show, :new, :create]

  def show
         @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def edit
         @post = Post.find(params[:id])
  end
  
  def update
     @post = Post.find(params[:id])
     @post.assign_attributes(post_params)
     @topic = Topic.find(params[:topic_id])
 # #35
     @post.topic = @topic
 
     if @post.save
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
     end
  end
  
  def create
     @post = Post.new

     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.build(post_params)
     @post.user = current_user
     
     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to [@post.topic, @post]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :new
     end
  end
  
  def destroy
     @post = Post.find(params[:id])
 
 # #8
     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
        redirect_to @post.topic
    else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
  end
  
private
 
   def post_params
     params.require(:post).permit(:title, :body)
   end
   
      def authorize_user
     post = Post.find(params[:id])
 # #11
     unless current_user == post.user || current_user.admin?
       flash[:alert] = "You must be an admin to do that."
       redirect_to [post.topic, post]
     end
   end
   
end
