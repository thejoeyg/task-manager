# README

## Description

We're passionate about productivity. We want to manage our tasks and projects more effectively. We need a simple tool that helps us control our task flow.

## Functional Requirements

- Must be able to sign in/sign up by email/password
- Must be able to create/update/delete projects
- Must be able to add tasks to my project
- Must be able to update/delete tasks
- Must be able to set/unset a deadline for my task
- Must be able to set/unset a task as 'urgent'
- Must be able to mark/unmark a task as 'done'

## UI Functional Requirements

- "Urgent' tasks should appear at the top of the list and be highlighted to indicate importance
- When a task is marked 'done', it is moved to the bottom of the task list
- When a task is unmarked 'done', it is moved back to it's original position in the task list
- Use React and and a JSON API to handle all operations on tasks
  - Creating a task should call the create API as well as add the task to the page
  - Editing a task should call the update API as well as modify the task on the page
  - Deleting a task should call the delete API as well as remove the task from the page

## Technical Requirements

- It should be a WEB application:
  - For the client side, use HTML5, CSS3, React (using the [react-rails gem](https://github.com/reactjs/react-rails))
  - For the server side, use Ruby on Rails
- It should have client side and server side validation
- It should have a user authentication solution. The user should only have access to his/her own projects and tasks (Devise, Cancancan);
- It should have automated tests for all functionality (models - RSpec, controllers - RSpec, system tests - RSpec + Capybara + Selenium);

## Additional Notes

- Be creative in your approach.  We're leaving some of the decision making to you.
- If something is unclear or uncertain, feel free to make an executive decision in order to get past it.  Not all information is provided and we want to see how you work in situations where you might not have all the answers in front of you.
- If you find yourself blocked, please make note of the block, continue on what you can and make sure you leave any comments as to why you felt you were blocked.

## Going above and beyond

- Allow a superuser type user to create projects and tasks and assign them to normal users
- Integrate Sidekiq to handle sending email notifications when a project is assigned to the user
- Make it a full SPA in React
- Wow us with something we may not have seen before!
