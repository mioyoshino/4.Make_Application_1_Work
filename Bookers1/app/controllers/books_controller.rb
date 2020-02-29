class BooksController < ApplicationController
  def top
  end

  def index
    # Bookモデルのインスタンス 空のモデルオブジェクトを生成しておくことで、DBがnilでも通る
    @book = Book.new

    # 一覧取得
    @books = Book.all
  end

  def show
    # idで、Bookモデルから1件のレコードを取得
    @book = Book.find(params[:id])
  end

  def edit
    # idで、Bookモデルから1件のレコードを取得
    @book = Book.find(params[:id])
  end

  def create
    # ストロングパラメータを設定
    book = Book.new(book_params)
    # DBへ保存する
    book.save
    # 投稿が完了したらindexへリダイレクトさせる
    redirect_to books_path
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)

    redirect_to book_path(book.id)

  end

  def destroy
  end

  # ストロングパラメーター
  private
    def book_params
      params.require(:book).permit(:title,:body)
    end

end
