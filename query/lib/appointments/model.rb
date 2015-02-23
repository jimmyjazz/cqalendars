module CQalendaRS
  module Query
    module Appointments
      class Model
        class Appointment < Struct.new(:id, :start_time, :end_time, :description)
        end

        def self.all
          dataset = DB[:appointments]
          dataset.order(:start_time).map do |record|
            Appointment.new(record[:id], record[:start_time], record[:end_time], record[:description])
          end
        end
      end
    end
  end
end