class SupportPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def send_sms?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end
end
