 require 'random_data'

 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
  # Create Questions
 10.times do
 # #1
   Question.create!(
 # #2
     title:  "#{RandomData.random_sentence}?",
     body:   RandomData.random_paragraph,
     resolved: false
   )
 end

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
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Question.count} questions created"