class CreateBooksArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :books_articles do |t|
      t.string :title
      t.string :url
      t.date :date_published
      t.text :description
      t.string :genre
      t.integer :author_id

      t.timestamps
    end
  end
end
