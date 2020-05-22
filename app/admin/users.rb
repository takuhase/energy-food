ActiveAdmin.register User do
  permit_params :email, :name, :password, :password_confirmation

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
