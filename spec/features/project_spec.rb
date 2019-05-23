# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Project Management', type: :feature do
  before(:each) do
    user = User.create!(
      email: 'test@test.com',
      password: "password",
      password_confirmation: "password"
    )
    sign_in user
  end

  let!(:project_1) { Project.create!(name: 'Project 1') }
  let!(:project_2) { Project.create!(name: 'Project 2') }

  let!(:task_1) do
    Task.create!(
      project_id: project_1.id,
      title: 'Task Title',
      description: 'Task Description'
    )
  end

  scenario 'User sees project list' do
    visit projects_path
    expect(page).to have_content("#{project_1.name} (1)")
    expect(page).to have_content(project_2.name)
  end

  scenario 'User sees project and its tasks' do
    visit project_path(project_1.id)
    expect(page).to have_content(project_1.name)
    expect(page).to have_content(task_1.title)
  end

  scenario 'User can edit project name' do
    visit project_path(project_1.id)

    fill_in 'name', with: 'Edited Name'
    click_button 'update_project'

    expect(current_path).to eq(project_path(project_1.id))
    expect(page).to have_content('Edited Name')
    expect(page).to have_content(task_1.title)
  end

  scenario 'User sees project and its tasks' do
    visit project_path(project_1.id)
    click_link 'Add Task'
    expect(current_path).to eq(new_project_task_path(project_1.id))
  end
end
