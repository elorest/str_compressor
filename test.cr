require "base64"
require "gzip"

str = "hello you things. HOw long can you get before it's actually compressed? is there even a point to gzip and flate. can a string get compressed? why not when does it get smaller:"
io = IO::Memory.new
Flate::Writer.new(io) do |flate|
  flate.write str.to_slice
end
pp io.to_slice.size
pp str.to_slice.size
# puts Base64.encode(io)
# puts Base64.encode(str)
io.close
