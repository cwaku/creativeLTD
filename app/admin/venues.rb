# app/admin/venues.rb
ActiveAdmin.register Venue do
    permit_params :name, :location, :capacity
  
    index do
      selectable_column
      id_column
      column :name
      column :location
      column :capacity
      column :created_at
      actions
    end
  
    filter :name
    filter :location
    filter :capacity
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :location
        f.input :capacity
      end
      f.actions
    end
  end
  