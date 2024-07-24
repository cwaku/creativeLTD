# app/admin/equipments.rb
ActiveAdmin.register Equipment do
    permit_params :name, :description, :availability, :cost
  
    index do
      selectable_column
      id_column
      column :name
      column :description
      column :availability
      column :cost
      column :created_at
      actions
    end
  
    filter :name
    filter :availability
    filter :cost
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :description
        f.input :availability
        f.input :cost
      end
      f.actions
    end
  end
  