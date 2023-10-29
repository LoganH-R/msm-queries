class MiscController < ApplicationController
  def homepage
    render({ :template => "misc_templates/home"})
  end

  def directors_list
    @directors = Director.all

    render({ :template => "misc_templates/directors_all" })
  end

  def find_youngest_director
    @directors = Director.all.order(:dob => :asc)
    @youngest_director = @directors.last
    @youngest_director_dob = @youngest_director.dob.strftime("%B %e, %Y")

    render({ :template => "misc_templates/director_youngest" })
  end

  def find_eldest_director
    @directors = Director.all.order(:dob => :asc)
    @eldest_director = @directors.first
    @eldest_director_dob = @eldest_director.dob.strftime("%B %e, %Y")

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


    render({ :template => "misc_templates/movie_individual_flexible" })
  end

  def actors_list
    @actors = Actor.all

    render({ :template => "misc_templates/actors_all" })
  end

  def find_actor


    render({ :template => "misc_templates/actor_individual_flexible" })
  end
end
