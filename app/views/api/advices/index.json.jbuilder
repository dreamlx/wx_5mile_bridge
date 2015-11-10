json.advices do
  json.partial! 'api/shared/item', collection: @advices, as: :item
end