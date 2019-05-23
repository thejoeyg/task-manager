# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks, -> { order(urgent: :desc, created_at: :desc, complete: :asc) }, dependent: :destroy
end
