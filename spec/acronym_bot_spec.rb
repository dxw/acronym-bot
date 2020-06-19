require 'spec_helper'

RSpec.describe 'Acronym bot' do
  before do
    allow(Net::HTTP).to receive(:post)
  end

  context "POST to '/'" do
    context "given a valid acronym" do
      it 'makes a request and returns the expansion of the acronym' do
        expect(Net::HTTP).to receive(:post).with(URI("www.example.com"),
          {text: "BEIS stands for Department of Business, Energy and Industrial Strategy", response_type: "in_channel"}.to_json,
          "Content-Type" => "application/json")
        post '/', text: "BEIS", response_url: "www.example.com"
      end

      it 'gives the right expansion for that acronym only' do
        expect(Net::HTTP).not_to receive(:post).with(URI("www.example.com"),
          {text: "DfE stands for Department for Education", response_type: "in_channel"}.to_json,
          "Content-Type" => "application/json")
        post '/', text: "BEIS", response_url: "www.example.com"
      end
    end

    context "given an acronym that is not in the dictionary" do
      it "notifies the user that the acronym does not exist in the yaml file" do
        expect(Net::HTTP).to receive(:post).with(URI("www.example.com"),
          {text: "Sorry, I don't know what 'NOTEXISTINGACRONYM' means", response_type: "in_channel"}.to_json,
          "Content-Type" => "application/json")
        post '/', text: "NOTEXISTINGACRONYM", response_url: "www.example.com"
      end
    end
  end
end

# describe "Acronyn bot with WebMock" do
#   context "POST to '/'" do
#     context "given a valid acronym" do
#       it "makes a request and returns the expansion of the acronym" do
#         stub_request(:post, "www.example.com").
#           with(body: { text: "BEIS", response_url: "www.example" }).to_return({text: "BEIS stands for Department of Business, Energy and Industrial Strategy", response_type: "in_channel"}.to_json,
#           headers: "application/json")
#         request(:post, "www.example.com").
#           with(:body => "BEIS stands for Department of Business, Energy and Industrial Strategy", :headers => { 'Content-Type' => "application/json" }).should have_been_made.once
#       end
#     end
#   end
# end
