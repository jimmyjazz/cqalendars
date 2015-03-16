require 'spec_helper'

describe "adding an appointment" do

  include Rack::Test::Methods

  def app
    CQalendaRS::Command::Server
  end

  describe "GET /" do
    it "returns 404 status code" do
      get "/"
      expect(last_response.status).to eql(404)
    end
  end

  describe "POST /appointments/add" do
  end
end
