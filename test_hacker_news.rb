require "hacker_news" 
require "test/unit"
 
class TestHackerNews< Test::Unit::TestCase
  def test_sets_points
    hn = load_test_hn
    assert_equal hn.items.size, 30
    assert_equal hn.points.size, 30
    assert_equal hn.points[0..5], [34, 33, 43, 29, 42, 31]
  end
  
  def test_statistics
    hn = load_test_hn
    assert_equal hn.statistics.length, 87 # Only test not empty
  end

  protected
  def load_test_hn
    src_json = File.open('fixtures/hackernews.json') { |f| src = f.read }
    HackerNews.new(src_json)
  end
end