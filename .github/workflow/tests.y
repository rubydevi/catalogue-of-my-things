name: Tests

on: pull_request

jobs:
  rspec:
    name: RSpec
    runs-on: ubuntu-22.04
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-ruby@v1
        with:
          ruby-version: 3.1.x
      - name: Setup RSpec
        run: |
          [ -f Gemfile ] && bundle
          gem install --no-document rspec -v '>=3.0, < 4.0'
      - name: RSpec Report
        run: rspec --force-color --format documentation