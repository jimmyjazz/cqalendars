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
    describe "request validation" do
      before do
        post "/appointments/add", payload
      end

      xit "invokes the request validator" do
        # we imagine an object that sanity checks the request payload
        # and at the very least ensures we have the right parameters, namely
        # client supplied UUID for the appointment
        # start time in UTC
        # end time in UTC
        # non null description
      end

      xit "returns a 400 response if the validator rejects the payload" do
      end
    end

    it "invokes the correct command handler" do
      expect(CQalendaRS::Command::AddAppointmentHandler).to receive(:execute)
    end

    xit "returns the correct response" do

    end

  end
end
