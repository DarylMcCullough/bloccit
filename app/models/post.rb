class Post < ActiveRecord::Base
    has_many :comments
    
    def mark_spam
        if self.id % 5 == 1
            self.title = "SPAM"
        end
    end
    
    def test
        puts "Just testing"
    end
end
