module ApplicationHelper
  def link_rel(model, user_id)
    "/api/v1/#{model}?filter[user_id]=#{user_id}"
  end
end

