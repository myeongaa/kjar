class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  
  def add_role
    @user.delete_roles
    role = params[:user][:roles]
    @user.add_role Role.find(role).name if not role.blank?
    @user.role_id = Role.find(role).id if not role.blank?
  end
  
  
end
