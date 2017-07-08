module Gzip
  def self.write(str)
    io = IO::Memory.new
    Gzip::Writer.open(io) do |gzip|
      gzip.write str.to_slice
    end
    rstr = io.to_s
    io.close
    rstr
  end

  def self.read(str)
    io = IO::Memory.new(str.to_slice)

    rstr = Gzip::Reader.open(io) do |gzip|
      gzip.gets_to_end
    end
    io.close
    rstr
  end
end
