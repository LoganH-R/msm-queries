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
end
