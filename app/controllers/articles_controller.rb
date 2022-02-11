class ArticlesController < ApplicationController

  #exibindo
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end

  #criando
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Regiter was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  #edição
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article, notice: "Regiter was successfully edit."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #apagando
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other, notice: "Regiter was successfully destroy."
  end
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

  #chamar parametros de validação
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
