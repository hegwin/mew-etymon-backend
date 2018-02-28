Types::WordType = GraphQL::ObjectType.define do
  name "Word"

  field :id, !types.Int
  field :spelling, types.String
  field :meaning, types.String
  field :etymon_analysis, types.String
end
