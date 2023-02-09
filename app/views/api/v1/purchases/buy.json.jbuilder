json.success true
json.data do
  if @result[0] % 1 == 0
    json.amount_due @result[0].to_i
  else
    json.amount_due @result[0]
  end

  json.remaining_bonus @result[1].bonuses
end
