class AddBoAtoBookArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :books_articles, :BoA, :string
  end
end
