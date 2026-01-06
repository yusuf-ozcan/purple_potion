defmodule TaskManager do
  @moduledoc """
  A simple task manager to practice Elixir basics.
  """

  def start, do: []

  def add(tasks, task_name), do: [task_name | tasks]

  def show(tasks) do
    IO.puts("\n--- YOUR TASKS ---")
    tasks 
    |> Enum.reverse() 
    |> Enum.with_index(1) 
    |> Enum.each(fn {name, i} -> IO.puts("#{i}. #{name}") end)
  end
end