class Console::CategoriesController < ApplicationController
  def index
    @categories=Category.all
  end

  def new
    @category=Category.new
  end

  def create
    @category=Category.new(category_params)
    if @category.save
      redirect_to console_categories_path,notice:'添加成功！'
    else
      render 'new'
    end
  end

  def edit
    @category=Category.find(params[:id])
  end

  def update
    if Category.find(params[:id]).update_attributes category_params
      redirect_to console_categories_path,notice:'修改成功!'
    else
      render 'edit'
    end	
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to console_categories_path,notice:'删除成功！'
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
