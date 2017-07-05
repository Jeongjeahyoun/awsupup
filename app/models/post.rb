class Post < ActiveRecord::Base
    has_many :replies
    validates :title, presence: { message: "제목써라 임마" }
end
