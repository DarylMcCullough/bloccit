 require 'random_data'
 
  # Create Topics
 15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

 # Create Posts
 50.times do
 # #1
   Post.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 unique_post_title = "A Very Special Title"
 unique_post_body = "What a great body!"
 
 post = Post.find_or_create_by!(
     title: unique_post_title,
     body: unique_post_body)

 another_body = "Another really great body!"

 comment = Comment.find_or_create_by!(
     body: another_body,
     post: post)
     
 puts "unique post: #{post.to_s}"
 puts "unique comment: #{comment.to_s}"

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"