class UserSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :number,
    :age,
    :email,
    :specialization
end
