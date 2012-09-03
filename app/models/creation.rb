class Creation < ActiveRecord::Base
  has_attached_file :file, styles: {
    thumbnail:  "100x100#",
    small:      "150x150>",
    medium:     "200x200"
  }
  belongs_to :estimate
  belongs_to :client
  belongs_to :project
  belongs_to :designer
  has_many :comments

  validates :name, :description, :project_id, presence: true

  before_validation :copy_client_id, on: :create

  attr_accessible :name, :file, :stage, :revision, :hours, :description, :designer

  def title
    name
  end

  def default_image?
    file.exists?
  end

  def default_image
    file.url(:thumbnail)
  end

  def thumbnail?
    file.exists?
  end

  def approvable?
    status == 'awaiting_approval'
  end

  def file_type
    file.content_type
  end

  private
    def copy_client_id
      write_attribute(:client_id, project.client_id)
    end
end
