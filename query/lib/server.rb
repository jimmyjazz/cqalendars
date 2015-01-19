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
        appointments = CQalendaRS::Query::Appointments::Model.all
        decorated_appointments = CQalendaRS::Query::Appointments::View.decorate(appointments)
        JSON.generate(decorated_appointments)
      end

    end
  end
end

