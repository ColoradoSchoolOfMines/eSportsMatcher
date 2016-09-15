module SessionsHelper
  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any)
  def current_user
    # find_by will return nil when no record is found
    # so find_by is more appropriate than find in this case
    # as find will return an error when no record is found
    # also, this `||=` operator essentially enforces that
    # we don't do database lookups if the current_user is already
    # known by the session
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
end
