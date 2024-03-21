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
  
  dog_inspirational_quotes = [
  "Paws and reflect on the good in life.",
  "Keep barking up the right tree, success is just a bark away.",
  "Every dog has its day, so make today yours.",
  "Life is ruff, but you've got the bark to beat it.",
  "Chase your dreams like you chase your tail – with endless joy.",
  "Unleash your potential, the world is your dog park.",
  "Be the person your dog thinks you are – kind, brave, and unstoppable.",
  "When life gets tough, just paws and enjoy the simple things.",
  "Stay pawsitive, even when life throws you a bone.",
  "Keep fetching your dreams, persistence is key.",
  "Dig deep for the courage to overcome obstacles.",
  "Sniff out opportunity and run towards it with all your might.",
  "Let sleeping dogs lie, but when you're awake, chase your dreams.",
  "In the journey of life, enjoy the walk, not just the destination.",
  "Sometimes the best approach is to lie down and roll with it."
  ]

  @dog_inspo = dog_inspirational_quotes.sample

  erb(:process_form)
end
