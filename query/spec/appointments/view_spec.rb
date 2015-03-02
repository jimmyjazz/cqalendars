require 'spec_helper'

describe CQalendaRS::Query::Appointments::View do

  describe ".decorate" do

    let(:appointment) { CQalendaRS::Query::Appointments::Model::Appointment.new(123, Time.parse("2015-03-02 16:30"), Time.parse("2015-03-02 17:50"), "blah blah") }
    subject(:decorated_appointment) { CQalendaRS::Query::Appointments::View.decorate([appointment]).first }

    it "adds a hyperlink to cancel the appointment" do
      expect(decorated_appointment).to include(cancel_url: "https://command.cqalendars.com/appointments/123/cancel")
    end

    it "includes the appointment ID" do
      expect(decorated_appointment).to include(id: "123")
    end

    it "includes the appointment's start time" do
      expect(decorated_appointment).to include(start_time: "2015-03-02 05:30:00 UTC")
    end

    it "includes the appointment's end time" do
      expect(decorated_appointment).to include(end_time: "2015-03-02 06:50:00 UTC")
    end

    it "includes the appointment's description" do
      expect(decorated_appointment).to include(description: "blah blah")
    end

  end

end