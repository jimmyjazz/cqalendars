require 'json'
require 'sinatra'

require 'appointments/view'

module CQalendaRS
  module Query
    class Server < Sinatra::Base

      get "/" do
        404
      end

      get "/appointments" do
        Appointments::View.all.to_json
      end

    end
  end
end

