defmodule WriteTest do
  use Database
  use Amnesia
  # 例えばUser自体をクリアしたい時に`User.clear`はできる
  def clear(table_name) do
    Amnesia.Table.clear(table_name)
  end

  def create_user(name, email) do
    Amnesia.transaction do
      user = %User{name: name, email: email} |> User.write
      user
    end
  end

  def add_message(user, message) do
    Amnesia.transaction do
      user |> User.add_message(message)
    end
  end
end
