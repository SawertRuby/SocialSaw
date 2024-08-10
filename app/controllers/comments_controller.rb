class CommentsController < ApplicationController
    before_action :authenticate_user!   
    before_action :set_profile
    before_action :set_comment, only: [:destroy]

    def index
        @posts = Post.Comment.all
      end

    def create
        @post = Post.find(params[:post_id])

        @comment = @post.comment.build(comment_params)
        @comment.profile = current_user.profile 
        if @comment.save
          redirect_to @post, notice: 'Comment was successfully created.'
        else
          render :new
        end
      end
      def destroy
        if @comment.profile == current_user.profile
          @comment.soft_delete # Используем soft_delete, чтобы пометить комментарий как удаленный
          
        else
          # Если текущий пользователь не является автором комментария, перенаправляем с ошибкой
          redirect_to @post, alert: 'You are not authorized to delete this comment.'
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
    
  
    def comment_params
      params.require(:comment).permit(:title, images: [])
    end

    def set_comment
      @post = Post.find(params[:post_id])
      @comment = @post.comment.find(params[:id])
    end
  end

