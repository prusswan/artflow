class Subscription < ActiveRecord::Base
  belongs_to :plan
  belongs_to :client
end
