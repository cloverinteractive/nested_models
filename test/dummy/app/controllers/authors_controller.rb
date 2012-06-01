class AuthorsController < ApplicationController
  before_filter :find_author, :only => [ :edit, :update, :destroy ]

  def index
    @authors = Author.includes(:books).all
  end

  def new
    @author = Author.new
    @author.books.build
  end

  def create
    @author = Author.new params[:author]

    if @author.save
      redirect_to authors_path
    else
      render :new
    end
  end

  def update
    if @author.update_attributes params[:author]
      redirect_to authors_path
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private
  def find_author
    @author = Author.find params[:id]
  end
end
