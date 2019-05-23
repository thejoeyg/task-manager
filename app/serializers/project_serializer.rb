# frozen_string_literal: true

class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :tasks
end
