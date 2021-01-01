# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    - installed sinatra and the corneal gem to build out an MVC utilizing ruby, html, and css to build the web application
- [x] Use ActiveRecord for storing information in a database
    - created models that inherited from ActiveRecord::Base 
- [x] Include more than one model class (e.g. User, Post, Category)
    - There is a User class and JournalEntry class
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - A user has many journal entries
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - journal entries belong to a user
- [x] Include user accounts with unique login attribute (username or email)
    - created validation for email uniqueness
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - created journal_entries controller with RESTful routes
- [x] Ensure that users can't modify content created by other users
    - added conditional in edit and delete routes to see if the current user logged in matches the journal entry's user id
- [x] Include user input validations
    - included validations for presence of name and email and uniqueness for email in User class
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    - displayed error messages in sign up page if no valid input
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message