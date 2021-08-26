# README

一、说明：
1. 写的比较简单，接口也比较简单，没有用grape,或者jbuilder相关gem, 是一个纯简单的接口项目，不包含测试，不包含分页。主要是实现用户关注，用户发布信息，用户查询所关注的用户发布的信息这三个需求逻辑，简单的写了下框架和接口，代码的组织包括接口请求和返回等都有待于优化。
2. ruby版本：2.6.5， rails版本6.1.4.1
3. 数据库： mysql 
4. 总共三张表：users表， articles表， relationships表
5. bundle,rails db:create, rails db:migrate后，可以运行 rails db:seeds创建测试数据

二、具体实现的逻辑；
1. 用户注册。
2. 用户的登录，用户登录后会产生一个login_token，这个login_token会保存在users表中的对应字段 ，每次登录这个值都是不一样的，用的是 bcrypt的 SecureRandom.urlsafe_base64，具体想法是想设个有效期，可以结合redis实现有效期。在调用某些接口的时候必须先登录也就是headers里要有这个值。还有一点就是bcrypt的 SecureRandom.urlsafe_base64生成随机的字符串，有点慢，所以可以换其他的产生token的方法。
3. 这三个需求中主要的难点是实现关注。我的做法是创建一张关系表 relationships, 比如说user1关注 user2，相当user1是主动建立一个关系，这张relationships表里存的主要字段有两个,follower_id相当于user1的id, followed_id相当于user2的id, 关注的过程就是create一个relationship的过程，具体可以看相关的model。
4. 建立了关系和逻辑后， 查找就很方便了，通过relationships的followed_id找到关注的users,然后再找出对应的每一个user下面的articles.

三、具体接口：
1. 注册：
   post http://xxx/apis/v1/signup
   传参: name, email, password,  password_confirmation     字符串
   例子：http://xxx/apis/v1/signup?name=Jerry&email=jerry@lovelyrat.com&password=111113&password_confirmation=111111

2. 登录
   post http://xxx/apis/v1/sign_in
   传参： email, password   字符串
   例子：http://xxx/apis/v1/sign_in?email=jerry@lovelyrat.com&password=111111


3. 发布信息接口 
   post http://xxx/apis/v1/users/article_publishing
   传参： title，content   字符串  必须先登录
   例子：http://xxx/apis/v1/users/article_publishing?title=soccer_news&content=the world cup will be on soon
  
4. 查找关注的人发布的信息：
   get http://xxx/apis/v1/users/followed_articles
   传参： 无    必须先登录
   例子：http://xxx/apis/v1/users/followed_articles



