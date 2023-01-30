# # Bookmycampsite專案開發 Read Me
* 此專案使用Java SpringBoot、SQL server資料庫。

* 主要功能為「露營地訂位」、「露營地CRUD」

* 此專案原為「資展國際Java跨域工程師培訓」之期末小組專題，此版本只截取本人撰寫之部分。 *例外：「會員登入」和「Paypal付款」參考了技術長和GITHUB上Paypal相關專案。

* Using Java SpringBoot and SQL server

* Main function :“Booking Campsite” and “Campsite CRUD”

* Originally, the project was made by a team of 6 members. I retained the part that I completed. However, “Login” is credited to one of my members and “PayPal” related Class is credited to other engineers on GITHUB

**專案資料夾 Packages**
* camp.controller
* camp.model
* camp.service
* paypal.config
* paypal.controller
* paypal.service
* paypal.util
* users.controller
* users.model
* users.service
**系統環境 Environment**
* 資料庫環境: SQL Server 2019
* Java Version: 11
* SpringBoot Version:2.7.6 / 2.7.8
**開發環境 Environment**
* 開發環境Eclipse Version: 2022-06 (4.24.0)
**建置作業**
1. 打開專案中的campsite_SQLQuery.sql，將內容複製到資料庫，建立相應之資料表。資料庫帳號預設sa，密碼P@ssw0rd。
2. 於application.properties檔案中加入自己的PayPal Sandbox鑰匙
3. 於com.muwei.demo package中BookmycampsiteApplication右鍵Run
4. 前台首頁  [Lets Camping](http://localhost:8080/bookmycampsite/index)  (進入後請點選上方Navbar的Campsite)
5. 後台首頁 [Lets Camping Admin](http://localhost:8080/bookmycampsite/admin/top)  (進入後請點選左方Sidebar的Campsite)

**Run The Project**
1. Open the “campsite_SQLQuery.sql” and create the database.(DB account:sa / Password:P@ssw0rd)
2. In “application.properties”, fulfill your own PayPal Sandbox data (app and secret)
3. In “com.muwei.demo”package, run the “BookmycampsiteApplication”
4. Index  [Lets Camping](http://localhost:8080/bookmycampsite/index)  (After entering the index page, click “Campsite” button in the Navbar)
5. Admin Index [Lets Camping Admin](http://localhost:8080/bookmycampsite/admin/top)  (After entering the index page, click “Campsite” button in the Sidebar)
