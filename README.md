# Second-Market
基于python+Django+Mysql的校园二手交易市场

# 运行步骤

需要先安装Python的相关依赖：Pillow，Python-Mysql，Djago1.10

* 第一步：创建数据库，数据库名：cucmarket

* 第二步：执行SQL语句，打开cucmarket.sql文件，运行该文件中的SQL语句

* 第三步：源码文件为cucmarket.zip，修改源代码中的settings.py文件，改成自己的mysql数据库用户名和密码

* 第四步：运行命令：python manage.py runserver

* 第五步：打开浏览器查看

测试账户



* 普通会员账户：
  	学号：20171111111
  	密码：111111
* 管理员账户：
  	用户名：admin
  	密码：asdf1234
  进入管理员页面需在URL后面加上/admin，如http://localhost:8000/admin/

# 系统设计

## 功能设计

### 任务目标

建设一个校园二手用品交易，就是开发一个基于C2C模式的主要面向大学生的需求的二手用品交易平台，方便大学生足不出户就可以浏览想要的物品，方便大家信息交流，提高交易水平。为在校学生提供一个高效、便利、规的二手交易市场。同时对二手商品循环使用可以倡导资源的合理使用，构建和谐校园、节约型校园，减少浪费，给予货物“第二次生命”。 

### 用户特点

校园二手交易网上进行交易的大多都是本校的学生，系统的用户主要分为系统管理员、游客、买家、卖家等业务对象。  

系统的一般用户只需具有基础的在线浏览能力即可正常使用系统提供的各种服务。 

系统后台采用了可视化管理界面，因而要求维护人员只须具备基础的网站及数据库维护能力，能处理一些常见的操作错误。

1.系统管理员：管理商品、管理会员等 

2.会员：个人信息管理、会员登录、搜索二手商品、浏览二手商品、发布二手商品信息、二手商品信息管理 

3.游客：搜索二手商品、浏览二手商品、会员注册

### 参与者列表

1、学生：使用Web浏览器访问，发布二手商品信息以及购买二手商品的人 ·

2、管理员：管理商品，管理会员等

### 基本要求

（1）学生可以注册成为会员，通过登录系统，查看搜索二手商品信息等一系列操作。      

（2) 会员可以编辑自己的二手商品信息，包括上传相片及编辑文字信息。      

（3) 会员可以购买喜欢的二手商品并且进行评价。     

（4) 游客可以查看搜索二手商品或者注册成为会员，但是不能够购买二手商品。      

（5) 系统管理员可以管理会员的基本信息和二手商品的信息。

### 功能模块图

![funtionImg](https://edu-boker.oss-cn-beijing.aliyuncs.com/cucmarket/tempImg.png)

## 数据库设计

### 会员用户信息表（user_userinfo）

| 字段名   | 字段描述 | 约束                         |
| -------- | -------- | ---------------------------- |
| id       | 用户id   | int(11) NOT NULL PRIMARY KEY |
| username | 昵称     | varchar(20) NOT NUL          |
| number   | 学号     | varchar(30) NOT NULL         |
| password | 密码     | varchar(40) NOT NULL         |

### 商品信息表（goods_goodsinfo）

| 字段名      | 字段描述 | 约束                         |
| ----------- | -------- | ---------------------------- |
| id          | 商品id   | int(11) NOT NULL PRIMARY KEY |
| title       | 商品名称 | varchar(20) NOT NULL         |
| type        | 商品类型 | varchar(20) NOT NULL         |
| picture     | 商品图片 | varchar(100) NOT NULL        |
| price       | 商品价格 | decimal(10,2) NOT NULL       |
| adress      | 交易地点 | varchar(100) NOT NULL        |
| description | 商品描述 | varchar(300) NOT NULL        |
| isDelete    | 是否删除 | tinyint(1) NOT NULL          |
| user_id     | 商家ID   | int(11) NOT NULL FOREIGN KEY |

### 管理员用户信息表（auth_user）

| 字段名   | 字段描述 | 约束                         |
| -------- | -------- | ---------------------------- |
| id       | 用户id   | int(11) NOT NULL PRIMARY KEY |
| username | 昵称     | varchar(150) NOT NULL        |
| password | 密码     | varchar(128) NOT NULL        |

### 购物车信息表（cart_cartinfo）

| 字段名   | 字段描述 | 约束                         |
| -------- | -------- | ---------------------------- |
| id       | 购物车id | int(11) NOT NULL PRIMARY KEY |
| title    | 商品名称 | varchar(20) NOT NULL         |
| type     | 商品类型 | varchar(20) NOT NULL         |
| picture  | 商品图片 | varchar(100) NOT NULL        |
| price    | 商品价格 | decimal(10,2) NOT NULL       |
| number   | 商品数量 | varchar(20) NOT NULL         |
| good_id  | 商品ID   | int(11) NOT NULL FOREIGN KEY |
| buyer_id | 买家ID   | int(11) NOT NULL FOREIGN KEY |

# 效果演示

首页：

![index](https://edu-boker.oss-cn-beijing.aliyuncs.com/cucmarket/1.png)

商品详情页：

![detail](https://edu-boker.oss-cn-beijing.aliyuncs.com/cucmarket/2.png)

购物车页面：

![cart](https://edu-boker.oss-cn-beijing.aliyuncs.com/cucmarket/3.png)

管理员页面：

![admin](https://edu-boker.oss-cn-beijing.aliyuncs.com/cucmarket/4.png)