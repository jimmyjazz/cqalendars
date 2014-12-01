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

  describe "GET /appointments" do
    before do
      allow(CQalendaRS::Query::AppointmentsView).to receive(:all)
    end

    it "retrieves appointments from AppointmentsView" do
      get "/appointments"
      expect(CQalendaRS::Query::AppointmentsView).to have_received(:all)
    end

    it "returns all appointments for all time" do
      get "/appointments"
      expect(last_response.body).to eql("[]")
    end
  end

end
