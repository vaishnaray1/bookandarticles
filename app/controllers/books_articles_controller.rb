class BooksArticlesController < ApplicationController
  def index
    matching_books_articles = BooksArticle.all

    @list_of_books_articles = matching_books_articles.order({ :created_at => :desc })

    render({ :template => "books_articles/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_books_articles = BooksArticle.where({ :id => the_id })

    @the_books_article = matching_books_articles.at(0)

    render({ :template => "books_articles/show.html.erb" })
  end

  def create
    the_books_article = BooksArticle.new
    if params.fetch("query_genre") =="Other"
      the_books_article.genre = params.fetch("other_genre")
    else
      the_books_article.genre = params.fetch("query_genre")
    end
    the_books_article.title = params.fetch("query_title")
    the_books_article.url = params.fetch("query_url")
    the_books_article.date_published = params.fetch("query_date_published")
    the_books_article.description = params.fetch("query_description")
    the_books_article.author_id = params.fetch("query_author_id")

    if the_books_article.valid?
      the_books_article.save
      redirect_to("/books_articles", { :notice => "Books/article created successfully." })
    else
      redirect_to("/books_articles", { :alert => "Book/article failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_books_article = BooksArticle.where({ :id => the_id }).at(0)

    the_books_article.title = params.fetch("query_title")
    the_books_article.url = params.fetch("query_url")
    the_books_article.date_published = params.fetch("query_date_published")
    the_books_article.description = params.fetch("query_description")
    the_books_article.genre = params.fetch("query_genre")
    the_books_article.author_id = params.fetch("query_author_id")

    if the_books_article.valid?
      the_books_article.save
      redirect_to("/books_articles/#{the_books_article.id}", { :notice => "Books article updated successfully."} )
    else
      redirect_to("/books_articles/#{the_books_article.id}", { :alert => "Books article failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_books_article = BooksArticle.where({ :id => the_id }).at(0)

    the_books_article.destroy

    redirect_to("/books_articles", { :notice => "Books article deleted successfully."} )
  end
end
