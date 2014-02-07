require 'spec_helper'
require 'webmock'

describe TrakIO::Client do
  
  let(:api_token) { 'long-secret-token' }
  let(:client)    { TrakIO::Client.new(api_token) }
  let(:request_data) do
    { 
      distinct_id: '123', 
      name: 'Frank Sinatra', 
      email: 'hello@metawarelabs.com' 
    }
  end
  let(:headers) do
    { 
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json', 
      'User-Agent' => "Metaware/RubyClient/v#{TrakIO::VERSION}"
    }
  end

  describe '#initialize' do

    it 'can be initialized with a token' do
      client.api_token.should == api_token
    end

  end

  context 'endpoints' do

    it 'should define the identify URL' do
      TrakIO::Client::ENDPOINTS[:identify].should == 'https://api.trak.io/v1/identify'
    end

    it 'should define the track URL' do
      TrakIO::Client::ENDPOINTS[:track].should == 'https://api.trak.io/v1/track'
    end

    it 'should define the alias URL' do
      TrakIO::Client::ENDPOINTS[:alias].should == 'https://api.trak.io/v1/alias'
    end

    it "should define the annotate url" do
      TrakIO::Client::ENDPOINTS[:annotate].should == 'https://api.trak.io/v1/annotate'
    end

    it 'should not define the unknown URL' do
      TrakIO::Client::ENDPOINTS[:unknown].should be_nil
    end

  end

  describe '#request' do

    let(:request_body) do
      { 
        data: request_data, 
        token: api_token 
      }
    end

    let(:request_body_with_headers) do
      { 
        body: request_body.to_json,
        headers: headers
      }
    end

    context 'unknown endpoint' do
      
      let(:url) { TrakIO::Client::ENDPOINTS[:unknown] }

      it 'should raise an error' do
        expect { client.request(:unknown, request_data) }.to raise_error
      end

    end

    context 'identify' do

      let(:url) { TrakIO::Client::ENDPOINTS[:identify] }

      it 'should send a request with attributes to identify URL' do
        stub_request(:post, url).with(request_body_with_headers).
          to_return(status: 200)
        
        client.request(:identify, request_data)
        
        WebMock.should have_requested(:post, url).with(request_body)
      end

    end

    context 'track' do

      let(:url) { TrakIO::Client::ENDPOINTS[:track] }

      it 'should send a request with attributes to identify URL' do
        stub_request(:post, url).with(request_body_with_headers).
          to_return(status: 200)
        
        client.request(:track, request_data)
        
        WebMock.should have_requested(:post, url).with(request_body)
      end

    end

  end

end