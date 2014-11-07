class Blog < ActiveRecord::Base
    include TruncateHtmlHelper
    belongs_to :category
    before_save :fill_view_count
    before_save :fill_html_content
    paginates_per 4

    scope :recent, -> {order(created_at: :desc)} #按博文发布时间排序

    def self.new_preview(params)
	
    end

    def fill_view_count
        unless self.view_count
            self.view_count=0
        end
    end

    def update_blog_view_count
        update_attributes(:view_count=>self.view_count+1)
    end

    def fill_html_content
	self.html_content=MarkHelper::Markdown.render(self.content)
        self.html_content_summary=truncate_html(self.html_content,:length=>250,:omission => '', :break_token => '<!-- truncate -->')
    end
end
