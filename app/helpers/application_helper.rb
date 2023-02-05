module ApplicationHelper
  def link_rel(model, name, user_id)
    "/api/v1/#{model}?filter[#{name}]=#{user_id}"
  end

  def link_rel_no_filter(model, id)
    "/api/v1/#{model}/#{id}"
  end

end

