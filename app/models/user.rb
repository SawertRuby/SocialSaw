class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one :profile, dependent: :destroy
         after_create :create_profile
  accepts_nested_attributes_for :profile


  def create_profile
    base_username = email.split('@').first
    unique_username = generate_unique_username(base_username)
    
    build_profile(username: unique_username)
    save
  end

  private

  def generate_unique_username(base_username)
    username = base_username
    counter = 1

    # Проверяем, существует ли уже такой username
    while Profile.exists?(username: username)
      username = "#{base_username}#{counter}"
      counter += 1
    end

    username
  end
end
