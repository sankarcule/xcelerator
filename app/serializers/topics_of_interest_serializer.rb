# @attr [integer] id
# @attr [string] topic_name
# @attr [string] short_desc

class TopicsOfInterestSerializer < ActiveModel::Serializer
  attributes :id, :topic_name, :short_desc
end
