class Api::QuestionsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]

  def index
    @questions = Question.all
    render "index.json.jb"
  end

  def create
    @question = Question.new(
      user_id: current_user.id,
      title: params[:title],
      body: params[:body],
    )
    if @question.save
      render "show.json.jb"
    else
      render json: { errors: @question.errors.full_messages }, status: 422
    end
  end

  def show
    @question = Question.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @question = current_user.questions.find_by(id: params[:id])
    @question.title = params[:title] || @question.title
    @question.body = params[:body] || @question.body
    if @question.save
      render "show.json.jb"
    else
      render json: { errors: @question.errors.full_messages }, status: 422
    end
  end

  def destroy
    @question = current_user.questions.find_by(id: params[:id])
    @question.destroy
    render json: { message: "Question destroyed successfully!" }
  end
end
