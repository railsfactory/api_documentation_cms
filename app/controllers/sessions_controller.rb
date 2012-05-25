class SessionsController < Devise::SessionsController
  def new
    clean_up_passwords(build_resource)
    render_with_scope :new
  end

  def create
  end

end
