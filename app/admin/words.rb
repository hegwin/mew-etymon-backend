ActiveAdmin.register Word do
  menu priority: 2

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :spelling,
    :meaning,
    :etymon_analysis

  index do
    selectable_column
    column :id
    column :spelling
    column :meaning
    column 'Etymons' do |word|
      ul do
        word.etymons.each do |etymon|
          li do
            link_to etymon.spelling, admin_etymon_path(etymon)
          end
        end
      end
    end
    actions
  end

  show do
    attributes_table do
      row :spelling
      row :meaning
      row :etymon_analysis do |word|
        simple_format word.etymon_analysis
      end

      row :created_at
      row :updated_at
    end

    active_admin_comments
  end

  filter :spelling
  filter :meaning
  filter :created_at
  filter :updated_at

  controller do
    def scoped_collection
      super.includes :etymons
    end
  end
end
