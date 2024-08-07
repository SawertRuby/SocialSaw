class PostsController < ApplicationController
    before_action :authenticate_user!   
    before_action :set_profile
    def index
        @posts = Post.all
      end
    
    def show
        @post = Post.find(params[:id])
      end
    def new
        @post = @profile.post.build
      end
    
      def create
        @post = @profile.post.build(post_params)
        if @post.save
          redirect_to @profile, notice: 'Post was successfully created.'
        else
          render :new
        end
      end
    
      private
    
      def set_profile
        if current_user.profile.nil?
          redirect_to new_profile_path, alert: 'You need to create a profile first.'
        else
          @profile = current_user.profile
        end
      end
      
    
      def post_params
        params.require(:post).permit(:description, images: [])
      end
end
