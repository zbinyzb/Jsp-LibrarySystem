<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人名片</title>
    <style>
        body{
            background-image: linear-gradient(to left,#e1dcfc, #1fb2bd);
            display: flex;
            justify-content: center;
        }
        .a{
            position: relative;
            width: 700px;
            height: 400px;
            border: #fff 10px solid;
            background-color: rgb(120, 140, 200);
            top: 120px;
            border-radius: 20px;
            overflow: hidden;
        }
        .b{
            position: absolute;
            width: 200px;
            height: 300px;
            left: 0;
            margin: 75px 50px;
            transition: 1s;
        }
        .b a{
            text-decoration: none;
            color: #fff;
            font: 900 28px '';
        }
        .b h2{
            /* 鼠标放开时的动画，第一个值是动画的过渡时间
            第二个值是延迟一秒后执行动画 */
            transition: .5s 1s;
            opacity: 0;
            color: rgb(30, 210, 200);
        }
        .b span{
            transition: .5s 1s;
            color: #fff;
            font: 500 18px '';
            position: absolute;
            top: 70px;
        }
        .c{
            position: absolute;
            top: -130px;
            right: -240px;
        }
        .d, .e{
            position: absolute;
            right: calc(var(--i)*100px);
            width: calc(var(--w)*40px);
            height: 500px;
            overflow: hidden;
            border-radius: 100px;
            transform: rotateZ(220deg) translate(0,0);
            background: rgb(240, 220, 150);
            transition: .5s .5s;
        }
        .d:nth-child(2){
            background:rgb(240, 190, 230);;
        }
        .e{
            left: -470px;
            top: -140px;
            width: 70px;
            background-color: rgb(90, 220, 150);;
        }
        .a:hover .c div{
            /* 设置延迟动画 */
            transition: .5s calc(var(--i)*.1s);
            /* 移动的轨迹 */
            transform: rotateZ(220deg) translate(-200px,400px);
        }
        .a:hover .b{
            transition: 1s .5s;
            left: 370px;
        }
        .a:hover .b span{
            transition: 1s .5s;
            top: 105px;
        }
        .a:hover .b h2{
            transition: 1s .5s;
            opacity: 1;
        }
        .f{
            width: 250px;
            height: 250px;
            position: absolute;
            /* 展示头像 */
            background-image: url("images/goat.jpg");
            background-size: cover;
            margin: 70px;
            opacity: 0;
            transition: .5s;
        }
        .a:hover .f{
            transition: 1s 1.3s;
            opacity: 1;
        }
    </style>
</head>
<body>
    <!-- 名片分三大块
    最外层的一块a
    文字一大块b
    平面圆柱一块c -->
    <div class="a">
        <div class="b">
            <a href="#">欢迎&nbsp<%=session.getAttribute("username") %></a>
            <h2>id:<%=session.getAttribute("bno") %></h2>
            <span>欢迎进入图书借阅系统</br>在此平台体验书籍+互联网的的服务</br>I hope in the days you WILL </br>Be Better!!</span>
        </div>
        <div class="c">
            <!--    --i是用来计算平面圆柱的动效延迟和距离的
                    --w则是用来计算平面圆柱的宽度  -->
            <div class="d" style="--i:1;--w:1.5"></div>
            <div class="d" style="--i:2;--w:1.6"></div>
            <div class="d" style="--i:3;--w:1.4"></div>
            <div class="d" style="--i:4;--w:1.7"></div>
            <div class="e" style="--i:1"></div>
        </div>
        <!-- 设置二维码 -->
        <div class="f"></div>
    </div>
</body>
</html>