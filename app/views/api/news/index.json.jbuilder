json.news do
  json.partial! 'api/shared/item', collection: @news, as: :item
end