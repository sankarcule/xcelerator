class V1::TopicsOfInterestController < V1::ApiController
  before_action :require_login

  def index
    json_response(current_user.topics_of_interests)
  end

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
