class SubscriptionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile, only: [:show]

    def show
        following_ids = current_user.profile.following.pluck(:followed_id)
        @posts = Post.where(profile_id: following_ids)
    end

    private
    def set_profile
        if current_user.profile.nil?
          redirect_to new_profile_path, alert: 'You need to create a profile first.'
        else
          @profile = current_user.profile
        end
      end
end
