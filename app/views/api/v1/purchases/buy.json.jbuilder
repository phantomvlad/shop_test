json.success true
json.data do
  if @amount_due % 1 == 0
    json.amount_due @amount_due.to_i
  else
    json.amount_due @amount_due
  end

  json.remaining_bonus @card.bonuses
end
