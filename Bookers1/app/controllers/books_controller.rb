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

    # 投稿成功後のサクセスメッセージを設定
    # DBへ保存する
    if book.save
      redirect_to book_path(book.id), notice: "Book was successfully created."
    else
      render action: :create
    end
    
  end

  def update
    book = Book.find(params[:id])
    
    # 更新成功後のサクセスメッセージを設定
    if book.update(book_params)
        redirect_to book_path(book), notice: 'Book was successfully updated.'
    else
        flash.now[:alert] = 'failed'
        render edit_book_path(book)
     end

  end

  def destroy
    book = Book.find(params[:id])
    # レコードを削除
    if book.destroy
        redirect_to books_path, notice: 'Book was successfully destroyed.'
    else
      render action: :index
    end

  end

  # ストロングパラメーター
  private
    def book_params
      params.require(:book).permit(:title,:body)
    end

end
