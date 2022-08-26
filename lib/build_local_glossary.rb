require_relative "./google_sheets_service.rb"
require_relative "./acronyms_builder.rb"

acronym_defs = acronym_dictionary(GoogleSheetsService.new.spreadsheet_values)

File.open("./config/acronyms.yml", "w") { |file| file.write(acronym_defs.to_yaml) }
