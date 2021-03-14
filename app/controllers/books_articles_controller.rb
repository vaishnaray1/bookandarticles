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
    #book
    if params.fetch("query_boa") == "Book"
      #get the book from google books
      require 'googlebooks'
      title = params.fetch("query_title")
      books = GoogleBooks.search(title)
      first_book = books.first
      
      the_books_article = BooksArticle.new
      
      the_books_article.title = first_book.title
    
      the_books_article.date_published = first_book.published_date
      the_books_article.description = first_book.description

      the_books_article.BoA = params.fetch("query_boa")

      if params.fetch("query_genre") =="Other"
        the_books_article.genre = params.fetch("other_genre")
      else
        the_books_article.genre = params.fetch("query_genre")
      end

      #look up author in author table 
      #get the first author from google books
      author = first_book.authors_array[0]
      #check if author name in author table
      author_exist = Author.where({:name => author}).at(0)
      if author_exist != nil
        the_books_article.author_id = author_exist.id
      else  
        the_author = Author.new
        the_author.name = author
        if the_author.valid?
          the_author.save
        end
        the_books_article.author_id = the_author.id
    
      end

    #article
    else
      the_books_article = BooksArticle.new
      the_books_article.BoA = params.fetch("query_boa")
      the_books_article.url = params.fetch("query_url").to_s
      the_books_article.date_published = params.fetch("query_date_published")
      the_books_article.description = params.fetch("query_description")
      the_books_article.author_id = params.fetch("query_author_id")
      the_books_article.title = params.fetch("query_title")
    end

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
