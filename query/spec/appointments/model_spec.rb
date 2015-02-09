require 'spec_helper'

describe CQalendaRS::Query::Appointments::Model do

  describe ".all" do
    
    it "returns all appointments in an array of value objects" do
      expect(CQalendaRS::Query::Appointments::Model.all).to eql([])
    end
    
  end

end