class WordsController < ApplicationController
  def index
    @words = Word.all
    @modify_text = modify_text(Word.where('created_at >= ?', Date.today))
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
    @word = Word.find(params[:id])
    @word.update!(word_params)
    redirect_to words_url, notice: "#{@word.name}を更新しました。"
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to words_url, notice: "#{@word.name}を削除しました。", status: :see_other
  end

  private

  def word_params
    params.require(:word).permit(:name, :word_class, :meaning)
  end

  def modify_text(words_created_at_today)
    return "なし" if words_created_at_today.empty?
      
    texts = ""
    
    words_created_at_today.each do |word|
      texts += "|"
      texts += " " + word.name + " "
      texts += "|"
      texts += " " + word.word_class_i18n +  " "
      texts += "|"
      texts +=  " " + word.meaning +  " "
      texts += "|"
      texts += "\n"
    end
    return texts
  end

end
