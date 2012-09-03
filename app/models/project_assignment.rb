class ProjectAssignment < ActiveRecord::Base
  belongs_to :designer
  belongs_to :project
end
