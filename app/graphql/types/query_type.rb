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
end
