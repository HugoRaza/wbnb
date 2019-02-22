module ClassHelper
  def status_class(rental)
    if rental.start_date < Date.today
      "declined"
    else
      rental.status
    end
  end
end