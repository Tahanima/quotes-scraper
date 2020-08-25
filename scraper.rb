require 'selenium-webdriver'
require 'webdrivers/chromedriver'
require 'csv'

$driver
$info = [['Quote', 'Author']]

def setup
  option = Selenium::WebDriver::Chrome::Options.new
  option.add_argument('--headless')

  $driver = Selenium::WebDriver.for :chrome, options: option
end

def teardown
  $driver.quit
end

def write_to_csv
  CSV.open('quotes.csv', 'w') do |csv|
    $info.each { |row| csv << row }
  end
end

def go_to(page_no)
  url = 'http://quotes.toscrape.com/page/'.concat(page_no.to_s)
  $driver.navigate.to(url)
end

def scrape
  quotes = $driver.find_elements(class_name: 'quote')

  quotes.each do |quote|
    text = quote.find_element(class_name: 'text').text
    author = quote.find_element(class_name: 'author').text
 
    $info << [text, author] 
  end
end

def has_quotes?
  $driver.find_elements(class_name: 'quote').size() > 0
end

def main
  setup
  page_no = 1

  loop do
    go_to page_no
    break if !has_quotes?
    scrape
    page_no += 1
  end

  teardown
  write_to_csv
end

main