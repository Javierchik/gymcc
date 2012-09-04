PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
  config.default_options = {
    :page_size => 'Letter'
  }
end