# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Response.destroy_all
Seen.destroy_all
Letter.destroy_all
Account.destroy_all

account1 = Account.create(email: 'justinamaple@gmail.com', password: 'asdf', icon: 'J')
account2 = Account.create(email: 'kara@gmail.com', password: 'fdsa', icon: 'K')
account3 = Account.create(email: 'brian@gmail.com', password: 'yaya', icon: 'B')
account4 = Account.create(email: '1@gmail.com', password: 'password', icon: '1')
account5 = Account.create(email: '2@gmail.com', password: 'password', icon: '2')
account6 = Account.create(email: '3@gmail.com', password: 'password', icon: '3')

letter1 = account1.letters.create(content: 'so lonely')
letter1.responses.create(account_id: account2.id, content: 'ill be your friend')
letter1.responses.create(account_id: account3.id, content: 'you are not alone')
letter1.responses.create(account_id: account4.id, content: 'be well my dear')
letter1.responses.create(account_id: account5.id, content: 'good things will come')

letter2 = Letter.create(account: account2, content: 'much sad')
Response.create(account_id: account1.id, letter: letter2, content: 'sending hugs')
Response.create(account_id: account3.id, letter: letter2, content: 'things will get better')

Letter.create(account: account3, content: 'much sad')
Letter.create(account: account4, content: 'much sad')
Letter.create(account: account5, content: 'much sad')
Letter.create(account: account6, content: 'much sad')

10.times do
  letter = Letter.create(account: account1, content: 'too sad')
  Seen.create(account: account1, letter: letter)

  Letter.create(account: account1, content: 'i am so sad')
  Letter.create(account: account1, content: 'oh so sad')
  Letter.create(account: account1, content: 'v v sad')
  Letter.create(account: account1, content: 'muy triste')
end

Seen.create(account: account1, letter: letter1)
Seen.create(account: account1, letter: letter2)
Seen.create(account: account2, letter: letter1)
