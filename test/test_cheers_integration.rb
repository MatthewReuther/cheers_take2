require 'minitest/autorun'

class TestCheersIntegration < Minitest::Test

# 0 args -> help message
  def test_help_message
    output = `./cheers`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

# two valid arguments
  def test_1a_valid_arguments_name_mm_dd
    output = `./cheers Abby 08/25`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

Awesome! Your birthday is in 127 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end

  def test_1b_one_valid_and_one_invalid_arguments
    output = `./cheers Abby 328/25`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!
EOS
  assert_equal expected, output
  end

  def test_1c_one_invalid_and_one_valid_arguments
    output = `./cheers Abb123y 08/25`
    expected = <<EOS
Awesome! Your birthday is in 127 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end

  def test_1d_two_invalid_arguments
    output = `./cheers Abb123y 01238/25`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
  assert_equal expected, output
  end

# Name 1 Valid Argument
  def test_2a_one_valid_argument_name
    output = `./cheers Abby`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y

Abby’s just GRAND!
EOS

  assert_equal expected, output
  end

  def test_2b_one_valid_argument_name_hyphen
    output = `./cheers Abby-Gale`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Give me a... G
Give me an... A
Give me a... L
Give me an... E

Abby-Gale’s just GRAND!
EOS
  end

# Invalid Names
def test_3a_invalid_argument_date_for_name
    output = `./cheers 08/25`
    expected = <<EOS
<<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name]
EOS
  assert_equal expected, output
  end

def test_3b_invalid_argument_symbols_for_name
    output = `./cheers ~1234567890_+=!@#{}$%*():><`
    expected = <<EOS
<<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name]
EOS
  assert_equal expected, output
  end

def test_3c_invalid_argument_string_for_name
    output = `./cheers ""`
    expected = <<EOS
<<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name]
EOS
  assert_equal expected, output
  end

def test_3d_invalid_argument_whitespace_for_name
    output = `./cheers "  "`
    expected = <<EOS
<<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name]
EOS
  assert_equal expected, output
  end

#valid months
  def test_4a_valid_argument_month_m_dd
    output = `./cheers 8/25`
    expected = <<EOS
<<EOS
Awesome! Your birthday is in 127 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end

  def test_4b_valid_argument_month_mm_dd
    output = `./cheers 08/25`
    expected = <<EOS
<<EOS
Awesome! Your birthday is in 127 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end

#birthdays that have already happened
def test_5a_two_valid_args_projected_birthday
    output = `./cheers Abby 08/25`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby's just GRAND!

Awesome! Your birthday is in 127 days! Happy Birthday in advance!
EOS
    assert_equal expected, output
  end

  def test_5b_two_valid_args_birthday_has_not_occured_this_year
    output = `./cheers Abby 04/21`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby's just GRAND!
Awesome! Your birthday is in 365 days! Happy Birthday in advance!
EOS
    assert_equal expected, output
  end

#invalid months
  def test_6a_invalid_argument_month_mm_dd
    output = `./cheers 25/08`
    expected = <<EOS
<<EOS
Awesome! Your birthday is in 127 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end

  def test_6b_valid_argument_month_mm_dd_yyyy
    output = `./cheers 08/25/2015`
    expected = <<EOS
<<EOS
Awesome! Your birthday is in 127 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end
end
