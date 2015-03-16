require 'sinatra'

module CQalendaRS
  module Command
    class Server < Sinatra::Base

      get "/" do
        404
      end

      post "/appointments/add" do
      end

    end
  end
end

