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
    let(:appointments) { [] }
  
    before do
      allow(CQalendaRS::Query::AppointmentsView).to receive(:all).and_return(appointments)
    end

    it "retrieves appointments from AppointmentsView" do
      get "/appointments"
      expect(CQalendaRS::Query::AppointmentsView).to have_received(:all)
    end

    context "I have no appointments" do
      it "returns all appointments for all time" do
        get "/appointments"
        expect(last_response.body).to eql("[]")
      end
    end

    context "I have one appointment" do
      let(:appointments) { [] }
    
      it "returns all appointments for all time" do
        get "/appointments"
        expect(last_response.body).to eql('[{"appointment_id":12345}]')
      end
    end

  end

end
