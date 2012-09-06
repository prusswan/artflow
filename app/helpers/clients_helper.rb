module ClientsHelper
  def awaiting_approval_table
    simple_table_for(@client.creations.pending_approval,
                     'Name'       => :name,
                     'Revision #' => :revision,
                     'Designer'   => ->(creation) {
                       link_to(creation.designer.name, creation.designer)
                     },
                     'File Size'  => ->(creation) {
                       number_to_human_size(creation.file.size)
                     })
  end
end
