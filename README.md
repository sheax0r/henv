# Henv

Henv lets you easily set local environment variables to the values from a heroku app.

## Installation
```bash
gem install henv
```


## Usage

You can either export environment variables in your current shell, or you can run a subprocess using environment variables.

```bash
# Export variables
eval `henv export my-heroku-app `

# Then use them right in your shell!
echo $MY_VAR_FROM_MY_APP

# Run a subprocess:
henv exec my-heroku-app 'echo $MY_VAR_FROM_MY_APP'
```

## Development

After checking out the repo, run `bundle` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sheax0r/henv.
