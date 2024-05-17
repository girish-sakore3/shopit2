require "rails_helper"

RSpec.describe Category::CategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/category/categories").to route_to("category/categories#index")
    end

    it "routes to #show" do
      expect(get: "/category/categories/1").to route_to("category/categories#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/category/categories").to route_to("category/categories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/category/categories/1").to route_to("category/categories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/category/categories/1").to route_to("category/categories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/category/categories/1").to route_to("category/categories#destroy", id: "1")
    end
  end
end
