defmodule A1Z26_Atbash do
  @moduledoc false

  # Basis decryptie van A1Z26-Atbash
  def decrypt(message) do
    try do
      # Aangezien het een gecombineerd cipher is, kunnen we de eerder gemaakte algoritmes hergebruiken
      Atbash.decrypt(A1Z26.decrypt(message))
    rescue
      # Wanneer er een character wordt meegegeven dat niet een getal is, wordt dit afgevangen
      ArgumentError -> "Not A1Z26_Atbash"
    end
  end
end
