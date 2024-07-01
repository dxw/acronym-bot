require 'spec_helper'

RSpec.describe 'Acronym bot' do
  context "POST to /" do
    context "given a valid acronym" do
      let(:response) { post "/", text: "BEIS" }

      it 'should respond with an OK' do
        expect(response).to be_ok
      end

      it "gives the right expansion for that acronym only" do
        expect(response.body).to include("BEIS stands for Department of Business, Energy and Industrial Strategy")
        expect(response.body).not_to include("Department for Education")
      end

      it "is not case sensitive but it replies with the preferred spelling" do
        response = post "/", text: "beis"

        expect(response.body).to include("BEIS stands for Department of Business, Energy and Industrial Strategy")
      end
    end

    context "given an acronym that is not in the dictionary" do
      let(:response) { post "/", text: "NOTEXISTINGACRONYM" }

      it "notifies the user that acronym does not exist in the yaml file" do
        expect(response.body).to include("Sorry, I don't know the acronym \"NOTEXISTINGACRONYM\"")
      end
    end
  end
end
