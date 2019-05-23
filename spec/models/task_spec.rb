# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'urgency' do
    let!(:project) { Project.create!(id: 'TEST_PROJECT', name: 'Test Project') }

    let!(:urgent_task) do
      Task.create!(
        title: 'Urgent',
        description: 'Urgent Task',
        urgent: true,
        project_id: 'TEST_PROJECT'
      )
    end

    let!(:non_urgent_task) do
      Task.create!(
        title: 'Urgent',
        description: 'Urgent Task',
        urgent: false,
        project_id: 'TEST_PROJECT'
      )
    end

    it 'only shows urgent tasks' do
      results = Task.urgent

      expect(results.count).to eq(1)
      expect(results.first.id).to eq(urgent_task.id)
    end

    it 'only shows non_urgent tasks' do
      results = Task.non_urgent

      expect(results.count).to eq(1)
      expect(results.first.id).to eq(non_urgent_task.id)
    end
  end

  describe 'validations' do
    it 'validates name and description' do
      task = Task.new(title: 'Title', description: 'description')
      task.valid?

      expect(task.title).to eq('Title')
    end
  end
end
