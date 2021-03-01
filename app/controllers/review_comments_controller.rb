class ReviewCommentsController < ApplicationController
  def index
    matching_review_comments = ReviewComment.all

    @list_of_review_comments = matching_review_comments.order({ :created_at => :desc })

    render({ :template => "review_comments/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_review_comments = ReviewComment.where({ :id => the_id })

    @the_review_comment = matching_review_comments.at(0)

    render({ :template => "review_comments/show.html.erb" })
  end

  def create
    the_review_comment = ReviewComment.new
    the_review_comment.comment = params.fetch("query_comment")
    the_review_comment.user_id = session[:user_id]
    the_review_comment.review_id = params.fetch("query_review_id")

    if the_review_comment.valid?
      the_review_comment.save
      redirect_to("/reviews/"+the_review_comment.review_id.to_s, { :notice => "Review comment created successfully." })
    else
      redirect_to("/reviews/"+the_review_comment.review_id.to_s, { :notice => "Review comment failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_review_comment = ReviewComment.where({ :id => the_id }).at(0)

    the_review_comment.comment = params.fetch("query_comment")
    the_review_comment.user_id = params.fetch("query_user_id")
    the_review_comment.review_id = params.fetch("query_review_id")

    if the_review_comment.valid?
      the_review_comment.save
      redirect_to("/review_comments/#{the_review_comment.id}", { :notice => "Review comment updated successfully."} )
    else
      redirect_to("/review_comments/#{the_review_comment.id}", { :alert => "Review comment failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_review_comment = ReviewComment.where({ :id => the_id }).at(0)

    the_review_comment.destroy

    redirect_to("/review_comments", { :notice => "Review comment deleted successfully."} )
  end
end
