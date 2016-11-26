json.array! @game_queues do |game_queue|
  json.id game_queue.id
  json.name game_queue.name
  json.description game_queue.description
end
