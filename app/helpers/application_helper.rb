#encoding: utf-8
module ApplicationHelper
  def is_active(i)
    return 'active' if is_active_page(i)
  end
  def is_active_page(i)
    case i
    when 0
      return params[:action] == 'index'
    when 1
      return params[:action] == 'select'
    when 2
      return params[:action] == 'create'
    end
  end
end
