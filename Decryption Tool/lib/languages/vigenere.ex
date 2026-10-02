defmodule Vigenere do
  @moduledoc false

  # Basis vigenere decryption
  def decrypt(message, key) do
    try do
      decrypt_vigenere(message, key, "")
    rescue
      # Wanneer er een character wordt meegegeven die niet in het alfabet zit kan het geen vigenere zijn
      ArgumentError -> "Not Vigenere"
    end
  end

  # Wanneer de recursion klaar is wordt de loop gestopt en de decryptie teruggegeven
  def decrypt_vigenere("", _key, decryption) do
    decryption
  end

  # Bij een spatie wordt de key shift overgeslagen en een spatie teruggegeven
  def decrypt_vigenere(" " <> message_rest, key, decryption) do
    decrypt_vigenere(message_rest, key, decryption <> " ")
  end

  # De main loop van de vigenere decryption
  def decrypt_vigenere(message, key, decryption) do
    # Van zowel de key als de message wordt de eerste value gepakt
    {message_value, message_rest} = String.next_grapheme(message)
    {key_value, _key_rest} = String.next_grapheme(key)

    # Dezelfde functie wordt door recursie aangeroepen. Hierbij
    decrypt_vigenere(message_rest, Helper.shift_key(key), decryption <> Helper.find_vigenere_value(message_value, key_value))
  end

end