class Api::AnswersController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]

  def index
    @answers = Answer.all
    render "index.json.jb"
  end

  def create
    @answer = Answer.new(
      user_id: current_user.id,
      question_id: params[:question_id],
      body: params[:body],
    )
    if @answer.save
      render "show.json.jb"
    else
      render json: { errors: @answer.errors.full_messages }, status: 422
    end
  end

  def show
    @answer = Answer.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @answer = current_user.answers.find_by(id: params[:id])
    @answer.body = params[:body] || @answer.body
    if @answer.save
      render "show.json.jb"
    else
      render json: { errors: @answer.errors.full_messages }, status: 422
    end
  end

  def destroy
    @answer = current_user.answers.find_by(id: params[:id])
    @answer.destroy
    render json: { message: "answer destroyed successfully!" }
  end
end
