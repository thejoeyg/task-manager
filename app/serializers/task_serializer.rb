# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  attributes  :id,
              :title,
              :description,
              :urgent,
              :deadline_at,
              :created_at,
              :updated_at,
              :project_name

  def project_name
    self.object.project.name
  end
end
