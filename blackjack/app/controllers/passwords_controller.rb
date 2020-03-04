class PasswordsController < ApplicationController
  skip_before_action :authenticated , only: [:edit, :update]
  def edit
    @security_questions = ["What was your childhood nickname?", "In what city did you meet your spouse/significant other?", "What is the name of your favorite childhood friend?", "What street did you live on in third grade?"]
  end

  def update 
    @player = Player.find_by(username: params[:username])
    if @player && @player.security_question == params[:security_question] && @player.security_answer == params[:security_answer]
      @player.update(password: params[:password])
      redirect_to login_path 
    else
      @security_questions = ["What was your childhood nickname?", "In what city did you meet your spouse/significant other?", "What is the name of your favorite childhood friend?", "What street did you live on in third grade?"]
      flash[:password_errors] = ["Invalid input"]
      render "edit"
    end

  end
end
