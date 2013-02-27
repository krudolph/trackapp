class Project < ActiveRecord::Base

  has_many :tasks, dependent: :destroy
  has_many :logs, through: :tasks

  validates :name, presence: { message: 'Please provide a name' }

  def logged
    logs.map(&:duration).sum
  end

end
