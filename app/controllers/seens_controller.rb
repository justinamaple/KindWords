class SeensController < ActionController::API
  def seen
    @account = Account.find(params[:account_id])
    letters_seen = @account.seens.pluck(:letter_id)
    letters_seen.sort!.reverse!

    render json: letters_seen
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
