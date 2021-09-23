class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      # So all the rentals booked by one user show on the rentals#index page
      scope.where(user:user)
    end
  end

  def create?
    true
  end

    def show?
    true
  end
end

