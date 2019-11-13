# frozen_string_literal: true

class AccountsController < ApplicationController
  def login
    @account = Account.find_by(email: params[:email])
    errors = {
      'errors': {
        'incorrect': 'email and/or password'
      }
    }

    if @account&.authenticate(params[:password])
      render json: { accountId: @account.id, icon: @account.icon }
    else
      render json: errors
    end
  end

  def create
    @account = Account.new(
      email: params[:email],
      password: params[:password],
      icon: params[:email].initial
    )

    if @account.save
      render json: { accountId: @account.id, icon: @account.icon }
    else
      render json: { 'errors': @account.errors }
    end
  end
end

class String
  def initial
    self[0, 1].upcase
  end
end
