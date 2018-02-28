Types::EtymonType = GraphQL::ObjectType.define do
  name "Etymon"

  field :id, !types.ID
  field :spelling, types.String
  field :meaning, types.String
  field :source, types.String
  field :evolution, types.String
  field :words, types[Types::WordType]
end
