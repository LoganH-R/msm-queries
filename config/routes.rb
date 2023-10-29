Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors", { :controller => "misc", :action => "directors_list" })
  get("/directors/youngest", { :controller => "misc", :action => "find_youngest_director" })
  get("/directors/eldest", { :controller => "misc", :action => "find_eldest_director" })
  get("/directors/:director_id", { :controller => "misc", :action => "find_director" })

  get("/movies", { :controller => "misc", :action => "movies_list" })
  get("/movies/:movie_id", { :controller => "misc", :action => "find_movie" })

  get("/actors", { :controller => "misc", :action => "actors_list" })
  get("/actors/:actor_id", { :controller => "misc", :action => "find_actor" })

  get("/search/movie", { :controller => "misc", :action => "search_movie" })
  get("/search/movie/years", { :controller => "misc", :action => "search_movie_years" })
  get("/pre-2000_movies", { :controller => "misc", :action => "before_2000_movies" })
  get("/younger_directors", { :controller => "misc", :action => "younger_than_55" })
  get("/search/director/films", {:controller => "misc", :action => "search_director_films" })
  get("/search/actor/films", {:controller => "misc", :action => "search_actor_films" })
end
