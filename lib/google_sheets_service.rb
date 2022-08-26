require "dotenv/load"
require "google/apis/sheets_v4"
require "googleauth"

class GoogleSheetsService
  def initialize
    @service = Google::Apis::SheetsV4::SheetsService.new
    @service.client_options.application_name = "dxw Glossary"
    @service.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: StringIO.new(ENV.fetch("GOOGLE_CLIENT_SECRET")),
      scope: Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY
    )
  end

  def spreadsheet_values(spreadsheet_id: ENV.fetch("SPREADSHEET_ID"), range: "Glossary!A2:G")
    @service.get_spreadsheet_values(spreadsheet_id, range).values
  end
end
