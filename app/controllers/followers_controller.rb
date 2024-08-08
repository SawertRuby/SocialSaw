class FollowersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile
    def create
        current_user.profile.follow(@profile)
        redirect_to @profile, notice: 'Successfully followed!'
      end
    
      def destroy
        current_user.profile.unfollow(@profile)
        redirect_to @profile, notice: 'Successfully unfollowed!'
      end

      def set_profile
        @profile = Profile.find_by(id: params[:profile_id])
      end
end

