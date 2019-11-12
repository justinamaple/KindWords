# frozen_string_literal: true

class SeensController < ActionController::API
  before_action :set_account, only: %i[index]
  before_action :set_letter, only: %i[index]

  def index
    if @account
      letters_hash = @account.seens.pluck(:letter_id).to_h { |id| [id, true] }
      render json: letters_hash
    elsif @letter
      accounts_hash = @letter.seens.pluck(:account_id).to_h { |id| [id, true] }
      render json: accounts_hash
    else
      render json: Seen.all
    end
  end

  def create
    @seen = Seen.new(
      account_id: params[:account_id],
      letter_id: params[:letter_id]
    )

    if @seen.save
      render json: @seen
    else
      render json: @seen.errors
    end
  end

  private

  def set_account
    @account = Account.find(params[:account_id]) if params[:account_id]
  end

  def set_letter
    @letter = Letter.find(params[:letter_id]) if params[:letter_id]
  end
end
