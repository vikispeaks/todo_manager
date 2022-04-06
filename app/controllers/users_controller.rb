class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
      render plain: User.order(:name).map { |user| user.to_pleasant_string }.join("\n")
    end
    def show
    end
    def create
    end
    def update
    end
    def login
    end
  end