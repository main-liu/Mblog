class BlogsController < ApplicationController
  def index
    @blogs=Blog.all
  end

  def category
    @category= Category.find_by(name:params[:name])
    puts @category
    @blogs
    if @category.nil?
        @blogs=Blog.where(category_id:0)
    else
        @blogs=Blog.where(:category_id=> @category.id).order('created_at DESC')
    end
    render 'index'
  end

  def show
    @blog=Blog.find_by(slug:params[:slug])
    redirect_to root_path, alert:'您访问点博文不存在' unless @blog
  end
end
