class MiscController < ApplicationController
  def homepage
    render({ :template => "misc_templates/home"})
  end

  def directors_list
    @directors = Director.all

    render({ :template => "misc_templates/directors_all" })
  end

  def find_youngest_director
    @directors = Director.all
    @youngest_director_dob = @directors.maximum(:dob)
    @youngest_director = @directors.where({ :dob => @youngest_director_dob }).first
    @youngest_director_dob = @youngest_director.dob.strftime("%B %e, %Y")

    render({ :template => "misc_templates/director_youngest" })
  end

  def find_eldest_director
    @directors = Director.all
    @eldest_director_dob = @directors.minimum(:dob)
    @eldest_director = @directors.where({ :dob => @eldest_director_dob }).first
    @eldest_director_dob = @eldest_director_dob.strftime("%B %e, %Y")

    render({ :template => "misc_templates/director_eldest" })
  end

  def find_director
    id_of_director = params.fetch("director_id")
    director_activerecordrelation = Director.where({ :id => id_of_director })
    @individual_director = director_activerecordrelation.first

    @director_filmography = Movie.where({ :director_id => id_of_director })

    render({ :template => "misc_templates/director_individual_flexible" })
  end

  def movies_list
    @movies = Movie.all
    @directors = Director.all

    render({ :template => "misc_templates/movies_all" })
  end

  def find_movie
    id_of_movie = params.fetch("movie_id")
    movie_activerecordrelation = Movie.where({ :id => id_of_movie })
    @individual_movie = movie_activerecordrelation.first
    director_of_movie_id = @individual_movie.director_id

    movie_director_activerecordrelation = Director.where({ :id => director_of_movie_id })
    @movie_director = movie_director_activerecordrelation.first

    render({ :template => "misc_templates/movie_individual_flexible" })
  end

  def actors_list
    @actors = Actor.all

    render({ :template => "misc_templates/actors_all" })
  end

  def find_actor
    id_of_actor = params.fetch("actor_id")
    actor_activerecordrelation = Actor.where({ :id => id_of_actor })
    @individual_actor = actor_activerecordrelation.first

    @actor_characters = Character.where({ :actor_id => id_of_actor })
    
    render({ :template => "misc_templates/actor_individual_flexible" })
  end

  def search_movie
    search_movie_title = params.fetch("users_movie")
    movie_activerecordrelation = Movie.where({ :title => search_movie_title })
    @individual_movie = movie_activerecordrelation.first
    director_of_movie_id = @individual_movie.director_id

    movie_director_activerecordrelation = Director.where({ :id => director_of_movie_id })
    @movie_director = movie_director_activerecordrelation.first

    render({ :template => "misc_templates/search_movie" })
  end

  def search_movie_years
    search_movie_title = params.fetch("users_movie_years")
    movie_collection = Movie.where({ :title => search_movie_title })
    @individual_movie = movie_collection.first
    movie_year = @individual_movie.year
    @time_ago = Time.now.year - movie_year

    render({ :template => "misc_templates/search_movie_time_ago"})
  end

  def before_2000_movies
    @movies_before_2000 = Movie.where("year < ?", 2000)
    @directors = Director.all

    render({ :template => "misc_templates/before_2000_movies" })
  end

  def younger_than_55
    require "date"
    start_date = 55.years.ago
    end_date = Date.today
    @directors_younger_than_55 = Director.where({ :dob => (start_date..end_date) })


    render({ :template => "misc_templates/directors_younger_than_55" })
  end

  def search_director_films
    search_director_movies = params.fetch("users_director")
    @searched_director = Director.where({ :name => search_director_movies }).first
    id_of_director = @searched_director.id
    @director_movies = Movie.where({ :director_id => id_of_director})

    render({ :template => "misc_templates/search_director_movies" })
  end

  def search_actor_films
    @search_actor_movies = params.fetch("users_actor")
    @searched_actor = Actor.where({ :name => @search_actor_movies }).first
    id_of_actor = @searched_actor.id

    @actor_characters = Character.where({ :actor_id => id_of_actor })

    render({ :template => "misc_templates/search_actor_movies" })
  end

end
