# encoding: utf-8
class AuthorsController < ApplicationController
  def index
    @title = "Авторы"
    @authors = Author.page(params[:page]).per(16)
  end
  
  def show
    @author = Author.find(params[:id])
    @title = "Авторы / " + @author.name
    @description = @author.description
  end
end
