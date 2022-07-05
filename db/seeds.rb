
puts "==== Seeding the database with fixtures ===="
# File: test/fixtures/quotes.yml
system("bin/rails db:fixtures:load")