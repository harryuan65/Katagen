# Katagen

![CI](https://github.com/harryuan65/Katagen/workflows/Test/badge.svg)

A small tool to generate folders and some templates for coding practices(currently, only for LeetCode). This gem creates a solution file for each practice, so you can compare different trains of thought to the problem.

## Installation

```ruby
gem 'katagen', "~>1.0.1"
```

And then execute:

    $ bundle install

## Example

```bash
Usage:
  katagen leetcode <leetcode_question_id> [options]

Options:
  [--cwd=CWD]    # current working directory
                 # Default: ./
  [--lang=LANG]  # file extension for solution
                 # Default: rb
```

### Binstubs

You can use binstubs to type less:

```bash
bundle binstubs katagen
bin/katagen leetcode 1480
bin/katagen leetcode 1480 --cwd posts/Leetcode --lang md 
```

This will create:

```
medium
└── 1480.rearrange-words-in-a-sentence
    ├── solution.rb
    └── solution_spec.rb
```

If you run it twice, it will create `solution2.rb`, etc.

```
medium
└── 1480.rearrange-words-in-a-sentence
    ├── solution.rb
    ├── solution2.rb
    └── solution_spec.rb
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/katagen. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/katagen/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Katagen project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/katagen/blob/master/CODE_OF_CONDUCT.md).
