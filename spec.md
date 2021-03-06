# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category) User, Post, Message, StudySession
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
        User has_many StudySessions
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
        StudySessions belong to User
- [x] Include user accounts with unique login attribute (username or email)
        created user account with unique email & password
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
      StudySessions can be created, individually shown, updated, destroyed
- [x] Ensure that users can't modify content created by other users
        if post = current_user.posts.find_by(params[:id])
- [x] Include user input validations
        User can't sign up without email & password
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
