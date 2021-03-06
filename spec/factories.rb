FactoryGirl.define do
  factory :instagram_post do
    post_id "555555555"
    post_url "http://www.imapost.com"
    instagram_id 1
    posted_at Time.now
    image_url "http://www.imagehere.com"
  end

  factory :tweet_post do
    post_id "444444444"
    posted_at  Time.now
    post_url "http://www.imapost.com"
    text "I am tweeting now."
    media_url "http://www.imagehere.com"
    tweet_id 1
  end

  factory :user do
    email    "a@b.com"
    username "Ada"
    uid      "12345"
    provider "developer"
  end

  factory :instagram do
    username "Ada"
    provider_id "1356"
    user_ids 1
  end

  factory :tweet do
    username "adaninjaparty"
    provider_id "2660995584"
    user_ids 1
  end

end
