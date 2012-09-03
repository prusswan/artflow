class Plan < ActiveRecord::Base
  validates :name, :description, presence: true
  validates :name, uniqueness: true
  has_many :subscriptions
end
