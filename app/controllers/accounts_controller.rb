# frozen_string_literal: true

class AccountsController < ApplicationController
  def create
    account = Account.new(
      email: params[:email],
      password: params[:password],
      icon: params[:email].initial
    )

    if account.save
      session[:account_id] = account.id
      # flash[:success] = 'Succesffuly Created Acccount!'
    else
      # flash[:warning] = 'Invalid Email/Password'
    end
  end
end

class String
  def initial
    self[0, 1].upcase!
  end
end
