# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project

  scope :urgent, -> { where(urgent: true) }
  scope :non_urgent, -> { where(urgent: false) }
  scope :open_tasks, -> { where(complete: false) }
  scope :closed_tasks, -> { where(complete: true) }

  validates :title, presence: true
  validates :description, presence: true
end
