class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    @articles = Article.new
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new'
    end
  end
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  private

  def article_params
    params.require(:article).permit(:title, :description)
  end



end
