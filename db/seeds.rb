# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.create(user_id: 1, title: "i am an upcoming event 2", description: "i am a description", date: 3.days.after )
Event.create(user_id: 1, title: "i am an upcoming event", description: "i am a description", date: 2.days.after )
Event.create(user_id: 1, title: "i am an old event", description: "i am a description", date: 2.days.before )
Event.create(user_id: 1, title: "i am an old 1 event", description: "i am a description", date: 3.days.before )