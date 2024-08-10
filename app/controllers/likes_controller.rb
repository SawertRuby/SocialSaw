class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_likeable
    
    def create
      like = @likeable.like.find_or_initialize_by(profile: current_user.profile)
  
      # Если тип лайка совпадает, удаляем лайк (то есть снимаем его)
      if like.persisted? && like.like_type == params[:like_type].to_i
        like.destroy
      else
        # Иначе обновляем или создаем новый лайк/дизлайк
        like.update(like_type: params[:like_type].to_i)
      end
  
      redirect_back(fallback_location: root_path)
    end
  
    private
  
    def set_likeable
      @likeable = if params[:post_id]
                    Post.find(params[:post_id])
                  elsif params[:comment_id]
                    Comment.find(params[:comment_id])
                  end
    end
  end
  
