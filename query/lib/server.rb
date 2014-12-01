require 'sinatra'

module CQalendaRS
  module Query
    class Server < Sinatra::Base

      get "/" do
        404
      end      

    end
  end
end

