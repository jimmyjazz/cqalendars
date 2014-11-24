require 'spec_helper'

describe "viewing my calendar" do
  
  include Rack::Test::Methods

  def app
    CQalendaRS::Query::Server
  end
  
  it "works" do
    get "/"
    expect(last_response.body).to eql("hello world\n")
  end
  
end
