Types::LanguageType = GraphQL::ObjectType.define do
  name 'Language'

  field :id, types.Int
  field :name, types.String
  field :name_cn, types.String
  field :period, types.String
  field :description, types.String

  field :parent_id, types.Int
  field :parent, types[Types::LanguageType]
  field :parent_language_name, types.String do
    resolve -> (obj, args, ctx) {
      obj.parent&.name
    }
  end
  field :children, types[Types::LanguageType]
end
