class ProfilesController < ApplicationController
    before_action :authenticate_user!
  before_action :set_profile, only: [:edit, :update]
before_action :authorize_user!, only: [:edit, :update]
  def new
    @profile = current_user.build_profile
  end
    
  def edit
    # Отобразить форму для редактирования профиля
  end

  def show
    @profile = Profile.find(params[:id])
    @posts = @profile.post
    end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to edit_profile_path(@profile), notice: 'Профиль успешно создан.'
    else
      render :new
    end
  end



  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: 'Профиль успешно обновлен.'
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.profile || current_user.create_profile
  end

  def profile_params
    params.require(:profile).permit(:username, :description, :avatar)
  end

  def my_posts
    @profile = current_user.profile
    @posts = @profile.posts
    render :show
  end

  def authorize_user!
    unless @profile == current_user.profile
      redirect_to @profile, alert: 'You are not authorized to edit this post.'
    end
  end
end
