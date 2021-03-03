# == Schema Information
#
# Table name: review_comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  review_id  :integer
#  user_id    :integer
#
class ReviewComment < ApplicationRecord

  belongs_to(:review, { :required => false, :class_name => "Review", :foreign_key => "review_id" })

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  validates(:comment, { :presence => true })

  

end
