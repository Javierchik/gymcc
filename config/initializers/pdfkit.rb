PDFKit.configure do |config|
  config.wkhtmltopdf = 'D:\Archivos de programa\wkhtmltopdf\wkhtmltopdf.exe'
  config.default_options = {
    :page_size => 'Letter',
    :encoding => 'UTF-8',
    :print_media_type => true
  }
end