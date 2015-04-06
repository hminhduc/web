json.array!(@events) do |event|
  json.extract! event, :id
  json.title event.状態名
  json.description event.場所名
  json.start event.開始
  json.end event.終了
  json.url edit_event_url(event, format: :html)
end