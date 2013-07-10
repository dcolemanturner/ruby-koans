require File.expand_path(File.dirname(__FILE__) + '/neo')

# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used to calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.

def score(dice)

  numbers = [0, 0, 0, 0, 0, 0]

  if dice.count == 0
    return 0
  end

  dice.each do |die|
    begin
      puts "die: " << die.to_s
      #-1 accounts for array starting at 0
      numbers[die-1] += 1
    end
  end

  #view numbers in collection
  puts "One: " << numbers[0].to_s
  puts "Two: " << numbers[1].to_s
  puts "Three: " << numbers[2].to_s
  puts "Four: " << numbers[3].to_s
  puts "Five: " << numbers[4].to_s
  puts "Six: " << numbers[5].to_s

    #Scoring
  # * A set of three ones is 1000 points
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
# * A one (that is not part of a set of three) is worth 100 points.
# * A five (that is not part of a set of three) is worth 50 points.
# * Everything else is worth 0 points.

score = 0
die_num = 1

  numbers.each do |number|
    begin
      if(die_num == 1)
        case number
        when 0
          score += 0
        when 1
          score += 100
        when 2
          score += 200
        when 3 
          score += 1000
        when 4
          score += 1100
        when 5
          score += 1200
        end
      elsif die_num == 5
        case number
        when 0
          score += 0
        when 1
          score += 50
        when 2
          score += 100
        when 3 
          score += 500
        when 4
          score += 550
        when 5
          score += 600
        end
      else
        case number
        when 0
          score += 0
        when 1
          score += 0
        when 2
          score += 0
        when 3 
          score += (100 * die_num)
        when 4
          score += (100 * die_num)
        when 5
          score += (100 * die_num)
        end

      
    end

      puts "die_num: " << die_num.to_s
      puts "number of time rolled: " << number.to_s
      puts "Current score: " << score.to_s

      die_num += 1
  end
end

puts "Final Score: " + score.to_s

score

end


class AboutScoringProject < Neo::Koan  #DONE

  def test_score_of_an_empty_list_is_zero
    assert_equal 0, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50  #DONE
    assert_equal 50, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100  #DONE
    assert_equal 100, score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores   #DONE
    assert_equal 300, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero   #DONE
    assert_equal 0, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000  #DONE
    assert_equal 1000, score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, score([2,2,2])
    assert_equal 300, score([3,3,3])
    assert_equal 400, score([4,4,4])
    assert_equal 500, score([5,5,5])
    assert_equal 600, score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, score([2,5,2,2,3])
    assert_equal 550, score([5,5,5,5])
  end

end
