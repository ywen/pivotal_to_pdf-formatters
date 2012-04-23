# PivotalToPdf::Formatters

The gem provides the formatters for the pivotal_to_pdf gem.

## Installation

Add this line to your application's Gemfile:

    gem 'pivotal_to_pdf-formatters'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pivotal_to_pdf-formatters

## Usage

The gem needs to use with pivotal_to_pdf gem. It provides the formatters for the pivotal_to_pdf.

To use an existing formatter, Please see the [pivotal_to_pdf README](https://github.com/ywen/pivotal_to_pdf) formatters section.

To add a formatter, please fork this project, add you own formatter, submit a PR, and I will merge it if I decide no harm can be done and update the version. Once the new version of this gem is released, you can update the gem and your formatter should be ready for use.

### Coding standard

A formatter must have 2 public interfaces for it to work:

- ```initialize``` takes an array of stories and create a new instance
- ```write_to``` method writes to the your chosen output (PDF, HTML, etc.) in your style.

Your formatter can extends from ```PivotalToPdf::Formatters::Base``` to have ```initialize``` method available.

The ```Default``` formatter is a bad example how to write code. I expect some tests along with your formatter.
Design it good, do not afraid adding more help classes when needed.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
