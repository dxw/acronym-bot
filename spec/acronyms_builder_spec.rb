require "spec_helper"
require_relative "../lib/acronyms_builder.rb"

RSpec.describe "Acronyms builder" do
  let(:spreadsheet_values) {
    [
      ["", "Public Sector Network", "PSN", "", "Description of The Public Services Network"],
      ["Client", "", "ABC", "", "Description of ABC"],
      ["Client", "Citizens Advice", "CA", "", "Description of Citizens Advice"],
      ["", "Expansion of Missing Acronym", "", "", "Description"]
    ]
  }

  describe "data cleanup" do
    it "only keeps non-blank acronyms and their definitions" do
      acronym_defs = {
        "PSN" => "Public Sector Network",
        "CA" => "Citizens Advice"
      }

      expect(acronym_dictionary(spreadsheet_values)).to eql(acronym_defs)
    end
  end
end
