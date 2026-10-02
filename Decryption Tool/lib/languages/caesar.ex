defmodule Caesar do
  @moduledoc false

  # Basis caesar decryption
  def decrypt(message, key) do
    try do
      decrypt_caesar(message, key, "")
    rescue
      # Wanneer er een character wordt meegegeven dat niet in het alfabet zit, wordt dit afgevangen
      ArgumentError -> "Not Caesar"
      ArithmeticError -> "Not Caesar"
    end
  end

  # Wanneer de message leeg is betekent het dat de decryptie klaar is en wordt deze teruggegeven
  defp decrypt_caesar("", _key, decryption) do
    decryption
  end

  defp decrypt_caesar(message, key, decryption) do
    # Eerst value gepakt, rest wordt bewaard en meegegeven aan de volgende recursie
    {value, rest} = String.next_grapheme(message)

    # Door middel van recursion wordt message steeds kleiner en de decryption steeds groter
    decrypt_caesar(rest, key, decryption <> Helper.find_caesar_value(value, key))
  end
end
