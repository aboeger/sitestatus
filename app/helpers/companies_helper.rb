module CompaniesHelper

  def status_color(code)
    if code == "200"
      image_tag("green_dot.jpeg", size: "16")
    else
      image_tag("red_dot.jpeg", size: "16")
    end
  end
end
