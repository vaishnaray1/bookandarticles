class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :notes
      t.string :recommend
      t.integer :book_article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
