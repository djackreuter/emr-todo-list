module UsersHelper
  def form1_empty?(user)
    user.name.blank? && user.email.blank? && user.bio.blank?
  end

  def form2_empty?(user)
    user.city.blank? && user.state.blank? && user.zip.blank?
  end

  def form3_empty?(user)
    user.university.blank? && user.degree.blank? && user.grad_year.blank?
  end
end
