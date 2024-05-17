ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :photo, :name, :email, :number, :password, :address, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :number, :password_digest, :address, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  form title: 'Users' do |f|
    f.inputs 'User' do
      f.file_field :photo
      f.input :name
      f.input :email
      f.input :number
      f.input :password
      f.input :address
      f.input :status
    end
    f.actions
  end

  show title: 'Profile' do
    div(style: "display:flex;") do
      div do
        div(class: 'body-div') do
          image_tag user.photo
        end  
        h1 user.name.capitalize
      end
      div do
        default_main_content
      end
    end
  end
end
