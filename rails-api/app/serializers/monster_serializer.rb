class MonsterSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :level,
             :active
end
