class PlayersController < ApplicationController

  skip_before_action :authenticated , only: [:new, :create]

  before_action :current_player, only: [:show, :edit, :update]

  before_action :security_questions, only: [:new, :edit]

  def show

  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to login_path
    else
      @security_questions = ["What was your childhood nickname?", "In what city did you meet your spouse/significant other?", "What is the name of your favorite childhood friend?", "What street did you live on in third grade?"]
      render "new"
    end
  end

  def edit

  end

  def update 
    if @player.update(player_params)
      redirect_to @player
    else 
      @security_questions = ["What was your childhood nickname?", "In what city did you meet your spouse/significant other?", "What is the name of your favorite childhood friend?", "What street did you live on in third grade?"]
      render "edit"
    end
  end

  private 
    def player_params 
      params.require(:player).permit(:name, :age, :username, :password, :password_confirmation, :security_question , :security_answer)
    end

    def current_player 
      if session[:player_id]
        @player = Player.find(session[:player_id])
      else
        redirect_to login_path
      end
    end

    def security_questions 
      @security_questions = ["What was your childhood nickname?", "In what city did you meet your spouse/significant other?", "What is the name of your favorite childhood friend?", "What street did you live on in third grade?"]
    end
end
