class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :author, class_name: "User"

  validates :project_id, :name, :description, presence:  true
  validates :description, length: { minimum: 10 }
end
