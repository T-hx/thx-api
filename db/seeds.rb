# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
User.create(email: 'test@test.com', password: 'testtest', nickname: 'shun', name: 'shun takagi', thx_balance: 1000, address: '123')
User.create(email: 'test2@test.com', password: 'testtest2', nickname: 'tarou', name: 'tarou sasaki', thx_balance: 1000, address: '234')
User.create(email: 'test3@test.com', password: 'testtest3', nickname: 'hazime', name: 'hazime kato', thx_balance: 1000, address: '345')
User.all.each{|user| user.avatar.attach(io: File.open("#{File.join(Rails.root, "lib", "default_avatar.png")}"), filename: "default_avatar.png", content_type: "image/png")}
