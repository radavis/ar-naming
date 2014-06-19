class Challenge < ActiveRecord::Base
  validates_presence_of :model_name

  def table_name
    model_name.tableize
  end

  def model
    model_name.titleize
  end

  def migration_name
    "Create#{model_name.pluralize}"
  end

  def migration_file_name
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
  end


end
