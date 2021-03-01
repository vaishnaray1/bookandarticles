class AuthorsController < ApplicationController
  def index
    matching_authors = Author.all

    @list_of_authors = matching_authors.order({ :created_at => :desc })

    render({ :template => "authors/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_authors = Author.where({ :id => the_id })

    @the_author = matching_authors.at(0)

    render({ :template => "authors/show.html.erb" })
  end

  def create
    the_author = Author.new
    the_author.name = params.fetch("query_name")
    the_author.birthdate = params.fetch("query_birthdate")
    the_author.bio = params.fetch("query_bio")

    if the_author.valid?
      the_author.save
      redirect_to("/authors", { :notice => "Author created successfully." })
    else
      redirect_to("/authors", { :alert => "Author failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_author = Author.where({ :id => the_id }).at(0)

    the_author.name = params.fetch("query_name")
    the_author.birthdate = params.fetch("query_birthdate")
    the_author.bio = params.fetch("query_bio")

    if the_author.valid?
      the_author.save
      redirect_to("/authors/#{the_author.id}", { :notice => "Author updated successfully."} )
    else
      redirect_to("/authors/#{the_author.id}", { :alert => "Author failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_author = Author.where({ :id => the_id }).at(0)

    the_author.destroy

    redirect_to("/authors", { :notice => "Author deleted successfully."} )
  end
end
