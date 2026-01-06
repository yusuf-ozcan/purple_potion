defmodule Calculator do
  @moduledoc """
  A simple calculator module that demonstrates Elixir's pattern matching
  and functional approach to arithmetic operations.
  """

  @doc """
  Performs calculations based on the given operation tuple.
  Example: {:add, 10, 5}
  """
  def calculate({:add, x, y}), do: x + y
  def calculate({:subtract, x, y}), do: x - y
  def calculate({:multiply, x, y}), do: x * y
  
  # Handling division by zero safely
  def calculate({:divide, _x, 0}), do: {:error, "Cannot divide by zero!"}
  def calculate({:divide, x, y}), do: x / y

  # Catch-all for invalid operations
  def calculate(_unknown_operation) do
    {:error, "Invalid operation format. Please use {:op, num1, num2}"}
  end
end