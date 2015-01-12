require 'spec_helper'

describe CQalendaRS::Query::Appointments::View do
  
  describe ".all" do
    let(:appointments) { double }

    before do
      allow(CQalendaRS::Query::Appointments::Model).to receive(:all).and_return(appointments)
    end

    it "delegates to the appointments view model" do
      CQalendaRS::Query::Appointments::View.all
      expect(CQalendaRS::Query::Appointments::Model).to have_received(:all)
    end
  end
  
end