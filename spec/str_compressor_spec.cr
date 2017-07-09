require "./spec_helper"

describe StrCompressor do
  context Gzip do
    gzip_str = "hello gzip compressed world"

    it "compresses and uncompresses strings with gzip" do
      Gzip.read(Gzip.write(gzip_str)).should eq gzip_str
    end
  end

  context Flate do
    flate_str = "hello flate compressed world"

    it "compresses strings with flate" do
      Flate.write(flate_str).should eq "\xCBH\xCD\xC9\xC9WH\xCBI,IUH\xCE\xCF-(J-.NMQ(\xCF/\xCAI\u0001\u0000"
    end

    it "uncompresses strings with flate" do
      Flate.read("\xCBH\xCD\xC9\xC9WH\xCBI,IUH\xCE\xCF-(J-.NMQ(\xCF/\xCAI\u0001\u0000").should eq flate_str
    end
  end
end
