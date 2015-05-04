ActiveAdmin.register Pastry do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, :price_per_unit, :state, :shop_id, :unit_volume, :created_at, :updated_at, :pastry_address, :pastry_city, :pastry_zip_code
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
