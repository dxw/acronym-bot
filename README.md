The Acronym bot knows a list of acronyms (available in `config/acronyms.yml`) and can expand them on demand in Slack.

Ask the bot in Slack with commands of the form `/whatis`, for example `/whatis DfE`.

The bot is supported by a script that takes the [dxw Glossary Spreadsheet](https://docs.google.com/spreadsheets/d/1CHJA8fJIU85iCpcx4s-gc9IXqq7DLTxbjNetH_dSMqQ/) and turns it into a simple dictionary of acronyms, ignoring any empty or incomplete entries, as well as any extra details.

(For a complete and detailed glossary, go to [the dxw Glossary](https://dxw.github.io/glossary/index.html).)

## Development

Install the gems with `bundle install`.

Run the server locally:

```
bundle exec rackup

```

## Building

Copy the `.env.example` file to `.env`, and add a JSON string representing a Google Service Account with access to the spreadsheet. These details are available in 1Password under "Glossary Spreadsheet Service Account".

Build or rebuild the local acronyms file by running

```
bundle exec ruby build_local_glossary.rb
```

## Testing

Run the automated tests:

```
bundle exec rspec
```

You can also test it manually by starting the server and making a request. For example:

```
curl -X POST http://localhost:9292 -d "text=DfE"
```

## Deployment

Within dxw, acronym-bot is deployed on Heroku.
