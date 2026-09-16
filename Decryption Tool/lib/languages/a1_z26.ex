defmodule A1Z26 do
  @moduledoc false

  # Basis decryptie van A1Z26
  def decrypt(message) do
    try do
      decrypt_a1z26(message)
    rescue
      # Wanneer er een character wordt meegegeven dat niet een getal onder 26 is, wordt dit afgevangen
      ArgumentError -> "Not A1Z26"
    end
  end

  # Verwachte input van een a1z26 wordt gezien als: "8-1-12-12-15", dit wordt omgezet in een List van waardes
  defp decrypt_a1z26(message) do
    decrypt_a1z26(String.split(message, "-"), "")
  end

  # Wanneer message een lege array bevat is het decrypten klaar en wordt deze teruggegeven
  defp decrypt_a1z26([], decryption) do
    decryption
  end

  defp decrypt_a1z26(message, decryption) do
    # Variabele toegevoegd voor leesbaarheid. Hier wordt het eerste element in de List omgezet naar integer
    number = String.to_integer(List.first(message))

    # Door middel van recursion wordt message steeds kleiner en de decryption steeds groter
    decrypt_a1z26(List.delete_at(message, 0), decryption <> Helper.number_to_letter(number))
  end

end
