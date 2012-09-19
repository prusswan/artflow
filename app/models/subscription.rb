class Subscription < ActiveRecord::Base
  belongs_to :plan
  belongs_to :client

  after_create :increment_subscription!

  attr_accessible :plan_id

  def increment_subscription!
    track! :subscriptions
  end
end
