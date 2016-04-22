defmodule ReadTest do
  use Database
  use Amnesia
  def read_message(user_id) do
    Amnesia.transaction do
      john = User.read(user_id)

      john |> User.messages |> Enum.each(&IO.puts(&1.content))

      # selection = Message.where user_id == 1 or user_id == 2,
      #   select: content
      # selection |> Amnesia.Selection.values |> Enum.each(&IO.puts(&1.content))
    end
  end
end
