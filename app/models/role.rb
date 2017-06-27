class Role < ApplicationRecord

  # Validations
  validates :name, :presence: true, uniqueness: true

  # Instance Methods
  def underscored_name
    name.to_s.downcase.gsub(' ', '_')
  end

  def pluralized_name
    underscored_name.pluralize
  end
  
end
