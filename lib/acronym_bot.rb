require 'sinatra'
require 'yaml'

expansion = YAML.load(File.read("./config/acronyms.yml"))

post '/' do
  acronym = params['text']
  first_match = expansion.keys.find { |key| key.casecmp?(acronym) }

  if first_match
    "#{first_match} stands for #{expansion[first_match]}"
  else
    "Sorry, I don't know that acronym"
  end
end
