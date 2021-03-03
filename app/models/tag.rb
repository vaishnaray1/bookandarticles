# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  tag        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  validates(:tag, { :presence => true })
  has_many(:book_articles_tags, { :class_name => "BookArticlesTag", :foreign_key => "tag_id", :dependent => :destroy })

  has_many(:review_tags, { :class_name => "ReviewTag", :foreign_key => "tag_id", :dependent => :destroy })

  validates(:tag, { :presence => true })
  validates(:tag, { :uniqueness => true })
end
