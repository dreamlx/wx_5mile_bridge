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
curl -X POST -d "user[cell]=xxxxxx" http://localhost:3000/api/users
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
## 登录
```
curl -X POST -d "user[cell]=xxxxxxxxxxx&user[password]=xxxxxxxx" http://localhost:3000/api/sessions
```
```
url:    http://localhost:3000/api/sessions
params: {
          "user"=>
          {
            "cell"=> "xxxxxxxxxxx",
            "password"=>"xxxxxxxx"
          }
        }
response: same as above
```
##获取医院信息
```
curl -X GET http://localhost:3000/api/hospitals/current
```
```
url:    http://localhost:3000/api/hospitals/current
params: no
response:
        { 
          "hospital"=>
          {
            "id"=>23, 
            "title"=>"MyString", 
            "img"=>
            {
              "img"=>
              {
                "url"=>"/uploads/hospital/img/27/rails.png", 
                "thumb"=>
                {
                  "url"=>"/uploads/hospital/img/27/thumb_rails.png"
                }
              }
            }, 
            "content"=>"MyText", 
            "video_url"=>"MyString"
          }
        }
```
## 获取医院快讯列表
```
curl -X GET http://localhost:3000/api/news
```
```
url:    http://localhost:3000/api/news
params: no
response:
        {
          "news"=>
          [
            {
              "id"=>23, 
              "title"=>"MyString", 
              "img"=>
              {
                "img"=>
                {
                  "url"=>"/uploads/news/img/23/rails.png", 
                  "thumb"=>
                  {
                    "url"=>"/uploads/news/img/23/thumb_rails.png"
                  }
                }
              }, 
              "content"=>"MyText", 
              "video_url"=>"MyString", 
              "created_at"=>"2015-11-10T18:18:48.000+08:00", 
              "updated_at"=>"2015-11-10T18:18:48.000+08:00"
            }
          ]
        }
```
## 获取某个医院快讯
```
curl -X GET http://localhost:3000/api/news/{news.id}
```
```
url:    http://localhost:3000/api/news/{news.id}
params: no
response:
        {
          "news"=>
          {
            "id"=>23, 
            "title"=>"MyString", 
            "img"=>
            {
              "img"=>
              {
                "url"=>"/uploads/news/img/23/rails.png", 
                "thumb"=>
                {
                  "url"=>"/uploads/news/img/23/thumb_rails.png"
                }
              }
            }, 
            "content"=>"MyText", 
            "video_url"=>"MyString", 
            "created_at"=>"2015-11-10T18:18:48.000+08:00", 
            "updated_at"=>"2015-11-10T18:18:48.000+08:00"
          }
        }
```
## 获取健康教育列表 
## 获取健康教育详情 
请参考【医院快讯】，模型从news更改成advice
## 签约医生列表
```
curl -X GET http://localhost:3000/api/doctors
```
```
url:    http://localhost:3000/api/doctors
params: no
response:
        {
          "doctors"=>
          [
            {
              "id"=>233, 
              "name"=>"MyString", 
              "grade"=>"MyString", 
              "avatar"=>
              {
                "avatar"=>
                {
                  "url"=>"/uploads/doctor/avatar/233/rails.png", 
                  "thumb"=>
                  {
                    "url"=>"/uploads/doctor/avatar/233/thumb_rails.png"
                  }
                }
              }, 
              "desc"=>"MyText", 
              "hospital"=>"MyString", 
              "department"=>"MyString", 
              "state"=>"正常"
            }
          ]
        }
```
## 签约医生详情
上面数组中的一个元素
