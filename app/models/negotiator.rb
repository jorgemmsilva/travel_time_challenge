class Negotiator < ApplicationRecord
	scope :all_ordered, -> { order(:id) }
    has_many :routes, dependent: :destroy

    # When a trip is created, populate it automatically with the first point on the rentify office
    after_create do
        self.routes << Route.create
    end

end
