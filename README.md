The Acronym bot knows a list of acronyms (available in `config/acronyms.yml`) and can expand them on demand in Slack.

Ask the bot in Slack with commands of the form `/whatis`, for example `/whatis DfE`.

## Development

Install the gems with `bundle install`.

Run the server locally:

```
bundle exec rackup
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
