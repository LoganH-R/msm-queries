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
end
