# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Account.destroy_all
Letter.destroy_all
Response.destroy_all

account1 = Account.create(email: 'justinamaple@gmail.com', password: 'asdf')
account2 = Account.create(email: 'kara@gmail.com', password: 'fdsa')
account3 = Account.create(email: 'brian@gmail.com', password: 'yaya')

letter1 = account1.letters.create(content: 'so lonely')
letter1.responses.create(account_id: account2.id, content: 'ill be your friend')
letter1.responses.create(account_id: account3.id, content: 'you are not alone')

letter2 = Letter.create(account: account2, content: 'much sad')
Response.create(account_id: account1.id, letter: letter2, content: 'sending hugs')
Response.create(account_id: account3.id, letter: letter2, content: 'things will get better')
