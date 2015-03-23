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

      context "with an empty payload" do

        let(:payload) { {} }

        it "returns a 400 Bad Request status code" do
          expect(last_response.status).to eql(400)
        end

      end
    end

    xit "invokes the correct command handler" do

    end

    xit "returns the correct response" do

    end

  end
end
