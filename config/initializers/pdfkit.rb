PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
  config.default_options = {
    :page_size => 'Letter',
    :encoding => 'UTF-8',
    :print_media_type => true
  }
end