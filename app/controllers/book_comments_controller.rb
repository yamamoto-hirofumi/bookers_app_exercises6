class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = BookComment.new(book_comment_params)
    @comment.book_id = @book.id
    @comment.user_id = current_user.id
    if @comment.save
       render :create
    else
      @book = Book.find(params[:book_id])
      @book_new = Book.new
      render 'books/show'
    end
  end

  def destroy
     @book = Book.find(params[:book_id])
     book_comment = @book.book_comments.find(params[:id])
     book_comment.destroy
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
