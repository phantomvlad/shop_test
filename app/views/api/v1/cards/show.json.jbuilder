json.data do
  json.id "#{@card.id}"
  json.type @table_name
  json.attributes do
    json.bonuses @card.bonuses
  end

  json.relationships do
    json.user do
      json.links do
        json.related link_rel_no_filter("users", @card.user_id)
      end
    end

    json.shops do
      json.links do
        json.related link_rel_no_filter("shops", @card.shop_id)
      end
    end
  end
end

@meta = {}
json.meta @meta
