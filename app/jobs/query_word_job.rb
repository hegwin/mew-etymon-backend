class QueryWordJob < ApplicationJob
  queue_as :default

  def perform(id)
    word = Word.find(id)
    word.query_meaning! if word
  end
end
