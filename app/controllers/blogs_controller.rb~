class BlogsController < ApplicationController
  def index
    @blogs=Blog.all
  end

  def show
    @blog=Blog.find_by(slug:params[:slug])
    redirect_to root_path, alert:'您访问点博文不存在' unless @blog
  end
end
