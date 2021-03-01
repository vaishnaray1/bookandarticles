# == Schema Information
#
# Table name: reviews
#
#  id              :integer          not null, primary key
#  notes           :text
#  rating          :integer
#  recommend       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  book_article_id :integer
#  user_id         :integer
#
class Review < ApplicationRecord
  has_many(:review_comments, { :class_name => "ReviewComment", :foreign_key => "review_id", :dependent => :destroy })

  has_many(:review_tags, { :class_name => "ReviewTag", :foreign_key => "review_id", :dependent => :destroy })

  belongs_to(:book_article, { :required => false, :class_name => "BooksArticle", :foreign_key => "book_article_id" })

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  validates(:recommend, { :presence => true })

  validates(:rating, { :presence => true })
  validates(:book_article_id, { :presence => true })
  
end
