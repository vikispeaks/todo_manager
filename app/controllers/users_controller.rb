class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
      render plain: User.order(:name).map { |user| user.to_pleasant_string }.join("\n")
    end
    def create
        name = params[:name]
        email = params[:email]
        password = params[:password]
        new_user = User.create!(
          name: name,
          email: email,
          password: password,
        )
        render plain: new_user.to_pleasant_string
    end
    def show
    end
    def update
    end
    def login
    end
  end