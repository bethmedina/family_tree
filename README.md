##Family Tree

* Someone enters a name and an email address and a family member is created.
* The person can create messages to display on their profile wall.
* The person can create additional family member profiles by entering their name and email and relationship. (claiming family member profiles by others is not part of this exercise)
* A members profile will display the number of family members, links to related members profiles and relationships they have (limited to children, parents, grandparents for this exercise) and any messages the the member has created. Each member profile displays only their own messages.
* A developer should be able to call @pretend_instance_var_name.children, @pretend_instance_var_name.grandchildren, or @pretend_instance_var_name.parent to retrieve associated family members in console.
* I should be able to search for a member profile

Optional: Add an integration to the API of your choice (twitter, trello, hipchat, slack) to announce a new family member created.

Preferred: Use HAML for the views and Postgres for the database. Post to a bitbucket, github, or send zip files including .git file with commit history along with a link to the demo application.

##Notes

I am having a problem in family_member.rb. When I call @person.grandparent from the app
all is well, but if I call @person.grandparent from the console I get a NoMethodError
if @person does not have a parent or grandparent. Got sick of fiddling w/ that
last night and haven't looked at it yet today.

I know I need more tests.

I want to get this over to them ASAP. How much time do you think I ought to spend
trying to get this to be better? Time is of the essence. They need to hire someone.
