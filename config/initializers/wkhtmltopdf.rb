# encoding: utf-8

if Rails.env.production? || Rails.env.development?
	WickedPdf.config = { :exe_path => "#{Rails.root.join('bin', 'wkhtmltopdf.exe').to_s }"} 
else
	WickedPdf.config = { :exe_path => "/usr/local/bin/wkhtmltopdf"} 
end	