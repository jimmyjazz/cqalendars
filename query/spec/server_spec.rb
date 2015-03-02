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
    let(:appointments) { double }
    let(:decorated_appointments) { double }
    let(:json_appointments) { double }

    before do
      allow(CQalendaRS::Query::Appointments::Model).to receive(:all).and_return(appointments)
      allow(CQalendaRS::Query::Appointments::View).to receive(:decorate).and_return(decorated_appointments)
      allow(JSON).to receive(:generate).and_return(json_appointments)
    end

    it "retrieves appointments from appointments model" do
      get "/appointments"
      expect(CQalendaRS::Query::Appointments::Model).to have_received(:all)
    end

    it "passes appointments to the appointments view" do
      get "/appointments"
      expect(CQalendaRS::Query::Appointments::View).to have_received(:decorate).with(appointments)
    end

    it "serialises the decorated appointments with JSON" do
      get "/appointments"
      expect(JSON).to have_received(:generate).with(decorated_appointments)
    end

    it "returns the generated JSON as the response body" do
      get "/appointments"
      expect(last_response.body).to eql(json_appointments.to_s)
    end

    it "includes a URL to create a new appointment" do
      get "/appointments"
      expect(last_response.body).to include('"add_appointment_url":"https://command.cqalendars.com/appointments/add"')
    end

  end

end
