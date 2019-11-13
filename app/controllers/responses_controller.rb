# frozen_string_literal: true

class ResponsesController < ApplicationController
  before_action :set_letter, only: %i[index]
  before_action :set_response, only: %i[show]

  def index
    render json: @letter.responses
  end

  def show
    render json: @response
  end

  def create
    @response = Response.new(
      account_id: params[:account_id],
      letter_id: params[:letter_id],
      content: params[:content],
      icon: params[:icon]
    )

    if @response.save
      render json: @response
    else
      render json: @response.errors
    end
  end

  private

  def set_letter
    @letter = Letter.find(params[:letter_id])
  end

  def set_response
    @response = Response.find(params[:id])
  end
end
