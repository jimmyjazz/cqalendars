require 'json'
require 'sinatra'

require 'appointments/model'
require 'appointments/view'

module CQalendaRS
  module Query
    class Server < Sinatra::Base

      get "/" do
        404
      end

      get "/appointments" do
        JSON.generate(CQalendaRS::Query::Appointments::Model.all)
      end

    end
  end
end

