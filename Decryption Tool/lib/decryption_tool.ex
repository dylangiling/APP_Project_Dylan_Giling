defmodule Decryption_Tool do

  # De main functie van het programma, vanuit hier wordt de logica van andere modules aangeroepen
  # Roep de functie aan in de console met: Decryption_Tool.decrypt_message("Jouw String")
  def decrypt_message(message) do
    IO.puts(
      "a1z26: " <> A1Z26.decrypt(message) <> "\n" <>
      "atbash: " <> Atbash.decrypt(message) <> "\n" <>
      "a1z26_atbash: " <> A1Z26_Atbash.decrypt(message) <> "\n" <>
      "rot47: " <> ROT47.decrypt(message)
    )
  end

  # Een variatie van de eerste functie, deze wordt aangeroepen als er een bepaalde sleutel wordt meegegeven
  # De sleutel kan het aantal rotaties in caesar zijn, maar eventueel ook een daadwerkelijk wachtwoord voor vigenere.
  # Roep de functie aan in de console met: Decryption_Tool.decrypt_message("Jouw String", 3) of Decryption_Tool.decrypt_message("Jouw String", "sleutel")
  def decrypt_message(message, key) do
    message = String.downcase(message)
    IO.puts(
      "caesar: " <> Caesar.decrypt(message, key) <> "\n" <>
      "vigenere: " <> Vigenere.decrypt(message, key)
    )
  end

end