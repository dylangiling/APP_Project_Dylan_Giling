defmodule ROT47 do
  @moduledoc false

  # Basis ROT47 Decryptie
  def decrypt(message) do
    decrypt_rot47(message, "")
  end

  # Hier wordt de eerste waarde van de message gepakt en omgezet naar losse byte-waardes
  # De ::binary zorgt ervoor dat de rest bij elkaar blijft en niet wordt aangepast
  # Ook wordt er gekeken of de value van first binnen de printbare ascii waardes vallen
  defp decrypt_rot47(<<first, rest::binary>>, decryption) when first >= 33 and first <= 126 do

    # De functie wordt opnieuw opgeroepen met de restwaarde.
    # Ook wordt de huidige decryptie meegegeven met daarbij een nieuwe, verschoven waarde
    decrypt_rot47(rest, decryption <> <<33 + rem(first - 33 + 47, 94)>>)
  end

  # Wanneer het bericht leeg is betekent het dat de decryptie klaar is en kan deze worden teruggegeven.
  defp decrypt_rot47(<<>>, decryption) do
    decryption
  end

  # Wanneer een waarde niet binnen de tekens valt, zoals een spatie, wordt deze gewoon toegevoegd aan de decryption zonder verandering
  defp decrypt_rot47(<<first, rest::binary>>, decryption) do
    decrypt_rot47(rest, decryption <> <<first>>)
  end

end
