# Mtest

```
$ mix amnesia.create -db Database --disk # 一回だけDBを作成
$ mix amnesia.drop -db Database # DBのデータをすべて削除
$ iex -S mix
```

```
iex(1)> use Amnesia
nil
iex(2)> use Database
[nil, nil, nil, nil, nil, nil, nil, nil]
iex(3)> Amnesia.start
:ok
iex(4)> WriteTest.add_message
%Database.Message{content: "john's first message\n", user_id: 1}


iex(5)> ReadTest.read_message(2)   <------- user_idを指定
john's first message

:ok

iex(5)> Amnesia.transaction do
...(5)>   Message.user(%Database.Message{content: "john's first message\n", user_id: 1})
...(5)> end
%Database.User{email: "john@example.com", id: 1, name: "John"}

iex(6)> Amnesia.transaction do
...(6)>   Message.user(%Database.Message{user_id: 1})
...(6)> end
%Database.User{email: "john@example.com", id: 1, name: "John"}

iex(9)> Amnesia.transaction do
...(9)>   Message.user(%Database.Message{ user_id: 1})    <----------- あるメッセージに基づいて、ユーザー情報を取り出す
...(9)> end
%Database.User{email: "john@example.com", id: 1, name: "John"}
```


