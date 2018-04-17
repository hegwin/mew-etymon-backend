Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :etymonsSearch, types[Types::EtymonType] do
    description 'A list of eymons that match the query'

    argument :spelling_cont, types.String

    resolve ->(obj, args, ctx) {
      Etymon.where('spelling ILIKE ?', "%#{args[:spelling_cont]}%")
    }
  end

  field :etymon, Types::EtymonType do
    description 'Informaton for a specified etymon'

    argument :id, !types.Int

    resolve -> (obj, args, ctx) {
      Etymon.includes(:words).find(args[:id])
    }
  end

  field :word, Types::WordType do
    description 'Information for a specified word'

    argument :id, !types.Int

    resolve -> (obj, args, ctx) {
      Word.includes(:etymons).find(args[:id])
    }
  end
end
