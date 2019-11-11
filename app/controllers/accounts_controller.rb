# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :set_account, only: %i[seen]

  def login
    @account = Account.find_by(email: params[:email])
    if @account&.authenticate(params[:password])
      render json: @account
    else
      render json: @account.errors
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
      render json: @account.errors
    end
  end

  def seen
    letters_seen = @account.seens.pluck(:letter_id)
    letters_seen.sort!.reverse!

    render json: letters_seen
  end
end

class String
  def initial
    self[0, 1].upcase
  end
end

private

def set_account
  @account = Account.find(params[:id])
end