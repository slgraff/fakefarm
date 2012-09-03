class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end
  
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(params[:question])
    redirect_to '/questions' if @question.save
  end
  
  def show  
    @question = Question.find(params[:id])    
  end
  
end