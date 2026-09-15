defmodule Decryption_Tool do

  def decrypt_message(language, message) do
    "Message: " <> find_language(language, message)
  end

  defp find_language("a1z26", message) do
    decrypt_a1z26(String.split(message, "-"), "")
  end

  defp find_language("atbash", message) do
    decrypt_atbash(message, "")
  end

  defp find_language("a1z26_atbash", message) do
    message = decrypt_a1z26(String.split(message, "-"), "")
    decrypt_atbash(message, "")
  end

  defp find_language(_, _) do
    "language not recognized"
  end

  def decrypt_a1z26([], decryption) do
    decryption
  end

  def decrypt_a1z26(message, decryption) do
    number = String.to_integer(List.first(message))
    decrypt_a1z26(List.delete_at(message, 0), decryption <> Helper.number_to_letter(number))
  end

  def decrypt_atbash("", decryption) do
    decryption
  end

  def decrypt_atbash(message, decryption) do
    value = String.first(message)
    decrypt_atbash(String.replace_leading(message, value, ""), decryption <> Helper.find_atbash_value(value))
  end

end