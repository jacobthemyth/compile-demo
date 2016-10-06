# frozen_string_literal: true
# Represents a group of files
class Playground < ApplicationRecord
  belongs_to :user
  has_many :files, class_name: 'SourceFile'
end
