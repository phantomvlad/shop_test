json.data do
  json.id @shop.id
  json.type @table_name
  json.attributes do
    json.name @shop.name
  end

  json.relationships do
    json.cards do
      json.links do
        json.related link_rel("cards", "shop_id", @shop.id)
      end
    end

    json.users do
      json.links do
        json.related link_rel("users", "shop_id", @shop.id)
      end
    end
  end
end

json.meta do
  json.meta
end
