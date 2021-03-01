# == Schema Information
#
# Table name: book_articles_tags
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  book_article_id :integer
#  tag_id          :integer
#
class BookArticlesTag < ApplicationRecord

  belongs_to(:book_article, { :required => false, :class_name => "BooksArticle", :foreign_key => "book_article_id" })

  belongs_to(:tag, { :required => false, :class_name => "Tag", :foreign_key => "tag_id" })
end
