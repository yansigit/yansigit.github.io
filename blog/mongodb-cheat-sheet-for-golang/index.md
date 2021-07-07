# Mongodb Cheat Sheet for Golang

## mgm init

```go
_ = mgm.SetDefaultConfig(nil, "Wiki_DB", options.Client().ApplyURI("mongodb://localhost:27017"))
```
<!--more-->
## creating a single index

```go
name, err := mgm.Coll(&Doc{}).Indexes().CreateOne(context.TODO(), mongo.IndexModel{
   Keys:    bson.M{"title": 1},
   Options: options.Index().SetUnique(true),
})
if err != nil {
   panic(err)
}
fmt.Println(name) // 성공 시 생성된 index name 반환
```


