# Validates URL

This gem adds the capability of validating URLs to ActiveRecord and ActiveModel.

## Installation

```
# add this to your Gemfile
gem "validate_url"

# or run
sudo gem install validate_url
```

## Usage

### With ActiveRecord

```ruby
class Pony < ActiveRecord::Base
  # standard validation
  validates :homepage, url: true

  # with allow_nil
  validates :homepage, url: { allow_nil: true }

  # with allow_blank
  validates :homepage, url: { allow_blank: true }

  # without local hostnames
  validates :homepage, url: { no_local: true }

  # with custom schemes
  validates :homepage, url: { schemes: ['https'] }

  # with public suffix database https://publicsuffix.org/
  validates :homepage, url: { public_suffix: true }

  # with authority_only (no path)
  validates :homepage, url: { authority_only: true }
end
```

### With ActiveModel

```ruby
class Unicorn
  include ActiveModel::Validations

  attr_accessor :homepage

  # with legacy syntax (the syntax above works also)
  validates_url :homepage, allow_blank: true
end
```

### With RSpec

Require the matcher in `spec_helper.rb` or `rails_helper.rb`:

```ruby
require 'validate_url/rspec_matcher'
```

In your spec:

```ruby
describe Unicorn
  it { is_expected.to validate_url_of(:homepage) }
end
```

### I18n

The default error message `is not a valid URL`.
You can pass the `message: "my custom error"` option to your validation to define your own, custom message.


## Contributing


Big thanks to Tanel Suurhans, Tarmo Lehtpuu, Steve Smith and all the [contributors](https://github.com/perfectline/validates_url/contributors)! We appreciate all your work on new features and bugfixes.

## Credits

Validates URL is created and maintained by [PerfectLine](http://www.perfectline.co), LLC.

## License

Validates URL is Copyright © 2010-2014 [PerfectLine](http://www.perfectline.co), LLC. It is free software, and may be
redistributed under the terms specified in the LICENSE file.

## How to push new version

```
rake version:bump:patch
rake gemspec
```
Fix validate_url.gemspec to remove unneeded wrong strings
```
gem build validate_url.gemspec
gem push validate_url-1.0.8.gem
```
