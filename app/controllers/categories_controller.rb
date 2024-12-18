class CategoriesController < ApplicationController
  def index
    @tags = Category.all
  end

  def new
    @tag = Category.new
  end

  def create
    @tag = Category.new(user: Current.session.user, name: category_params[:name])
    if @tag.save
      redirect_to categories_path, notice: "New Category added"
    else
      render :new, status: :unprocessable_entity # status code 422
    end
  end

  def show
    @tag = Category.find(params[:id])
  end

  def edit
    @tag = Category.find(params[:id])
  end

  def update
    @tag = Category.find(params[:id])
    if @tag.user == Current.session.user
      if @tag.update(category_params)
        redirect_to categories_path
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to categories_path, alert: "You are not authorized to update"
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
