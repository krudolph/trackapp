module LogsHelper

  def format_logged(total)
    format("%02d:%02d:%02d", total/(60 * 60), (total/60) % 60, total % 60)
  end

end
