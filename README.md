![From azobit.com](public/url-shortener-azobit.jpg)

# Url Short

![CodeCoverage](https://img.shields.io/badge/Code%20coverage-96.76%25-brightgreen.svg)

`A simple URL shortener written in Ruby on Rails.`

# Installation

1. Download this repo
2. `cd` to where repo is downloaded
3. Run `bundle install`
4. Start the server with `rs` or `rails s`
5. Get ready for lots of exciting url shortener fun!

# Documentation

After the server has been started you can find the swagger docs at [localhost:3000/api/docs](localhost:3000/api/docs). Everything you need is there.

There are two ways to use the generated url. Either by going to `localhost:3000/api/v1/url/<short_path>` or more simply by going to `localhost:3000/<short_path>`.

If you prefer to use `cURL` here are some sample requests you can try while the server is running:

Create a shortened URL:

`curl -XPOST -d '{ "url": "github.com"  }' http://localhost:3000/api/v1/urls -H "Content-Type: application/json"`

Redirect to original URL:

`curl localhost:3000/<short_path>`

#### Frontend

With the server running it's also possible to view all created short URLs and create a new one. Visit `localhost:3000/url`.
