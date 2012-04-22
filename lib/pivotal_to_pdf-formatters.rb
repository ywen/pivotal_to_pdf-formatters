p "#{File.dirname(__FILE__)}/pivotal_to_pdf-formatters/**/*.rb"
Dir["#{File.dirname(__FILE__)}/pivotal_to_pdf-formatters/**/*.rb"].each do |f| 
  require f
end
