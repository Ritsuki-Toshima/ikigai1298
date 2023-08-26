class HealthRecordPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

    def show?
      true
    end

    def new?
      true
    end

    def cretae?
      true
    end
  end
end
