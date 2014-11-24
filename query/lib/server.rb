require 'sinatra'

module CQalendaRS
  module Query
    class Server < Sinatra::Base

      get "/" do
        "hello world\n"
      end      

    end
  end
end

