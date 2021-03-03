# == Schema Information
#
# Table name: review_tags
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  review_id  :integer
#  tag_id     :integer
#
class ReviewTag < ApplicationRecord


  belongs_to(:review, { :required => false, :class_name => "Review", :foreign_key => "review_id" })

  belongs_to(:tag, { :required => false, :class_name => "Tag", :foreign_key => "tag_id" })

  validates(:review_id, { :presence => true })
  validates(:tag_id, { :presence => true })
end
