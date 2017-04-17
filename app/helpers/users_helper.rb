module UsersHelper
    def any_posts(user)
        user.posts.length > 0
    end
    
    def any_comments(user)
        user.comments.length > 0
    end
end
