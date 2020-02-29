class BooksController < ApplicationController
  def top
  end

  def index
    # Bookモデルのインスタンス 空のモデルオブジェクトを生成しておくことで、DBがnilでも通る
    @book = Book.new
  end

  def show
  end

  def edit
  end

  def create
    # ストロングパラメータを設定
    book = Book.new(book_params)
    # DBへ保存する
    book.save
    # 投稿が完了したらindexへリダイレクトさせる
    redirect_to '/books'
  end

  def destroy
  end

  def update
  end

  # ストロングパラメーター
  private
    def book_params
      params.require(:book).permit(:title,:body)
    end

end
