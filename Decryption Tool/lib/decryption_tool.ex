defmodule Decryption_Tool do

  # De main functie van het programma, vanuit hier wordt de logica van andere modules aangeroepen
  # Roep de functie aan in de console met: Decryption_Tool.decrypt_message("Jouw String")
  def decrypt_message(message) do
    IO.puts(
      "a1z26: " <> A1Z26.decrypt(message) <> "\n" <>
      "atbash: " <> Atbash.decrypt(message) <> "\n" <>
      "a1z26_atbash: " <> A1Z26_Atbash.decrypt(message) <> "\n" <>
      "caesar: " <> Caesar.decrypt(message) <> "\n" <>
      "rot47: " <> ROT47.decrypt(message)
    )
  end

end