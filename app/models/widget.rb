# frozen_string_literal: true

# @widget
# @property id(required) [string] a unique identifier for the widget
# @property name(required) [string] the name of the widget
# @property icon(required) [string] an image URL
class Widget < PUNK::Model
  alias to_s name

  def validate
    validates_presence :name
    validates_url :icon, allow_blank: true
  end
end
