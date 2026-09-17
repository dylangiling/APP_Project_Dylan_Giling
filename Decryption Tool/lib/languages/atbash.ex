defmodule Atbash do
  @moduledoc false

  # Basis Atbash decryptie
  def decrypt(message) do
    try do
      decrypt_atbash(message, "")
    rescue
      # Wanneer er een character wordt meegegeven dat niet in het alfabet zit, wordt dit afgevangen
      ArgumentError -> "Not Atbash"
    end
  end

  # Wanneer de message leeg is betekent het dat de decryptie klaar is en wordt deze teruggegeven
  defp decrypt_atbash("", decryption) do
    decryption
  end

  defp decrypt_atbash(message, decryption) do
    # Pak de eerste value en bewaar de rest
    {value, rest} = String.next_grapheme(message)

    # Door middel van recursion wordt message steeds kleiner en de decryption steeds groter
    decrypt_atbash(rest, decryption <> Helper.find_atbash_value(value))
  end


end
