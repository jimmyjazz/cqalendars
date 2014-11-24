require 'spec_helper'

describe "viewing my calendar" do
  
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
  
  it "works" do
    get "/"
    expect(last_response.body).to eql("hello world\n")
  end
  
end
