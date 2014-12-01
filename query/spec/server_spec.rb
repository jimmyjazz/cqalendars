require 'spec_helper'

describe "viewing my calendar" do
  
  include Rack::Test::Methods

  def app
    CQalendaRS::Query::Server
  end

  describe "GET /" do
    it "returns 404 status code" do
      get "/"
      expect(last_response.status).to eql(404)
    end
  end
  
end
