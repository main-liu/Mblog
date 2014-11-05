class Console::BlogsController < ApplicationController
  def index
    @blogs=Blog.all
  end

  def new
    @blog=Blog.new
  end

  def create
    @blog=Blog.new blog_params
    if @blog.save
        redirect_to console_blogs_path,notice:'发表成功!'
    else
        render 'new'
    end
  end

  def edit
    @blog=Blog.find(params[:id])
  end

  def update
    if Blog.find(params[:id]).update_attributes blog_params
	redirect_to console_blogs_path,notice:'修改成功'
    else
	render 'edit'
    end
  end

  def destroy
  end

  private
    def blog_params
	params.require(:blog).permit(:title,:slug,:category_id,:content,:status,:view_count)
    end
end
