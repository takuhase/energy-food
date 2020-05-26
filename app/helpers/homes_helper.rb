module HomesHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new # rubocop:disable Rails/HelperInstanceVariable
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user] # rubocop:disable Rails/HelperInstanceVariable
  end
end
