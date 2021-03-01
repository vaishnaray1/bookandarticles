class ReviewsController < ApplicationController
  def index
    matching_reviews = Review.all
    user_id = session[:user_id]

    @list_of_reviews = matching_reviews.order({ :created_at => :desc }).where({:user_id => user_id })

    @list_of_book_articles = BooksArticle.all

    render({ :template => "reviews/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reviews = Review.where({ :id => the_id })

    @the_review = matching_reviews.at(0)

    render({ :template => "reviews/show.html.erb" })
  end

  def create
    the_review = Review.new
    the_review.rating = params.fetch("query_rating")
    the_review.notes = params.fetch("query_notes")
    the_review.recommend = params.fetch("query_recommend")
    the_review.book_article_id = params.fetch("query_book_article_id")
   
    the_review.user_id = session[:user_id]

    if the_review.valid?
      the_review.save
      redirect_to("/reviews", { :notice => "Review created successfully." })
    else
      redirect_to("/reviews", { :notice => "Review failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)

    the_review.rating = params.fetch("query_rating")
    the_review.notes = params.fetch("query_notes")
    the_review.recommend = params.fetch("query_recommend")
    the_review.book_article_id = params.fetch("query_book_article_id")
    the_review.user_id = params.fetch("query_user_id")

    if the_review.valid?
      the_review.save
      redirect_to("/reviews/#{the_review.id}", { :notice => "Review updated successfully."} )
    else
      redirect_to("/reviews/#{the_review.id}", { :alert => "Review failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)

    the_review.destroy

    redirect_to("/reviews", { :notice => "Review deleted successfully."} )
  end
end
