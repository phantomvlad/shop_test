json.data @data do |card|
  json.id "#{card.id}"
  json.type @table_name
  json.attributes do
    json.bonuses card.bonuses
  end

  json.relationships do
    json.user do
      json.links do
        json.related link_rel_no_filter("users", card.user_id)
      end
    end

    json.shop do
      json.links do
        json.related link_rel_no_filter("shops", card.shop_id)
      end
    end
  end
end

if @flag_sum
  json.meta do
    json.stats do
      json.bonuses do
        json.sum @sum
      end
    end
  end
else
  @meta = {}
  json.meta @meta
end


