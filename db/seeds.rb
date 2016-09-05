require 'csv'
require 'securerandom'



inserts = []
CSV.foreach("db/urls") do |row|
  inserts << "('#{row[0][1..-2]}', '#{SecureRandom.hex(3)}')"
end

sql = "INSERT INTO urls (long_url, short_url) VALUES #{inserts.join(", ")}"

Url.transaction do 
    Url.connection.execute sql
end

# inserts = []

# File.open("urlscopy", "r").each_line do |line|
#     inserts << "('#{line[1..-4]}', '#{SecureRandom.hex(3)}')"
# end

# sql = "INSERT INTO urls (long_url, short_url) VALUES #{inserts.join(", ")}"

# p sql
# Url.transaction do 
#     Url.connection.execute sql
# end
