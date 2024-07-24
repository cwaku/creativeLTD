# app/admin/users.rb
ActiveAdmin.register User do
    permit_params :name, :email, :contact, :role
  
    index do
      selectable_column
      id_column
      column :name
      column :email
      column :contact
      column :role
      column :created_at
      actions
    end
  
    filter :name
    filter :email
    filter :contact
    filter :role
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :email
        f.input :contact
        f.input :role, as: :select, collection: User.roles.keys
      end
      f.actions
    end
  end
  