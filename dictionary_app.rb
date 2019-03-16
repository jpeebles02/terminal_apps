require "http"

while true
  system "clear"
  puts "Welcome to my Dictionary App"


  puts "Please enter a word: "
  word = gets.chomp

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=48dd829661f515d5abc0d03197a00582e888cc7da2484d5c7")
  definitions = response.parse

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=48dd829661f515d5abc0d03197a00582e888cc7da2484d5c7")
  pronunciation = response.parse

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=48dd829661f515d5abc0d03197a00582e888cc7da2484d5c7")
  top_example = response.parse

  puts "DEFINITIONS"
  index = 0 
  definitions.length.times do
    definition = definitions[index]
    puts "#{index + 1}. #{definition['text']}"
    puts
    index = index + 1  
  end
  # pp definitions
  # puts "Pronunciations"
  # # pp pronunciations   
  puts "TOP EXAMPLES"
  puts top_example["text"]
  # pp top_examples

  puts "Enter q to quit, any other key to continue"
  choice = gets.chomp
  if choice == "q"
    puts "Thank you, goodbye!"
    break
  end
end



#add if enters incorrect word
#add q for if they want to quit the app