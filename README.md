# Katagen

[WIP] Generate folders for leet code practices.

## Installation

> NOTE: this is still wip and it not yet available on rubygems.org

Add this line to your application's Gemfile:

```ruby
gem 'katagen'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install katagen

## Usage


```bash
katagen new <leetcode_url> <lang>
katagen new https://leetcode.com/problems/isomorphic-strings/
katagen new https://leetcode.com/problems/isomorphic-strings/ js
```

`<lang>` [options] is the solution file extension, omitting will default to "rb" (ruby).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/katagen. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/katagen/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Katagen project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/katagen/blob/master/CODE_OF_CONDUCT.md).
