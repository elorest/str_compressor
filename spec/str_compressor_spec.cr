require "./spec_helper"

describe StrCompressor do
  rawstring = <<-TEXT
    Tom Sawyer is a boy of about 12 years of age, who resides in the fictional town of St. Petersburg, Missouri, in about the year 1845. Tom Sawyer's best friends include Joe Harper and Huckleberry Finn. In The Adventures of Tom Sawyer, Tom's infatuation with classmate Becky Thatcher is apparent as he tries to intrigue her with his strength, boldness, and handsome looks. He first sees her after he confessed his feelings for Amy Lawrence, one of his classmates. He lives with his half-brother Sid, his cousin Mary, and his stern Aunt Polly in the (fictional) town of St. Petersburg, Missouri. There is no mention of Tom's father. Tom has another aunt, Sally Phelps, who lives considerably farther down the Mississippi.[1]

    In The Adventures of Huckleberry Finn, Tom is only a minor character and is used as a foil for Huck, particularly in the later chapters of the novel after Huck makes his way to Uncle Phelps's plantation. Tom's immaturity, imagination, and obsession with stories put Huck's planned rescue of the runaway slave Jim in great jeopardy — and ultimately make it unnecessary, since he knows Jim's owner has died and freed him in her will. Throughout the novel, Huck's intellectual and emotional development is a central theme, and by re-introducing a character from the beginning (Tom), Twain is able to highlight this evolution in Huck's character.
  TEXT

  context Gzip do
    it "compresses and uncompresses strings with gzip" do
      compstring = Gzip.write(rawstring)
      compstring.should_not eq rawstring
      Gzip.read(compstring).should eq rawstring
    end

    it "should be smaller when compressed with gzip" do
      (Flate.write(rawstring).size < rawstring.size).should be_true
    end
  end

  context Flate do
    it "compresses and uncompresses strings with flate" do
      compstring = Flate.write(rawstring)
      compstring.should_not eq rawstring
      Flate.read(compstring).should eq rawstring
    end

    it "should be smaller when compressed with flate" do
      (Flate.write(rawstring).size < rawstring.size).should be_true
    end
  end
end
