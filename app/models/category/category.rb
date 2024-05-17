class Category::Category < ApplicationRecord
    self.table_name = 'categories'

    has_and_belongs_to_many :products

    
    
end
