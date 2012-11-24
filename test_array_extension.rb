require "array_extension"
require "test/unit"
 
class TestArrayExtension < Test::Unit::TestCase
 
  def test_mean
    assert_equal([4,7,7,3,4].mean,  5)
    assert_equal([4,7,7,2,4].mean,  4.8)
  end

  def test_median
    assert_equal([8,3,7,4,11,2,9,4,10,11,4].median,  7)
    assert_equal([8,3,7,4,11,9,4,10,11,4].median, 7.5)
  end
  
  def test_mode
    assert_equal([2,2,4,1,9,6].mode, [2])
    assert_equal([4,2,4,2,9,6].mode, [2,4])
  end
end
