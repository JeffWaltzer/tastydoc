require_relative '../../app/rtf_view'

describe RtfView do

  it 'exists' do
    RtfView.new({}).should be
  end

  it 'renders empty documents' do
    Time.stub(:new).and_return(Time.parse('Feb 24 1981'))

    RtfView.new({}).render({}).should == <<'RTF'.chomp
{\rtf1\ansi\deff0\deflang2057\plain\fs24\fet1
{\fonttbl
}
{\info
{\createim\yr1981\mo2\dy24\hr0\min0}
}

\paperw11907\paperh16840\margl1800\margr1800\margt1440\margb1440
}
RTF
  end

end