# frozen_string_literal: true

class Status < PUNK::View
  args :message

  def validate
    validates_not_null :message
    validates_not_empty :message
    validates_type String, :message
  end

  def process
    'status'
  end
end
