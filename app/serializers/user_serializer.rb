class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
 
  has_many :wineries
  has_many :bottles
end
