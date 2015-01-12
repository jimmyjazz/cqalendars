require 'appointments/model'

module CQalendaRS
  module Query
    module Appointments
      class View
        def self.all
          CQalendaRS::Query::Appointments::Model.all
        end
      end
    end
  end
end