# PHP学习

## 输出数据库数据
```
$result = $conn->query($sql);
 
if ($result->num_rows > 0) {
    // 输出数据
    while($row = $result->fetch_assoc()) {
        echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
    }
}
```

## PHP 处理JSON

[参考](http://www.ruanyifeng.com/blog/2011/01/json_in_php.html)

### json_encode()
```
$arr = array ('a'=>1,'b'=>2,'c'=>3,'d'=>4,'e'=>5);
echo json_encode($arr);
```

```
$obj->body           = 'another post';
$obj->id             = 21;
$obj->approved       = true;
$obj->favorite_count = 1;
$obj->status         = NULL;
echo json_encode($obj);
```
```
　　{
　　　　"body":"another post",
　　
　　　　"id":21,
　　
　　　　"approved":true,
　　
　　　　"favorite_count":1,
　　
　　　　"status":null
　　} 
```
### json_decode()
```
　　$json = '{"foo": 12345}';
 　　
　　$obj = json_decode($json);
　　
　　print $obj->{'foo'}; // 12345
```


## js get代码
```
axios.get('get.php')
    .then(function (response) {
        console.log('get from sever')
        console.log(response.data)
    })
    .catch(function (error) {
        console.log(error)
        console.log('error on js')
    })
```

## php 直接用文件用于js的get请求,不带后缀名都可以

```
{
    "name": "lin",
    "password": "123"
}
```

## js post代码
```
axios.post('post.php',{
    name: 'lin',
    password: '1234'
})
    .then(function (response) {
        console.log('POST success')
        console.log(response.data)
        console.log('ok on js')
    })
    .catch(function (error) {
        console.log(error)
        console.log('error on js')
    })
```

## PHP 处理post请求
```
<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        $res = file_get_contents("php://input"); //获取axios post json格式的数据
        echo 'PHP get the POST' . $res;
    }
    else{
        echo 'error';
    }
?>
```




