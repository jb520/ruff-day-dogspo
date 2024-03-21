require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
=begin
  dog_key = ENV.fetch("DOGAPI_KEY")
  dog_url = "https://api.thedogapi.com/v1/images/search?api_key=#{dog_key}"
  dog_data = HTTP.get(dog_url).to_s
  dog_parse = JSON.parse(dog_data)
  results_arr = dog_parse.at(0)
  @img_url = results_arr.fetch("url")
  breed_info = results_arr.fetch("breeds")
  breed_hash = breed_info.at(0)
  @dog_name = breed_hash.fetch("name") 
=end

  erb(:home)
end

post("/ruff_day") do
  dog_key = ENV.fetch("DOGAPI_KEY")
  dog_url = "https://api.thedogapi.com/v1/images/search?api_key=#{dog_key}"
  dog_data = HTTP.get(dog_url).to_s
  dog_parse = JSON.parse(dog_data)
  results_arr = dog_parse.at(0)
  @img_url = results_arr.fetch("url")
  breed_info = results_arr.fetch("breeds")
  
  

  if breed_info.length < 0
    @dog_name = "A picture of a dog."
  elsif breed_info.length > 0
    breed_hash = breed_info.at(0)
    dog_name_found = breed_hash.fetch("name")

    @dog_name = "A picture of the #{dog_name_found} breed of dog."
  end
   

  erb(:process_form)
end
