require 'test_helper'

class RcdktestTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Rcdk::VERSION
  end
end
