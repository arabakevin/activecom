# ActiveCom

ActiveCom is a Rails engine which implements some of the Intercom.io service
into your Rails application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activecom'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install activecom
```

## Usage

In your layout file where you want Activecom to be avaiable add the following:

```erb
<html>
  <head></head>
  <body>
    ...

    <%= activecom_tag %>
  </body>
</html>
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
