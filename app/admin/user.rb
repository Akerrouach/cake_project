ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :email, :created_at, :updated_at, :first_name, :last_name, :address, :city, :description, :zip_code, :phone_number, :pastrycook_confirmed_at, :pastrycook, :provider, :uid, :name, :last_sign_in_ip, :current_sign_in_ip
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
