require_relative("../../app/string_wrapper")

describe StringWrapper do
  it "handles the simple case" do
    repeated_string = '01234567890 '
    StringWrapper.new('').wrap(repeated_string * 8).should == <<END
#{(repeated_string * 6).strip}
#{(repeated_string * 2).strip}
END
  end

  it "handles a longer line" do
    repeated_string = '01234567890 '
    StringWrapper.new('').wrap(repeated_string * 16).should == <<END
#{(repeated_string * 6).strip}
#{(repeated_string * 6).strip}
#{(repeated_string * 4).strip}
END
  end

  it "preserves spaces which don't fall on a line boundary" do
    repeated_string = '0123  67890 '
    StringWrapper.new('').wrap(repeated_string * 8).should == <<END
#{(repeated_string * 6).strip}
#{(repeated_string * 2).strip}
END
  end

  it "doesn't preserve spaces which fall on a line boundary" do
    repeated_string = '0123  67890 '
    StringWrapper.new('').wrap(repeated_string * 8).should == <<END
#{(repeated_string * 6).strip}
#{(repeated_string * 2).strip}
END
  end

  it "indents wrapped lines" do
    repeated_string = '01234567890 '
    StringWrapper.new('  ').wrap(repeated_string * 8).should == <<END
#{'  ' + (repeated_string * 5).strip}
#{'  ' + (repeated_string * 3).strip}
END
  end

  it "passes unchanged lines without blanks that are too wide" do
    repeated_string = '01234567890'
    StringWrapper.new('').wrap(repeated_string * 8).should == <<END
#{repeated_string * 8}
END
  end

  it "respects indentation for lines without blanks that are too wide" do
    repeated_string = '01234567890'
    StringWrapper.new('  ').wrap(repeated_string * 8 + ' ' + repeated_string * 8).should == <<END
  #{repeated_string * 8}
  #{repeated_string * 8}
END
  end

  it "handles the case where a word longer than a line isn't the first word on a line" do
    repeated_string = '01234567890'
    StringWrapper.new('').wrap(repeated_string + ' ' + repeated_string * 8).should == <<END
#{repeated_string}
#{repeated_string * 8}
END
  end
end
