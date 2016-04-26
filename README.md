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

iex(4)> user01 = WriteTest.create_user("user01", "user01@example.com")
%Database.User{email: "user01@example.com", id: 1, name: "user01"}

iex(5)> WriteTest.add_message(user01, "this is message from user01")
%Database.Message{content: "this is message from user01", user_id: 1}

iex(6)> user02 = WriteTest.create_user("user02", "user02@example.com")
%Database.User{email: "user02@example.com", id: 2, name: "user02"}

iex(7)> WriteTest.add_message(user02, "this is message from user02")
%Database.Message{content: "this is message from user02", user_id: 2}

iex(20)> ReadTest.print_all(User)
{Database.User, 1, "user01", "user01@example.com"}
{Database.User, 2, "user02", "user02@example.com"}
:ok

iex(21)> ReadTest.print_all(Message)
{Database.Message, 2, "this is message from user02"}
{Database.Message, 1, "this is message from user01"}
:ok


iex(23)> WriteTest.add_message(user01, "this is the second  message from user01")
%Database.Message{content: "this is the second  message from user01", user_id: 1}


iex(60)> ReadTest.print_all(Message)
{Database.Message, 2, "this is message from user02"}
{Database.Message, 1, "this is message from user01"}
{Database.Message, 1, "this is the second  message from user01"}


iex(59)> ReadTest.find_user_by_email("user01@example.com")
user01
:ok
```
