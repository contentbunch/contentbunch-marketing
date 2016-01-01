module ApplicationHelper
  def flash_class(flash_type)
    case flash_type
      when 'success'
        'alert alert-success'
      when 'notice'
        'alert alert-success'
      when 'alert'
        'alert alert-danger'
    end
  end
end
