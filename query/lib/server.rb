require 'json'
require 'sinatra'
require 'sequel'

require 'appointments/model'
require 'appointments/view'

Sequel.default_timezone = :utc
DB = Sequel.sqlite

require 'db/setup'

module CQalendaRS
  module Query
    class Configuration
      def self.command_base_url
        "https://command.cqalendars.com/"
      end
    end

    class Server < Sinatra::Base

      get "/" do
        404
      end

      get "/appointments" do
        appointments = CQalendaRS::Query::Appointments::Model.all
        decorated_appointments = CQalendaRS::Query::Appointments::View.decorate(appointments)
        JSON.generate(decorated_appointments).to_s
      end

    end
  end
end

