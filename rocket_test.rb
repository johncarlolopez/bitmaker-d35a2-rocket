require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test
  # Write your tests here!
  def setup
    @prefixes = ["aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces"]
    @suffixes = ["i", "ii", "iii", "iv", "v", "vi", "vii", "viii", "ix", "x"]
  end

  def random_colour
    ["red", "yellow", "blue", "green", "purple", "orange"]
  end

  def test_initialize_with_args
    @rocket = Rocket.new({name: 'test', colour: 'Prussian Blue', flying: true})
    assert_equal('test', @rocket.name)
    assert_equal('Prussian Blue', @rocket.colour)
    assert_equal(true, @rocket.flying?)
  end

  def test_initialize_without_args
    @rocket = Rocket.new
    assert_equal(true, @prefixes.include?(@rocket.name.split.first.downcase))
    assert_equal(true, @suffixes.include?(@rocket.name.split.last.downcase))
    assert_equal(true, random_colour.include?(@rocket.colour))
    assert_equal(false, @rocket.flying?)
  end

  def test_name_setter_and_getter
    @rocket = Rocket.new()
    @rocket.name = 'test'
    assert_equal('test', @rocket.name)
  end

  def test_colour_setter_and_getter
    @rocket = Rocket.new()
    @rocket.colour = 'Aquamarine'
    assert_equal('Aquamarine', @rocket.colour)
  end


  def test_lift_off_return_false
    @rocket = Rocket.new({flying: true})
    assert_equal(false, @rocket.lift_off)
  end

  def test_lift_off_return_true
    @rocket = Rocket.new
    assert_equal(true, @rocket.lift_off)
  end

  def test_status_flying
    @rocket = Rocket.new({flying: true})
    expected = "Rocket #{@rocket.name} is flying through the sky!"
    assert_equal(expected,@rocket.status)
  end

  def test_status_ready
    @rocket = Rocket.new
    expected = "Rocket #{@rocket.name} is ready for lift off!"
    assert_equal(expected,@rocket.status)
  end
end
