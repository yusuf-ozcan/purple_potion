defmodule CurrencyConverter do
  @moduledoc """
  A simple module to convert currency based on fixed rates.
  Demonstrates Map usage and Pattern Matching.
  """

  # Fixed exchange rates (Base: USD)
  @exchange_rates %{
    "EUR" => 0.85,
    "TRY" => 43.05,
    "GBP" => 0.75,
    "JPY" => 156.50
  }

  @doc """
  Converts an amount from USD to the target currency.
  """
  def convert(amount, target_currency) do
    case Map.fetch(@exchange_rates, target_currency) do
      {:ok, rate} -> 
        result = amount * rate
        IO.puts("#{amount} USD is approximately #{Float.round(result, 2)} #{target_currency}")
        result

      :error -> 
        IO.puts("Currency #{target_currency} not found in our database.")
        {:error, :not_found}
    end
  end

  @doc """
  Lists all available currencies and their rates against USD.
  """
  def list_rates do
    IO.puts("\n--- Current Rates (1 USD) ---")
    Enum.each(@exchange_rates, fn {currency, rate} -> 
      IO.puts("#{currency}: #{rate}")
    end)
  end
end