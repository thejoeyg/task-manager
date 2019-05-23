# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project

  scope :urgent, -> { where(urgent: true) }
  scope :non_urgent, -> { where(urgent: false) }
  scope :open_tasks, -> { where(complete: false) }
end
