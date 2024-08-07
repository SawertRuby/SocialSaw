class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one :profile, dependent: :destroy
         after_create :create_profile
  accepts_nested_attributes_for :profile


  def create_profile
    build_profile(username: email.split('@').first) # Пример инициализации
    save
  end
end
