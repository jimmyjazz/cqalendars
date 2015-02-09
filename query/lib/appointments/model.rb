module CQalendaRS
  module Query
    module Appointments
      class Model
        def self.all
          dataset = DB[:appointments]
          dataset.order(:start_time).map do |record|
            Appointment.new(record.id, record.start_time, record.end_time, record.description)
          end
        end
      end
    end
  end
end