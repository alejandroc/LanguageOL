module EmailValidator
  def email_pattern
    /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  end
end
