json.news do
  json.partial! 'api/news/news', news: @news
end