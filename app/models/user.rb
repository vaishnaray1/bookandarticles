# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  validates(:name, { :presence => true })
  has_many(:reviews, { :class_name => "Review", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:review_comments, { :class_name => "ReviewComment", :foreign_key => "user_id", :dependent => :destroy })



end
