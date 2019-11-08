# frozen_string_literal: true

class AccountsController < ApplicationController
  def login
    @account = Account.find_by(email: params[:email])
    if @account&.authenticate(params[:password])
      render json: @account
    else
      render json: nil
    end
  end

  def create
    @account = Account.new(
      email: params[:email],
      password: params[:password],
      icon: params[:email].initial
    )

    if @account.save
      render json: @account
    else
      render json: nil
    end
  end
end

class String
  def initial
    self[0, 1].upcase
  end
end
