require 'spec_helper'

RSpec.describe 'Acronym bot' do
  context "POST to /" do
    context "given a valid acronym" do
      let(:response) { post "/", text: "BEIS" }

      it 'should respond with an OK' do
        expect(response).to be_ok
      end

      it "gives the right expansion for that acronym only" do
        expect(response.body).to include("Department of Business, Energy and Industrial Strategy")
        expect(response.body).not_to include("Department for Education")
      end
    end

    context "given an acronym that is not in the dictionary" do
      let(:response) { post "/", text: "NOTEXISTINGACRONYM" }

      it "notifies the user that acronym does not exist in the yaml file" do
        expect(response.body).to include("Sorry, I don't know that acronym")
      end
    end
  end
end
