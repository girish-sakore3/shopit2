class Product < ApplicationRecord
  has_and_belongs_to_many :categories, class_name: 'Category::Category'

  validates :name, :price, :description, :url, :presence => true

  before_update :validate_pictures
  has_many_attached :pictures
  has_one_attached :video
  
  def validate_pictures
    puts "==========><============="
    if !(pictures.attached?)
      puts "------------>1<-----------"
      params[:product].extract!(:pictures)
    end
  end
end
