class Blog < ActiveRecord::Base
    belongs_to :category
    before_save :fill_view_count

    def fill_view_count
        unless self.view_count
            self.view_count=0
        end
    end
end