class Challenge < ActiveRecord::Base
  validates_presence_of :model_name

  def model
    model_name.titleize
  end

  def model_file_name
    "#{table_name.singularize}.rb"
  end

  def table_name
    model_name.tableize
  end

  def migration_name
    "Create#{model_name.pluralize}"
  end

  def migration_file_name
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    "#{timestamp}_#{migration_name.tableize}.rb"
  end

  def controller_name
    "#{model_name.pluralize}Controller"
  end

  def controller_file_name
    "#{model_name.tableize}_controller.rb"
  end

  def views_folder_name
    table_name
  end

  def self.questions
    [ :model_file_name, :table_name, :migration_name,
      :controller_name, :controller_file_name, :views_folder_name ]
  end
end
