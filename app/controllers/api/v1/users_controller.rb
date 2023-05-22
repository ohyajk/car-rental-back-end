class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate
  def index
    @users = User.all
    render json: { users: @users }, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: { user: @user }, status: :ok
  end

  def create
    @user = User.new(name: params[:name])
    if @user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { error: "username #{@user.errors[:name].first}" }, status: :bad_request
    end
  end
end
