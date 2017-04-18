 class FavoriteMailer < ApplicationMailer

   def new_comment(user, post, comment)
 
     headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
   end
   
   def new_post(user, post)
 
     headers["Message-ID"] = "<posts/#{post.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"
 
     @user = user
     @post = post

     mail(to: user.email, subject: "You created a new post: #{post.title}")
   end
   
   def test_mail()
     headers["Message-ID"] = "<comments/42@your-app-name.example>"
     headers["In-Reply-To"] = "<post/27@your-app-name.example>"
     headers["References"] = "<post/76@your-app-name.example>"
 
     mail(to: "stevendaryl3016@yahoo.com", subject: "Howdy")
    end
 end