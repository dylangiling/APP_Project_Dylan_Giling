defmodule Helper do

  @alphabet ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

  def number_to_letter(0) do
    " "
  end

  def number_to_letter(number) when number > 26 do
    raise("Invalid Number")
  end

  def number_to_letter(number) do
    Enum.at(@alphabet, number - 1)
  end

  def find_atbash_value(" ") do
    " "
  end

  def find_atbash_value(letter) when letter in @alphabet do
    position = 25 - Enum.find_index(@alphabet, fn x -> x == letter end)
    Enum.at(@alphabet, position)
  end

  def find_atbash_value(_letter) do
    raise("Invalid Character")
  end
end
