class Post < ActiveRecord::Base
    belongs_to :topic
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_many :favorites, dependent: :destroy
    after_create :creator_favorites
    after_create :email_creator


    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true
    
     
   def up_votes
     votes.where(value: 1).count
   end
 
   def down_votes
     votes.where(value: -1).count
   end
 
   def points
     votes.sum(:value)
   end
    
   default_scope { order('rank DESC') }
   
    def update_rank
     age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
     new_rank = points + age_in_days
     update_attribute(:rank, new_rank)
   end
   
   private
   
    def email_creator
        FavoriteMailer.new_post(user, self).deliver_now
    end
      
    def creator_favorites
      favorites.create!(post: self, user: user)
     end
end
