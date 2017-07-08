module Flate
  def self.write(str)
    io = IO::Memory.new
    Flate::Writer.new(io) do |flate|
      flate.write str.to_slice
    end
    rstr = io.to_s
    io.close
    rstr
  end

  def self.read(str)
    io = IO::Memory.new(str.to_slice)

    rstr = Flate::Reader.new(io) do |flate|
      flate.gets_to_end
    end
    io.close
    rstr
  end
end
