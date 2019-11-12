class SeensController < ActionController::API
  def seen
    @account = Account.find(params[:account_id])
    letters_hash = @account.seens.pluck(:letter_id).to_h { |id| [id, true] }

    render json: letters_hash
  end

  def create
    @seen = Seen.new(account_id: params[:account_id], letter_id: params[:letter_id])

    if @seen.save
      render json: @seen
    else
      render json: @seen.errors
    end
  end
end
