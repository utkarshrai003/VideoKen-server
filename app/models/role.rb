class Role < ApplicationRecord

  # Associations
  has_many :user_roles, :inverse_of => :role, :dependent => :destroy

  # Validations
  validates :name, presence: true, uniqueness: true

  # Instance Methods
  def underscored_name
    name.to_s.downcase.gsub(' ', '_')
  end

  def pluralized_name
    underscored_name.pluralize
  end

end
