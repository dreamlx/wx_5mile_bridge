json.news do
  json.partial! 'api/shared/item', item: @news
end