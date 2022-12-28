class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def show
  end

  def new
    @word = Word.new
  end

  def create
    word = Word.new(word_params)
    word.save!
    redirect_to words_url, notice: "#{word.name}を登録しました。"
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    word = Word.find(params[:id])
    word.update!(word_params)
    redirect_to words_url, notice: "#{word.name}を更新しました。"
  end

  private

  def word_params
    params.require(:word).permit(:name, :word_class, :meaning)
  end

end
