require "flate"

str = "you are silly you you you you you you"
str += "you are silly you you you you you you"
str += "you are silly you you you you you you"
str += "you are silly you you you you you you"
str += "you are silly you you you you you you"
str += "you are silly you you you you you you"

io = IO::Memory.new
Flate::Writer.new(io) do |flate|
  flate.write str.to_slice
end
rstr = io.to_s
io.close
pp rstr
