# == Schema Information
#
# Table name: books_articles
#
#  id             :integer          not null, primary key
#  date_published :date
#  description    :text
#  genre          :string
#  title          :string
#  url            :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :integer
#
class BooksArticle < ApplicationRecord

  belongs_to(:author, { :required => false, :class_name => "Author", :foreign_key => "author_id" })

  has_many(:reviews, { :class_name => "Review", :foreign_key => "book_article_id", :dependent => :destroy })

  has_many(:book_articles_tags, { :class_name => "BookArticlesTag", :foreign_key => "book_article_id", :dependent => :destroy })

  validates(:title, { :presence => true })

  validates(:genre, { :presence => true })
  
  validates(:description, { :presence => true })
  
  validates(:date_published, { :presence => true })

  validates(:author_id, { :presence => true })
end
