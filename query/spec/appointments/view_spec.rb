require 'spec_helper'

describe CQalendaRS::Query::Appointments::View do

  describe ".decorate" do

    let(:appointment) { CQalendaRS::Query::Appointments::Model::Appointment.new(123, Time.now, Time.now, "blah blah") }

    it "adds a hyperlink to cancel the appointment" do
      expect(CQalendaRS::Query::Appointments::View.decorate([appointment]).first).to include(cancel_url: "yadayada")
    end

  end

end