require 'json'
require 'sinatra'

require 'appointments_view'

module CQalendaRS
  module Query
    class Server < Sinatra::Base

      get "/" do
        404
      end

      get "/appointments" do
        AppointmentsView.all.to_json
      end

    end
  end
end

