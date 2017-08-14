module ApplicationHelper

  # Displays object errors
  def form_errors_for(object=nil)
    render('shared/form_errors', object: object) unless object.errors.count == 0
  end

end
