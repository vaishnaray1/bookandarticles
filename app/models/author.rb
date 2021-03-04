# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  bio        :text
#  birthdate  :date
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Author < ApplicationRecord

  has_many(:books_articles, { :class_name => "BooksArticle", :foreign_key => "author_id", :dependent => :destroy })

  validates(:name, { :presence => true, :uniqueness=> true })

  
end
