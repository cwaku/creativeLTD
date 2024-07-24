# app/admin/events.rb
ActiveAdmin.register Event do
    permit_params :name, :date, :venue_id, :user_id, equipment_ids: []
  
    index do
      selectable_column
      id_column
      column :name
      column :date
      column :venue
      column :user
      actions
    end
  
    filter :name
    filter :date
    filter :venue
    filter :user
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :date, as: :datepicker
        f.input :venue
        f.input :user
        f.input :equipments, as: :check_boxes, collection: Equipment.all
      end
      f.actions
    end
  end
  