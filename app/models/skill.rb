class Skill < ApplicationRecord
  def self.find_by_name(name)
    Skill.where('name ILIKE ?', "%#{name}%")
  end
end
