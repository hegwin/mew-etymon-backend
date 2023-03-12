ActiveAdmin.register Etymon do
  menu priority: 2

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :spelling,
    :meaning,
    :source,
    :evolution,
    :words_string

  index do
    selectable_column
    column :id
    column 'Spelling' do |etymon|
      strong do
        etymon.spelling
      end
    end
    column :meaning
    column 'Words', :words_string
    actions
  end

  show do
    attributes_table do
      row :spelling do
        strong do
          etymon.spelling
        end
      end
      row :source
      row :meaning
      row :evolution
      row :created_at
      row :updated_at
    end

    panel 'Associated words' do
      ul do
        etymon.words.each do |word|
          li do
            link_to word.spelling, admin_word_path(word)
          end
        end
      end
    end

    active_admin_comments
  end

  # https://activeadmin.info/3-index-pages.html#index-filters
  filter :spelling
  filter :meaning
  filter :source
  filter :created_at
  filter :updated_at

  controller do
    def scoped_collection
      super.includes :words
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :spelling
      f.input :meaning
      f.input :source, as: :select, collection: Language.order(:name).pluck(:name)
      f.input :evolution, input_html: { rows: 6 }
    end
    f.inputs 'Words' do
      f.input :words_string
    end
    f.actions
  end
end
