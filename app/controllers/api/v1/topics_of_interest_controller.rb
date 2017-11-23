class Api::V1::TopicsOfInterestController < Api::V1::ApiController
  before_action :require_login

  # Returns the list of user interests
  #
  # @query_parameter [string] token
  # @response_class Array<TopicsOfInterestSerializer>

  def index
    json_response(current_user.topics_of_interests)
  end

  # Create user interest
  #
  # @query_parameter [string] token
  # @query_parameter [string] interests
  #
  # @response_class TopicsOfInterestSerializer
  def add
    interests = params[:interests]
    interests.each do |topic|
      current_user.users_interests.create!(topics_of_interest_id: topic)
    end
    json_response(current_user.topics_of_interests)
  end

  # Remove user interest
  #
  # @query_parameter [string] token
  # @query_parameter [string] interests
  #
  # @response_class TopicsOfInterestSerializer
  def remove
    interests = params[:interests]
    interests.each do |topic|
      current_user.users_interests.where(topics_of_interest_id: topic).first.destroy!
    end
    json_response(current_user.topics_of_interests)
  end
end
