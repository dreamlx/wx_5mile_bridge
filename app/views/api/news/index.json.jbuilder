json.news do
  json.partial! 'api/news/news', collection: @news, as: :news
end