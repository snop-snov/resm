module ResourceRepository
  extend ActiveSupport::Concern
  included do
    scope :allocated, -> { where.not(user: nil) }
    scope :deallocated, -> { where(user: nil) }
  end
end
