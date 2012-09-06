class DesignerStatus

  def initialize(designer, template, options = {})
    @designer = designer
    @template = template
    @options = options
  end

  def expanded?
    @options[:expanded]
  end

  def active_projects_count
    active_projects.count
  end

  def pending_approvals_count
    active_creations.pending_approval.count
  end

  def approved_count
    active_creations.approved.count
  end

  def active_hours
    active_projects.total_hours
  end

  def hours_per_project
    active_projects.inject({}) do |memo, project|
      memo[project] = project.total_hours
      memo
    end
  end

  def to_s
    @template.render partial: 'designers/status', object: self
  end

  private
    def active_projects
      @designer.projects.active
    end

    def active_creations
      @designer.creations.active
    end

end
