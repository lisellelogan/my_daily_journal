beemo = User.create(name: "Beemo", email: "beemothecorgi@dog.com", password: "corgibutts")
JournalEntry.create(date: "December 10th 2020", content: "Today was a lazy day.", user_id: beemo.id)
JournalEntry.create(date: "December 11th 2020", content: "Today was a productive day.", user_id: beemo.id)

seymour = User.create(name: "Seymour", email: "seymourthebeagle@dog.com", password: "beaglesrule")
JournalEntry.create(date: "December 12th 2020", content: "I went for three walks today!", user_id: seymour.id)
JournalEntry.create(date: "December 13th 2020", content: "It rained all day.", user_id: seymour.id)
