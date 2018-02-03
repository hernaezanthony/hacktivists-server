ActiveAdmin.register Petition do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :subject, :level, :location, :enrolled_students, :description, :is_posted, :has_tutor, :tutor_fullname,:freelancer_id,:maximum_price, :minimum_price
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
