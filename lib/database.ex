use Amnesia
defdatabase Database do
  deftable User

  deftable Message, [:user_id, :content], type: :bag do
    # Messageに基づいて、このメッセージのユーザーを取得
    def user(self) do
      User.read(self.user_id)
    end

    def user!(self) do
      User.read!(self.user_id)
    end
  end

  deftable User, [{ :id, autoincrement }, :name, :email], type: :ordered_set, index: [:email] do
    def add_message(self, content) do
      %Message{user_id: self.id, content: content} |> Message.write
    end

    def add_message!(self, content) do
      %Message{user_id: self.id, content: content} |> Message.write!
    end

    def messages(self) do
      Message.read(self.id)
    end

    def messages!(self) do
      Message.read!(self.id)
    end
  end
end
