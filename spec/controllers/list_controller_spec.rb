#encoding: utf-8
require 'spec_helper'

describe ListController do

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