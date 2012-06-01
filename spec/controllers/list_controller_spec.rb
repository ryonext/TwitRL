#encoding: utf-8
require 'spec_helper'

describe ListController do
  before(:each) do
    WebMock.stub_request(:get, 'https://api.twitter.com/1/friends/ids.json?cursor=-1').to_return do |req|
      {:body => {
      :attrs=>
      {"previous_cursor_str"=>"0",
        "next_cursor"=>0,
        "ids"=>[16882371, 141161453, 93311525, 42816371, 43041891],
        "previous_cursor"=>0,
        "next_cursor_str"=>"0"
      },
      :collection=>[16882371, 141161453, 93311525, 42816371, 43041891]
      }}
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'select'" do
    it "returns http success" do
      get 'select'
      response.should be_success
    end

    it "Twitterのフォローリストが取得できること" do
      get 'select'
      assigns[:followers].should_not be_empty
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

end
