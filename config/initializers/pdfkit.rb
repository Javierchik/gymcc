PDFKit.configure do |config|
  config.wkhtmltopdf = 'D:\Archivos de programa\wkhtmltopdf'
  config.default_options = {
    :page_size => 'Letter'
  }
end