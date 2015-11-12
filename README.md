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
```
curl -X GET -d "advice_type=慢性病管理" http://localhost:3000/api/advices
```
```
url:    http://localhost:3000/api/advices
params: {advice_type: '慢性病管理'}            #["慢性病管理", "儿保", "妇保", "计划免疫"]
response:
        {
          "advices"=>
          [
            {
              "id"=>12, 
              "title"=>"MyString", 
              "img"=>
              {
                "img"=>
                {
                  "url"=>"/uploads/advice/img/12/rails.png", 
                  "thumb"=>
                  {
                    "url"=>"/uploads/advice/img/12/thumb_rails.png"
                  }
                }
              }, 
              "content"=>"MyText", 
              "video_url"=>"MyString", 
              "created_at"=>"2015-11-12T15:18:17.000+08:00", 
              "updated_at"=>"2015-11-12T15:18:17.000+08:00"
            },
            ...
          ]
        }
```
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
## 咨询记录列表
```
curl -X GET --header "Authorization: Token token=#{token}, cell=xxxxxxxxxxx" http://localhost:3000/api/consults
```
```
url:    http://localhost:3000/api/consults
params: no
response:
        {
          "women"=>                           #妇女保健
          [
            {
              "id"=>129, 
              "title"=>"MyString", 
              "user_id"=>204, 
              "department"=>"妇女保健", 
              "content"=>"MyText", 
              "submit_at"=>"2015-11-12T18:01:08.000+08:00"
            },
            ...
          ], 
          "children"=>                        #儿童保健
          [
            {
              "id"=>130, 
              "title"=>"MyString", 
              "user_id"=>205, 
              "department"=>"儿童保健", 
              "content"=>"MyText", 
              "submit_at"=>"2015-11-12T18:01:08.000+08:00"
            }
          ], 
          "immunes"=>                         #计划免疫
          [
            {
              "id"=>131, 
              "title"=>"MyString", 
              "user_id"=>206, 
              "department"=>"计划免疫", 
              "content"=>"MyText", 
              "submit_at"=>"2015-11-12T18:01:08.000+08:00"
            }
          ]
        }
```
##新建咨询记录 [我要提问]
```
curl -X POST --header "Authorization: Token token=#{token}, cell=xxxxxxxxxxx" -d "consult[department]=xxx..." http://localhost:3000/api/consults
```
```
url:    http://localhost:3000/api/consults
params: {
          "consult"=>
          {
            "department"=>"妇女保健",
            "title"=>"the question...."
          }
        }
response:
        {
          "consult"=>
          {
            "id"=>136, 
            "user_id"=>212, 
            "department"=>"妇女保健", 
            "title"=>"MyString", 
            "submit_at"=>"2015-11-12T18:10:36.565+08:00"
          }
        }
```
## 新建门诊预约
```
curl -X POST -d "appointment[doctor_id]=1&appointment[cell]=xx&booking_time=xxx" --header "Authorization: Token token=#{token}, cell=xxxxxxxxxxx" http://localhost:3000/api/appointments
```
```
url:    http://localhost:3000/api/appointments
params: {
          "appointment"=>
          {
            "doctor_id"=>1,
            "cell"=>"xxxxxx",
            "booking_time"=>"2015-11-12 18:45:56"
          }
        }
response:
        {
          "appointment"=>
          {
            "id"=>17, 
            "user_id"=>131, 
            "doctor_id"=>201, 
            "booking_time"=>"2015-11-12T18:45:56.000+08:00", 
            "cell"=>"MyString", 
            "state"=>nil
          }
        }
```