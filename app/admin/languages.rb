ActiveAdmin.register Language do
  menu priority: 3

  permit_params :parent_id, :name, :name_cn, :period, :description

  controller do
    helper ActionView::Helpers::TextHelper

    def scoped_collection
      super.includes :parent
    end
  end

  index do
    selectable_column
    column :id
    column :name
    column :name_cn
    column :period
    column :parent
    column :description do |language|
      language.description.present? ? language.description.first(20) + '...'  : 'N/A'
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :parent
      f.input :name
      f.input :name_cn, label: 'Name CN'
      f.input :period
      f.input :description, input_html: { rows: 6 }
    end
    f.actions
  end
end
