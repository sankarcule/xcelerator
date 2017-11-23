class V1::TopicsOfInterestController < V1::ApiController
  before_action :require_login

  # Returns the list of user interests
  #
  # @response_status 201
  # @response_root topics_of_interest
  # @response_class Array<TopicsOfInterestSerializer>

  def index
    json_response(current_user.topics_of_interests)
  end

  # Create user interest
  #
  # @body_parameter [integer] id
  # @body_parameter [string] topic_name
  # @body_parameter [string] short_desc
  #
  # @response_class TopicsOfInterestSerializer


  def add
    interests = params[:topics_of_interests]
    interests.each do |topic|
      current_user.users_interests.create!(topics_of_interest_id: topic)
    end
    json_response(current_user.topics_of_interests)
  end

  def remove
    interests = params[:topics_of_interests]
    interests.each do |topic|
      current_user.users_interests.where(topics_of_interest_id: topic).first.destroy!
    end
    json_response(current_user.topics_of_interests)
  end
end
