class Post < ActiveRecord::Base
    has_many :comments
    
    def mark_spam
        if self.id % 5 == 1
            self.title = "SPAM"
        end
    end
    
    def self.mark_all_spam
        self.all.each do |post|
            post.mark_spam
        end
    end
    
end
