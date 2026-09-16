defmodule Helper do

  # Een alphabet Enum die gebruikt kan worden om specifieke letters te vinden
  @alphabet ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

  # Wanneer een 0 omgezet moet worden naar een letter, wordt een spatie teruggegeven
  def number_to_letter(0) do
    " "
  end

  # Wanneer een getal hoger dan 26 omgezet moet worden naar een letter, wordt er een error teruggegeven
  def number_to_letter(number) when number > 26 do
    ArgumentError
  end

  # Een functie die een letter uit het alfabet teruggeeft, op de aangegeven positie
  def number_to_letter(number) do
    Enum.at(@alphabet, number - 1)
  end


  # Wanneer een letter uit het alfabet wordt meegegeven, wordt een gespiegeld getal teruggegeven bijvoorbeeld: a -> z, b -> y
  def find_atbash_value(letter) when letter in @alphabet do
    position = 25 - Enum.find_index(@alphabet, fn x -> x == letter end)
    Enum.at(@alphabet, position)
  end

  # Wanneer een spatie wordt meegegeven, wordt er ook een spatie teruggegeven
  def find_atbash_value(" ") do
    " "
  end

  # Wanneer een gegeven waarde niet in het alfabet zit, of een spatie is, wordt er een error gegeven
  def find_atbash_value(_letter) do
    ArgumentError
  end

  # Wanneer een letter uit het alfabet wordt meegegeven, wordt de waarde van 3 plekken terug teruggegeven
  def find_caesar_value(letter) when letter in @alphabet do
    # Bepaal de positie van de letter die je zoekt
    position = rem(26 + Enum.find_index(@alphabet, fn x -> x == letter end) - 3, 26)

    # Zoek de letter in het alfabet en geef deze terug
    Enum.at(@alphabet, position)
  end

  # Wanneer een spatie wordt meegegeven, wordt er ook een spatie teruggegeven
  def find_caesar_value(" ") do
    " "
  end

  # Wanneer een gegeven waarde niet in het alfabet zit, of een spatie is, wordt er een error gegeven
  def find_caesar_value(_letter) do
    ArgumentError
  end
end
