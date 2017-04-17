 class FavoriteMailer < ApplicationMailer
   default from: "stevendaryl3016@yahoo.com"

   def new_comment(user, post, comment)
 
     headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
   end
   
   def test_mail()
     headers["Message-ID"] = "<comments/42@your-app-name.example>"
     headers["In-Reply-To"] = "<post/27@your-app-name.example>"
     headers["References"] = "<post/76@your-app-name.example>"
 
     mail(to: "stevendaryl3016@yahoo.com", subject: "Howdy")
    end
 end