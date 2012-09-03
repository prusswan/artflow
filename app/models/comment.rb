class Comment < ActiveRecord::Base
  belongs_to :creation
  belongs_to :user, polymorphic: true

  attr_accessible :body, :user
end
