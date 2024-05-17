ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :url, :price, :description, :features, :video, category_ids:[], pictures:[]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :url, :price, :description, :features, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form title: 'Add Product' do |f|
    tabs do
      tab 'Details' do
        f.input :name
        f.input :url
        f.input :description
        f.input :features
        f.input :categories, as: :check_boxes
      end
      tab 'Media Files' do
        f.label 'Select Images'
        f.file_field :pictures, multiple: true
        f.label 'Select video'
        f.file_field :video
      end
    end
    f.actions
  end

  show title: 'Product' do
    h1 product.name
    attributes_table do
      row :url
      row :description
      row :features
      row :categories
      row :pictures do
        ul do
          (product.pictures).each do |pic|
            li do
              image_tag(url_for(pic), style: "height: 200px")
            end
          end
        end
      end
      row ('video') do
        video_tag(url_for(product.video), controls: '', style: "height: 300px;")
      end
    end
    # link_to "Delete Pictures", delete_pictures_admin_product_path
    # link_to "Delete Video", delete_video_admin_product_path
    # video_tag(url_for(note.clips.first), controls: '', style: "height: 400px; width: 400px")

    # (note.clips).select do |clip|
    #   div do
    #     video_tag(url_for(clip), controls: '', style: "height: 400px; width: 400px")
    #   end
    # end
  end
  # member_action :delete_pictures, method: :delete do
  #   product.pictures.destroy_all
  # end
  # member_action :delete_video, method: :delete do
  #   product.video.destroy
  # end
index do
  panel "Actions" do
    render partial: 'remote_functions', locals: {upload_art: upload_art}
  end
  render partial: 'remote_functions'
end

end
