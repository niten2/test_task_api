10.times do

  Post.seed do |post|
    post.title = Faker::Company.name
    post.body = Faker::Hipster.sentence
    post.user_id = 1
  end

end

5.times do

  Post.seed do |post|
    post.title = Faker::Company.name
    post.body = Faker::Hipster.sentence
    post.user_id = 2
  end

end

15.times do

  Post.seed do |post|
    post.title = Faker::Company.name
    post.body = Faker::Hipster.sentence
    post.user_id = 3
  end

end

