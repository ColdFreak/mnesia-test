defmodule ReadTest do
  use Database
  use Amnesia
  def message_list(table_name) do
    Amnesia.transaction do
      iterator = fn(rec, acc) ->
        [rec | acc]
      end
      Amnesia.Table.foldl(table_name, [], iterator)
    end
  end
  def print_all(table_name) do
    Amnesia.transaction do
      iterator = fn(rec, _acc) ->
        IO.puts "#{inspect rec}"
      end
      Amnesia.Table.foldl(table_name, [], iterator)
      # :ets.tab2list(User)
    end
  end

  # `User`テーブルのなかの`name`を出力
  def find_user_by_email(user_email) do
    Amnesia.transaction do
      selection = User.where email == user_email,
        select: {name, email}
      selection |> Amnesia.Selection.values
      # selection |> Amnesia.Selection.values |> Enum.each(&IO.puts(&1))
    end
  end

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
