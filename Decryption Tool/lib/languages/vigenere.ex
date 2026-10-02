defmodule Vigenere do
  @moduledoc false

  def decrypt(message, key) do
    try do
      decrypt_vigenere(message, key, "")
    rescue
       ArgumentError -> "Not Vigenere"
    end
  end

  def decrypt_vigenere("", _key, decryption) do
    decryption
  end

  def decrypt_vigenere(" " <> message_rest, key, decryption) do
    decrypt_vigenere(message_rest, key, decryption <> " ")
  end

  def decrypt_vigenere(message, key, decryption) do
    {message_value, message_rest} = String.next_grapheme(message)
    {key_value, _key_rest} = String.next_grapheme(key)

    decrypt_vigenere(message_rest, Helper.shift_key(key), decryption <> Helper.find_vigenere_value(message_value, key_value))
  end

end