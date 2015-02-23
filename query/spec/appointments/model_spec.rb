require 'spec_helper'

describe CQalendaRS::Query::Appointments::Model do

  let(:appointment1) { { start_time: "2015-02-05 09:50:00", end_time: "2015-02-05 10:20:00", description: "Collis' RubyConf Keynote" } }
  let(:appointment2) { { start_time: "2015-02-04 19:00:00", end_time: "2015-02-04 23:00:00", description: "RubyConf Opening Partay!" } }
  let(:appointment3) { { start_time: "2015-02-07 16:30:00", end_time: "2015-02-07 20:45:00", description: "RubyConf Picnic" } }

  before do
    [appointment1, appointment2, appointment3].each do |appointment_hash|
      DB[:appointments].insert(appointment_hash)
    end
  end

  after do
    DB[:appointments].truncate
  end

  describe ".all" do

    subject(:all_appointments) { CQalendaRS::Query::Appointments::Model.all }

    it "returns all appointments in an array of value objects" do
      expect(all_appointments).to be_an_instance_of(Array) \
        .and(all(be_an_instance_of(CQalendaRS::Query::Appointments::Model::Appointment)))
    end

    it "returns the expected number of appointments" do
      expect(all_appointments.count).to eql(3)
    end

    it "returns the earliest appointment first" do
      first_appointment = all_appointments.first

      expect(first_appointment.start_time).to eql(Time.parse(appointment2[:start_time]))
      expect(first_appointment.end_time).to eql(Time.parse(appointment2[:end_time]))
      expect(first_appointment.description).to eql(appointment2[:description])
    end

    it "returns the middle appointment second" do
      second_appointment = all_appointments[1]

      expect(second_appointment.start_time).to eql(Time.parse(appointment1[:start_time]))
      expect(second_appointment.end_time).to eql(Time.parse(appointment1[:end_time]))
      expect(second_appointment.description).to eql(appointment1[:description])
    end

    it "returns the latest appointment last" do
      last_appointment = all_appointments.last

      expect(last_appointment.start_time).to eql(Time.parse(appointment3[:start_time]))
      expect(last_appointment.end_time).to eql(Time.parse(appointment3[:end_time]))
      expect(last_appointment.description).to eql(appointment3[:description])
    end

  end

end