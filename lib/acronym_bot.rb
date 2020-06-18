require 'sinatra'
require 'yaml'
require 'json'
require 'net/http'

# expansion = YAML.load(File.read("./config/acronyms.yml"))

# post '/' do
#   acronym = params['text']
#   if expansion.has_key?(acronym)
#     "#{acronym} stands for #{expansion[acronym]}"
#   else
#     "Sorry, I don't know that acronym"
#   end
# end

expansion = YAML.load(File.read("./config/acronyms.yml"))

post '/' do
  acronym = params['text']
  url = params['response_url']
  message = expansion.has_key?(acronym) ? "#{acronym} stands for #{expansion[acronym]}" : "Sorry, I don't know what '#{acronym}' means"

  Net::HTTP.post URI(url),
       { text: message, response_type: "in_channel" }.to_json,
       "Content-Type" => "application/json"

  ""
end
