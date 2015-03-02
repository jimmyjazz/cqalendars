module CQalendaRS
  module Query
    module Appointments
      class View
        def self.decorate(appointments)
          appointments.map do |appointment|
            {
              id: appointment.id.to_s,
              start_time: appointment.start_time.utc.to_s,
              end_time: appointment.end_time.utc.to_s,
              description: appointment.description.to_s,
              cancel_url: Configuration.command_base_url + "appointments/#{appointment.id}/cancel",
            }
          end
        end
      end
    end
  end
end