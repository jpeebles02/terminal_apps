require "http"

system "clear"
puts "Welcome to the weather app!"
puts "Enter a city:"
city = gets.chomp

response = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial&APPID=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")
if response.status == 200
  weather_data = response.parse

  temperature = weather_data["main"]["temp"]
  description = weather_data["weather"][0]["description"]

  puts "Today in #{city} it is #{temperature} degrees outside with #{description}."
else 
  puts "Uh oh. Ultimate fail."
end 


#sample APPID:
# 9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0
# 64e90a58d89a8e7f3f000001fe809d0cd55d32cb45b9f117e
# 48dd829661f515d5abc0d03197a00582e888cc7da2484d5c7
# 8dba4744d147470de953d228e1788d494480af9c8a004769a
# d1468251dcc15bd72245101c1fc07fae5c3747257092d3230
# f0c54bfe816e1c9cb917306c542021034d976d6be0d159c3c
# 8c5e16a77ad41ee83c00a04a8760c80ce83ae19ce509db930
# ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd
# b05bbefa71250039e60030a86260994d095206c2efdc555ad