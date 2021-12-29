# frozen_string_literal: true

require "test_helper"
require "singleton"

class CrazytonTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Crazyton::VERSION
  end

  class DeathStar
    include Crazyton

    def fire
      {
        mode: :fired_cannon_randomly
      }
    end

    def fire_at(target)
      {
        mode: :fired_cannon_at_target,
        target: target
      }
    end

    def fire_with(color:, sound: "pew pew pew")
      {
        mode: :fired_cannon_with_color,
        color: color,
        sound: sound
      }
    end

    def fire_block(&_block)
      result = yield if block_given?

      {
        mode: :fired_cannon_with_block,
        result: result
      }
    end

    def fire_crazy_mode(target, color:, sound: "pew pew pew", &_block)
      block_result = yield if block_given?

      {
        mode: :fired_cannon_like_crazy,
        target: target,
        color: color,
        sound: sound,
        block_result: block_result
      }
    end
  end

  def test_death_star_responds_to_methods
    %w[fire fire_at fire_with fire_block fire_crazy_mode].each do |method|
      assert_respond_to DeathStar, method
    end
  end

  def test_without_arguments
    assert_equal({ mode: :fired_cannon_randomly }, DeathStar.fire)
  end

  def test_named_argument
    assert_equal({ mode: :fired_cannon_at_target, target: :the_blue_moon }, DeathStar.fire_at(:the_blue_moon))
  end

  def test_keyword_arguments
    assert_equal(
      {
        mode: :fired_cannon_with_color,
        color: "green",
        sound: "pew pew pew"
      },
      DeathStar.fire_with(color: "green")
    )
  end

  def test_passing_a_block
    assert_equal({ mode: :fired_cannon_with_block, result: :target_missed }, DeathStar.fire_block { :target_missed })
  end

  def test_using_all_arguments
    assert_equal(
      {
        mode: :fired_cannon_like_crazy,
        target: :red_moon,
        color: :red,
        sound: :blam,
        block_result: :target_destroyed
      },
      DeathStar.fire_crazy_mode(:red_moon, color: :red, sound: :blam) { :target_destroyed }
    )
  end
end
