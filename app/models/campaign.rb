class Campaign < ActiveRecord::Base
  belongs_to :client
  has_many :projects, dependent: :destroy
  validates :name, presence: true

  attr_accessible :name, :cost, :start_date, :end_date
end
