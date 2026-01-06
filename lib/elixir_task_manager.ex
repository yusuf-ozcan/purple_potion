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
    |> Enum.each(fn {name, i} ->
      IO.puts("#{i}. #{name}")
    end)
  end

  @doc """
  Removes a task by its name using pattern matching.
  """
  def remove(tasks, task_name) do
    List.delete(tasks, task_name)
  end

  @doc """
  Returns the total count of tasks.
  """
  def count(tasks) do
    Enum.count(tasks)
  end

  @doc """
  Saves the task list to a file.
  'erlang.term_to_binary' converts Elixir data into a format that can be stored.
  """
  def save(tasks, filename) do
    binary = :erlang.term_to_binary(tasks)
    File.write(filename, binary)
  end

  @doc """
  Loads the task list from a file.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} ->
        :erlang.binary_to_term(binary)

      {:error, _reason} ->
        IO.puts("File not found! Starting with an empty list.")
        []
    end
  end
end
