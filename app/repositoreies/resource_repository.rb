module ResourceRepository
  extend ActiveSupport::Concern
  included do
    scope :allocated, -> { where.not(user: nil) }
    scope :deallocated, -> { where(user: nil) }
    scope :by_name, -> { all.sort_by { |r| r.name[1..-1].to_i } }
  end
end
