class BookArticlesTagsController < ApplicationController
  def index
    matching_book_articles_tags = BookArticlesTag.all

    @list_of_book_articles_tags = matching_book_articles_tags.order({ :created_at => :desc })

    render({ :template => "book_articles_tags/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_book_articles_tags = BookArticlesTag.where({ :id => the_id })

    @the_book_articles_tag = matching_book_articles_tags.at(0)

    render({ :template => "book_articles_tags/show.html.erb" })
  end

  def create
    the_book_articles_tag = BookArticlesTag.new
    the_book_articles_tag.tag_id = params.fetch("query_tag_id")
    the_book_articles_tag.book_article_id = params.fetch("query_book_article_id")

    if the_book_articles_tag.valid?
      the_book_articles_tag.save
      redirect_to("/book_articles_tags", { :notice => "Book articles tag created successfully." })
    else
      redirect_to("/book_articles_tags", { :notice => "Book articles tag failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_book_articles_tag = BookArticlesTag.where({ :id => the_id }).at(0)

    the_book_articles_tag.tag_id = params.fetch("query_tag_id")
    the_book_articles_tag.book_article_id = params.fetch("query_book_article_id")

    if the_book_articles_tag.valid?
      the_book_articles_tag.save
      redirect_to("/book_articles_tags/#{the_book_articles_tag.id}", { :notice => "Book articles tag updated successfully."} )
    else
      redirect_to("/book_articles_tags/#{the_book_articles_tag.id}", { :alert => "Book articles tag failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_book_articles_tag = BookArticlesTag.where({ :id => the_id }).at(0)

    the_book_articles_tag.destroy

    redirect_to("/book_articles_tags", { :notice => "Book articles tag deleted successfully."} )
  end
end
