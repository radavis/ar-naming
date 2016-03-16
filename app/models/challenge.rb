class Challenge < ActiveRecord::Base
  validates :subject, presence: true

  def model
    subject.titleize
  end

  def model_file_name
    "#{table_name.singularize}.rb"
  end

  def table_name
    subject.tableize
  end

  def migration_name
    "Create#{subject.pluralize}"
  end

  def migration_file_name
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    "#{timestamp}_#{migration_name.tableize}.rb"
  end

  def controller_name
    "#{subject.pluralize}Controller"
  end

  def controller_file_name
    "#{table_name}_controller.rb"
  end

  def views_folder_name
    table_name
  end

  def self.questions
    [ :model_file_name, :table_name, :migration_name,
      :controller_name, :controller_file_name, :views_folder_name ]
  end

  def correct?(method, submission)
    send(method.to_sym) == submission
  end

  def self.approved
    where(approved: true)
  end
end
