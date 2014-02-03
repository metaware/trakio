require 'spec_helper'

describe TrakIO::Tracker do
  
  describe 'class should be defined' do
    subject { TrakIO::Tracker }
    it { should be_true }
  end

  describe 'can be initialized with a token' do
    subject { TrakIO::Tracker.new('some-long-token') }
    it { should be_an_instance_of(TrakIO::Tracker) }
    its(:token) { should eq('some-long-token') }
  end

end