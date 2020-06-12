require 'sinatra'
require 'yaml'

expansion = YAML.load(File.read("./config/acronyms.yml"))

post '/' do
  acronym = params['text']
  if expansion.has_key?(acronym)
    "#{acronym} stands for #{expansion[acronym]}"
  else
    "Sorry, I don't know that acronym"
  end
end
