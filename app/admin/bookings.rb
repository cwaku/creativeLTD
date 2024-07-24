ActiveAdmin.register Booking do
    permit_params :event_id, :user_id, :venue_id, :date, :status, equipment_ids: []
  
    index do
      selectable_column
      id_column
      column :event
      column :user
      column :venue
      column :date
      column :status
      actions
    end
  
    filter :event
    filter :user
    filter :venue
    filter :date
    filter :status
  
    form do |f|
      f.inputs do
        f.input :event
        f.input :user
        f.input :venue
        f.input :date
        f.input :status, as: :select, collection: ['pending', 'approved', 'rejected'], include_blank: false
        f.input :equipments, as: :check_boxes
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :event
        row :user
        row :venue
        row :date
        row :status
        row :equipments do |booking|
          booking.equipments.map(&:name).join(", ")
        end
      end
      active_admin_comments
    end
  end
  