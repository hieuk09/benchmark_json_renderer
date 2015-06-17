# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Creating authors...'

authors = 100.times.map do
  Author.create(name: Faker::Name.name, info: Faker::Lorem.paragraph, birthday: Faker::Date.birthday)
end

puts 'Creating books...'

10000.times do
  index = rand(100)
  author = authors[index]
  Book.create(name: Faker::Lorem.sentence, genre: Faker::Lorem.word, isbn: Faker::Code.isbn, author: author)
end
