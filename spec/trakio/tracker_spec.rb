require 'spec_helper'

describe TrakIO::Tracker do
  
  describe 'class should be defined' do
    subject { TrakIO::Tracker }
    it { should be_true }
  end

  describe '#initialize' do

    subject { TrakIO::Tracker.new('some-long-token') }

    it { should be_an_instance_of(TrakIO::Tracker) }

    describe 'accepts a token' do
      its(:token) { should eq('some-long-token') }
    end

    describe 'accepts options hash' do

      context 'when options hash is not provided' do
        its(:options) { should be_nil }
      end

      context 'when options hash is provided' do
        let(:init_hash) { { key1: 'value1', key2: 'value2' } }
        subject { TrakIO::Tracker.new('some-long-token', init_hash) }
        its(:options) { should be_true }
        its(:options) { should eq(init_hash) }
      end

    end

  end

end