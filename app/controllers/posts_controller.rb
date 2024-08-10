class PostsController < ApplicationController
    before_action :authenticate_user!   
    before_action :set_profile
    before_action :authorize_user!, only: [:edit, :update]
    def index
        @posts = Post.all
      end
      def edit
        set_post
        # Отобразить форму для редактирования профиля
      end
    def show
        @post = Post.find(params[:id])
        @comments = @post.comment
        @comment = @post.comment.build
        @likes_count = @post.like.where(like_type: 1).count
        @dislikes_count = @post.like.where(like_type: -1).count
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


      def update
        set_post
        if @post.update(post_params)
          redirect_to @post, notice: 'Post was successfully updated.'
        else
          render :edit
        end

      end


      private
    def set_post
    @post = Post.find(params[:id])
    end
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

      def authorize_user!
        set_post
        unless @post.profile == current_user.profile
          redirect_to @post, alert: 'You are not authorized to edit this post.'
        end
      end
end
