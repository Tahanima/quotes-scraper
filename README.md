# quotes-scraper
This project aims to extract the quotes and the names of their authors from the [Quotes to Scrape](http://quotes.toscrape.com/) site.

## Tools Used
* **Ruby** as the programming language
* **Selenium WebDriver** as the mechanism for navigation to web pages and extraction of data

## Usage
Prerequisites: installation of [Ruby](https://www.ruby-lang.org/en/downloads/) and [Bundler](https://bundler.io/)

On the project root, run the following commands from your terminal:

1. `bundle install`

2. `ruby scraper.rb`

A csv file will be generated containing the results. [Note: The project already contains a sample generated csv file. Feel free to delete it prior to running the above commands.]
