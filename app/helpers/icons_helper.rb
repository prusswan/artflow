module IconsHelper

  def icon_to(text, icon, destination)
    link_to(text, destination,
            class: "#{icon}-icon sprite-icon",
            title: text)
  end

end
