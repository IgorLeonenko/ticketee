class Ticket < ActiveRecord::Base
  belongs_to :project

  validates :project_id, :name, :description, presence:  true
  validates :description, length: { minimum: 10 }
end
