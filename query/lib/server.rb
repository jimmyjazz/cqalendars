require 'sinatra'

module CQalendaRS
  module Query
    class Server < Sinatra::Base

      get "/" do
        404
      end

      get "/appointments" do
        "[]"
      end

    end
  end
end

