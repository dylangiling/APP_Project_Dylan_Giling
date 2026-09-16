defmodule Caesar do
  @moduledoc false

  # Basis caesar decryption
  def decrypt(message) do
    try do
      decrypt_caesar(message, "")
    rescue
      # Wanneer er een character wordt meegegeven dat niet in het alfabet zit, wordt dit afgevangen
      ArgumentError -> "Not Caesar"
    end
  end

  # Wanneer de message leeg is betekent het dat de decryptie klaar is en wordt deze teruggegeven
  defp decrypt_caesar("", decryption) do
    decryption
  end

  defp decrypt_caesar(message, decryption) do
    # Variabele toegevoegd voor leesbaarheid. Hier wordt de eerste value van de huidige message gepakt
    value = String.first(message)

    # Door middel van recursion wordt message steeds kleiner en de decryption steeds groter
    decrypt_caesar(String.replace_leading(message, value, ""), decryption <> Helper.find_caesar_value(value))
  end
end
