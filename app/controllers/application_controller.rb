class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # so pundit is used in every controller
  include Pundit

  # Pundit: white-list approach.
  # after each action, we verify that we have the user has the authorization to
  # access the page except for index

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private
  # we skip pundit for pages of controller pages and for devise controller
  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
