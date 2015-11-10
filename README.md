##获取签约医生（用于注册）
```
curl -X GET http://localhost:3000/api/users/doctors
```
```
url:    http://localhost:3000/api/users/doctors
params: no
response:
        {
          "doctors"=>
          [
            [doctor_id, doctor_name],
            [1,"name"],
            ...
          ]
        }
```
##注册
```
curl -X POST -d "user[cell]xxxxxx" http://localhost:3000/api/users
```
```
url:    http://localhost:3000/api/users
params:
        {
          user:
          {
            cell: "11111111111",
            name: "name",
            address: "address",
            gender: "男",          #only [男] or [女]
            id_no: "xxxxxxxxx",
            card_no: "xxxxxxxx",
            doctor_id: 1,
            password: "11111111",
            password_confirmation: "11111111",
          }
        }
response:
        {
          "user"=>
          {
            "id"=>39, 
            "cell"=>"MyString", 
            "name"=>"MyString", 
            "address"=>"MyText", 
            "gender"=>"男", 
            "id_no"=>"MyString", 
            "card_no"=>"MyString", 
            "doctor_id"=>1, 
            "token"=>"K731UQRa7bSAUltumrQ96HnlH1JOrDl59UmDqs24h4NpeLAcvhpdfR1PqFXntRPR+gF7TYU5RGHxrZesz5qXA=="
          }
        }
```
