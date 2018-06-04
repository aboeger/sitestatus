module CompaniesHelper

  def status_color(code)
    if code == "200"
      image_tag("green_dot.jpeg", size: "16")
    else
      image_tag("red_dot.jpeg", size: "16")
    end
  end

  def phone_number_format(phone)
    unless phone.blank?
      "(#{phone[0..2]}) #{phone[3..5]}-#{phone[5..-1]}"
    end
  end
end
