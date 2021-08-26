# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
u1 = User.create(name: 'Tom', email: 'tom@cat.com', password: '111111', password_confirmation: '111111')
u2 = User.create(name: 'Jerry', email: 'jerry@lovelyrat.com', password: '111111', password_confirmation: '111111')
u3 = User.create(name: 'Ironman', email: 'ironman@space.com', password: '111111', password_confirmation: '111111')
u2.articles.create(title: 'soccer_news', content: 'the world cup will be on soon!')
u2.articles.create(title: 'powerful_energy', content: 'some powerful_energy was found in the space by the scientists')
u3.articles.create(title: 'party', content: 'invites superman to go to a fancy party some day.')
u3.articles.create(title: 'research', content: 'ironman research new technology.')

u1.follow(u2)
u1.follow(u3)



