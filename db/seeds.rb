beemo = User.create(name: "Beemo", email: "beemothecorgi@dog.com", password: "corgibutts")
JournalEntry.create(date: "December 10th 2020", content: "Today was a lazy day.", user: beemo)
JournalEntry.create(date: "December 11th 2020", content: "Today was a productive day.", user: beemo)
