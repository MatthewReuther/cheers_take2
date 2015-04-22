require_relative 'helper'

class TestCheersIntegration < Minitest::Test

# 0 args -> help message
  def test_no_arguments_help_message
    output = `./cheers`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

# Test all letters that need an before them
  def test_1a_all_an_letters
    output = `./cheers AEFHILMNORSX`
    expected = <<EOS
Give me an... A
Give me an... E
Give me an... F
Give me an... H
Give me an... I
Give me an... L
Give me an... M
Give me an... N
Give me an... O
Give me an... R
Give me an... S
Give me an... X
AEFHILMNORSX’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end

# One valid argument given Name

  def test_1b_one_valid_argument_given_name
    output = `./cheers Abby`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
  assert_equal expected, output
  end

  def test_1c_one_valid_argument_given_hyphenated_name
    output = `./cheers Abby-Gale`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Give me a... G
Give me an... A
Give me an... L
Give me an... E
Abby-Gale’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS

  assert_equal expected, output
  end

  def test_1d_one_valid_argument_with_spaces_between_name
    output = `./cheers "Mary Clare"`
    expected = <<EOS
Give me an... M
Give me an... A
Give me an... R
Give me a... Y
Give me a... C
Give me an... L
Give me an... A
Give me an... R
Give me an... E
Mary Clare’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS

  assert_equal expected, output
  end


# One Valid Argument Given only Date

  def test_2a_one_valid_argument_given_month_mdd_instead_of_name
    output = `./cheers 8/25`
    expected = <<EOS

Awesome! Your birthday is in 126 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end

  def test_2b_one_valid_argument_given_month_mmdd_instead_of_name
    skip
    output = `./cheers 08/25`
    expected = <<EOS

Awesome! Your birthday is in 126 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end

  def test_5b_one_valid_argument_given_birthday_that_has_occured_this_year
    skip
    output = `./cheers 04/21`
    expected = <<EOS

Awesome! Your birthday is in 365 days! Happy Birthday in advance!
EOS
    assert_equal expected, output
  end



# One Invalid Argument Given Incorrect Name

def test_3a_one_invalid_argument_gave_date_for_name
    output = `./cheers 8/25`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
  assert_equal expected, output
  end

def test_3b_one_invalid_argument_non_word_characters_in_name
    output = `./cheers ~!`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
  assert_equal expected, output
  end

def test_3c_one_invalid_argument_string_for_name
    output = `./cheers ""`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
  assert_equal expected, output
  end

def test_3d_one_invalid_argument_whitespace_for_name
    output = `./cheers "  "`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
  assert_equal expected, output
  end




# One Invalid Argument Given Incorrect Month

  def test_4a_one_invalid_argument_non_number_characters_for_date
    skip
    output = `./cheers @x/!x`
    expected = <<EOS
I couldn't understand that. Could you give that to me in mm/dd format next time?
EOS
  assert_equal expected, output
  end

  def test_4b_one_invalid_argument_month_mm_dd
    skip
    output = `./cheers 25/08`
    expected = <<EOS
I couldn't understand that. Could you give that to me in mm/dd format next time?
EOS
  assert_equal expected, output
  end

  def test_4c_one_invalid_argument_month_mm_dd_yyyy
    skip
    output = `./cheers 08/25/2015`
    expected = <<EOS
I couldn't understand that. Could you give that to me in mm/dd format next time?
EOS
  assert_equal expected, output
  end


# Test that Tests Two Valid Arguments

  def test_5a_two_valid_arguments_name_mm_dd
    skip
    output = `./cheers Abby 08/25`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

Awesome! Your birthday is in 126 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end


# Test that Tests One Valid and Invalid Argument

  def test_6a_one_valid_and_one_invalid_argument
    skip
    output = `./cheers Abby xA/25`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!


I couldn't understand that. Could you give that to me in mm/dd format?
EOS
  assert_equal expected, output
  end

# Test that Tests One Invalid and Valid Argument

  def test_7a_one_invalid_and_one_valid_argument
    skip
    output = `./cheers ~?!@#{}$% 08/25`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
  assert_equal expected, output
  end

# Test that Tests Two Arguments

  def test_1d_two_invalid_arguments
    skip
    output = `./cheers ~?!@#{}$% 01238/25`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
  assert_equal expected, output
  end
end
