class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    new_movie = Movie.new
    new_movie.title = params.fetch("query_title")
    new_movie.year = params.fetch("query_year")
    new_movie.duration = params.fetch("query_duration")
    new_movie.description = params.fetch("query_description")
    new_movie.image = params.fetch("query_image")
    new_movie.director_id = params.fetch("query_director_id")
    new_movie.save

    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def update
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    @the_movie.title = params.fetch("query_title")
    @the_movie.year = params.fetch("query_year")
    @the_movie.duration = params.fetch("query_duration")
    @the_movie.description = params.fetch("query_description")
    @the_movie.image = params.fetch("query_image")
    @the_movie.director_id = params.fetch("query_director_id")
    @the_movie.save

    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    redirect_to("/movies/#{the_id}")
  end

  def delete
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)
  
    @the_movie.destroy
  
    redirect_to("/movies")
  end

end
