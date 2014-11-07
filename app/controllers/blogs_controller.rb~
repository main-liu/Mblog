class BlogsController < ApplicationController
  def index
    @blogs=Blog.recent.where(:status=>1).page(params[:page])
  end

  def category
    @blogs=Blog.recent.joins(:category).where("categories.name = ? AND status = 1", params[:name]).page(params[:page])
    render 'index'
  end

  def show
    @blog=Blog.find_by(slug:params[:slug])
    @blog.update_blog_view_count
    #raise ActiveRecord::RecordNotFound if @blog.nil?
    redirect_to root_path, alert:'您访问点博文不存在' unless @blog
  end
end
