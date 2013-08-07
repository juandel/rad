#encoding: utf-8
ActiveAdmin.register Work do
  index do
    column :order_work_by
    column :name
    column :category
    column :detail
    column :created_at
    default_actions
  end

  show do |work|
    attributes_table do
      row :name
      row :detail
      row :category
      row :order_work_by
      row :images do |item|
          item.images.collect do |image|
            image_tag(image.file.url(:small))
          end.join.html_safe
        end
    end
    active_admin_comments
  end 

  form html: {id: 'has_many_images', multipart: true} do |f|
    f.inputs("#{f.object.class.to_s} Details") do
      f.input :name, as: :string
      f.input :category, :as => :select, :collection => ["cover", "poster", "identity", "random"]
      f.input :detail, as: :text
      f.input :order_work_by, as: :number
    end
    f.has_many :images, title: 'images' do |fi|
      fi.inputs "Images" do
        if fi.object.new_record?
          fi.input :file, as: :file
        else
          fi.input :_destroy, :as => :boolean, :label => "Destroy?",
            :hint => fi.template.image_tag(fi.object.file.url(:small))
          fi.input :cover, :as => :boolean, :label => "Cover"
        end
      end
    end 
    f.actions 
  end 
end