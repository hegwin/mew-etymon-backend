class QueryWordJob < ApplicationJob
  queue_as :default

  def perform(id, dict = IcibaService)
    word = Word.find(id)
    meaning = dict.query(word.spelling&.strip)
    return if meaning.nil?

    word.update_attributes meaning: meaning
  end
end
