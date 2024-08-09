class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, except: [:index]
  # access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  access all: [:index, :show], user: { except: [:destroy, :new, :create, :update, :edit] }, editor: { except: [:destroy] }, super_admin: :all
  
  # GET /articles
  def index
    # @articles = Article.all
    if !current_user
      # @categories = Category.preview_mode
      @categories = Category.preview_mode
    else
      @categories = Category.with_articles
      # @categories = Category.with_articles
    end    
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    # @article = Article.new(article_params)
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if current_user == @article.user || current_user.roles.include?(:super_admin)
      if @article.update(article_params)
        redirect_to @article, notice: 'Article was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to root_path, notice: "You don't have permission to update this record"
    end    
  end

  # DELETE /articles/1
  def destroy
    if current_user == @article.user || current_user.roles.include?(:super_admin)
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
    else
      redirect_to root_path, notice: "You don't have permission to delete this record"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :content, :category_id)
    end
end
