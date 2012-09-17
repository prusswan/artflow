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

  validates :name, :description, :revision, :file_content_type,
            :project_id, :estimate_id, presence: true

  delegate :campaign, to: :project

  scope :active, conditions: 'status != "completed"'
  scope :pending_approval, conditions: {status: 'awaiting_approval'}
  scope :approved, conditions: {status: 'approved'}

  before_validation :copy_client_id, on: :create
  before_validation :set_defaults

  after_create :notify_created

  attr_accessible :name, :file, :stage, :revision, :hours, :description, :designer, :status,
                  :color_space, :bleed, :ad_dimensions

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
    # status == 'awaiting_approval'
    true
  end

  def file_type
    file.content_type
  end

  private
    def copy_client_id
      write_attribute(:client_id, project.client_id)
    end

    def set_defaults
      self.revision = 1 unless revision
      self.file_content_type = 'placeholder' unless file_content_type
      self.estimate = Estimate.create unless estimate
    end

    def notify_created
      Notifier.creation_added(self).deliver
    end
end
