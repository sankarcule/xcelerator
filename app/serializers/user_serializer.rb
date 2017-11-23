
# @attr [integer] id
# @attr [string] email

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
end
