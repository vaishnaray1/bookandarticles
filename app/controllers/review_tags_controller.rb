class ReviewTagsController < ApplicationController
  def index
    matching_review_tags = ReviewTag.all

    @list_of_review_tags = matching_review_tags.order({ :created_at => :desc })

    render({ :template => "review_tags/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_review_tags = ReviewTag.where({ :id => the_id })

    @the_review_tag = matching_review_tags.at(0)

    render({ :template => "review_tags/show.html.erb" })
  end

  def create
    the_review_tag = ReviewTag.new
    the_review_tag.tag_id = params.fetch("query_tag_id")
    the_review_tag.review_id = params.fetch("query_review_id")

    if the_review_tag.valid?
      the_review_tag.save
      redirect_to("/review_tags", { :notice => "Review tag created successfully." })
    else
      redirect_to("/review_tags", { :notice => "Review tag failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_review_tag = ReviewTag.where({ :id => the_id }).at(0)

    the_review_tag.tag_id = params.fetch("query_tag_id")
    the_review_tag.review_id = params.fetch("query_review_id")

    if the_review_tag.valid?
      the_review_tag.save
      redirect_to("/review_tags/#{the_review_tag.id}", { :notice => "Review tag updated successfully."} )
    else
      redirect_to("/review_tags/#{the_review_tag.id}", { :alert => "Review tag failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_review_tag = ReviewTag.where({ :id => the_id }).at(0)

    the_review_tag.destroy

    redirect_to("/review_tags", { :notice => "Review tag deleted successfully."} )
  end
end
