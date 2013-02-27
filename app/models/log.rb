class Log < ActiveRecord::Base

  belongs_to :task

  default_scope { order(:stop) }

  validates_presence_of :task

  def duration
    ((stop? ? stop.to_time : Time.now) - start.to_time).to_i
  end

end
