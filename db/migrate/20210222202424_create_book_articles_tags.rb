class CreateBookArticlesTags < ActiveRecord::Migration[6.0]
  def change
    create_table :book_articles_tags do |t|
      t.integer :tag_id
      t.integer :book_article_id

      t.timestamps
    end
  end
end
