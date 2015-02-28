require "test_helper"

class ResourceTest < ActiveSupport::TestCase

  def resource
    @resource ||= create :resource
  end

  def test_valid
    assert resource.valid?
  end

end
