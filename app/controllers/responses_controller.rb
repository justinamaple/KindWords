class ResponsesController < ApplicationController
  before_action :set_response, only: %i[show]
  def show
    render json: @response
  end

  def create
    @response = Response.new(
      account_id: params[:account_id],
      letter_id: params[:letter_id],
      content: params[:content]
    )

    if @response.save
      render json: @response
    else
      render json: @response.errors
    end
  end

  private

  def set_response
    @response = Response.find(params[:id])
  end
end
