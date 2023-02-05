json.data @data do |user|
  json.id user.id
  json.type @table_name
  json.attributes do
    json.email user.email
    json.negative_balance user.negative_balance
  end

  json.relationships do
    json.cards do
      json.links do
        json.related link_rel("cards", user.id)
      end
    end

    json.shops do
      json.links do
        json.related link_rel("shops", user.id)
      end
    end
  end
end

json.meta do
  json.meta
end

