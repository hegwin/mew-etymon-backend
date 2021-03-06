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
    column 'Etymons', :etymons_string
    actions
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
