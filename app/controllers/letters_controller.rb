# frozen_string_literal: true

class LettersController < ApplicationController
  before_action :set_letter, only: %i[show update]

  def index
    if params[:account_id]
      render json: Account.find(params[:account_id]).letters
    else
      render json: Letter.all
    end
  end

  def show
    render json: @letter
  end

  def create
    @letter = Letter.new(
      account_id: params[:account_id],
      content: params[:content]
    )

    if @letter.save
      render json: @letter
    else
      render json: @letter.errors
    end
  end

  def update
    if @letter.update(letter_params)
      render json: @letter
    else
      render json: @letter.errors
    end
  end

  private

  # Need to verify here instead of just grabbing the account that
  # they are in fact logged in (Not sure how to handle atm)
  #
  # Potential issue where people could fake messages from other accounts
  # simply by plugging a random id
  def set_letter
    @letter = Letter.find(params[:id])
  end
end
