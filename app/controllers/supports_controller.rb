class SupportsController < ApplicationController
  def index
    @elderlies = current_user.supports_as_elderly
    @trusted_users = current_user.supports_as_trusted_user
    @supports = policy_scope(Support)
  end

  def show
    @support = current_user.supports_as_elderly.find(params[:id])
    authorize @support
  end
end
