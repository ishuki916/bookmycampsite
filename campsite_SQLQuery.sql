CREATE TABLE users(
id INT PRIMARY KEY IDENTITY(1,1),
email VARCHAR(50) NOT NULL,
pwd VARCHAR(50) NOT NULL,
username NVARCHAR(50) NOT NULL,
auth VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
gender VARCHAR(50) NOT NULL,
birth DATE NOT NULL,
lv NVARCHAR(50) NOT NULL,
[image]  NVARCHAR(max)
)

INSERT users (email, pwd, username, auth, phone, gender, birth, lv) VALUES('aaa@aaa.aa','aaaa','aa','1','0909090909','male','2015-12-17','admin');
INSERT users (email, pwd, username, auth, phone, gender, birth, lv) VALUES('bbb@bbb.bb','bbbb','bb','1','0909090909','female','2015-12-17','member');
INSERT users (email, pwd, username, auth, phone, gender, birth, lv) VALUES('ccc@ccc.cc','cccc','cc','1','0909090909','female','2015-12-17','member');

CREATE TABLE Campsite(
id INT PRIMARY KEY not NULL IDENTITY(1,1),
campsiteName NVARCHAR(100),
destination NVARCHAR(100),
campsiteAddress NVARCHAR(100),
traffic NVARCHAR(500),
introduction NVARCHAR(500),
caIntro NVARCHAR(500),
taIntro NVARCHAR(500),
pricePerNightsCA INT,
pricePerNightsTA INT,
campervanAreaAmount INT,
tentAreaAmount INT,
toilet NVARCHAR(10),
showerRoom NVARCHAR(10),
garbage NVARCHAR(10),
wifi NVARCHAR(10),
Manager NVARCHAR(10),
charge NVARCHAR(10),
refrigerator NVARCHAR(10),
kitchenSink NVARCHAR(10),
rentBike NVARCHAR(10),
washer NVARCHAR(10),
cafeBar NVARCHAR(10),
withPets NVARCHAR(10)
)
 
 
 
INSERT INTO Campsite
VALUES(
N'清田山SEIDAYAMA',
N'新潟県',
N'〒949-8444 新潟県十日町市清田山己1742',
N'如果在地圖上設定最短距離抵達，它會將您帶至相當狹窄的林間道路，可以將您的目標位置設定到「ゆくら妻有」，沿著看板指示即可找到露營場。',
N'日本國內少數可以一覽河流階地的露營場，優美的景色能讓您瞬間舒緩壓力。清田山露營場海拔約600公尺，信濃川及其支流流經形成河岸階地，被新潟和長野線境內的群山環繞，天氣好的話可以看見妙高山和火打山，盡情享受大自然。',
N'露營車露營地面積約6mx10m，僅供1台車使用，假如有兩台車請利用露營地旁的停車場。',
N'分為面向河流階地和面向森林地兩種露營場，每一塊露營地大約10mx10m，如果攜帶超過露營地面積的大帳篷，請預約複數的露營地',
2500,1500,10,12,'Y','Y','N','N','Y','Y','Y','Y','N','N','N','N'),
(
N'九十九灣園地TSUKUMOWANN',
N'石川県',
N'〒927-055 石川県鳳珠郡能登町越坂3-38',
N'假如您是開車前往露營地，從NOTO里山機場出發約40分鐘即可到達。',
N'能夠看見能登海景的第一選擇！稀有的海景露營經驗，日本百景之一的九十九灣內海，平穩的海浪及海風，讓人心也放鬆下來。天氣好的話，可以看見夕陽時橙橘色的光輝照亮立山連峰，海岸邊更不時有可愛的海洋動物來探訪。',
N'可容納六位，金額包含全部花費，包括停車費、設施費和入場費。露營地面積約6x15米（大約可容納一頂大型帳、天幕以及兩頂小型帳）',
N'專為一人露營者設計的露營場地！靜靜地眺望海景，渡過舒適愜意的時光。',
5500,2750,10,10,'Y','N','Y','N','Y','N','N','Y','Y','Y','N','Y'
),(
N'ist - Aokinodaira Field',
N'長野県',
N'〒384-1408 長野県南佐久郡川上村樋澤1402',
N'假如您是開車前往露營地，從中央自動車道「長坂IC」出發大約30分鐘',
N'露營地的西邊是群山環繞的長野縣川上村。距離野邊山高原很近，在ist -Aokinodara您可以享受幸福的山野自然風光。千曲川的源頭正是在此，您在露營地裡可以聽到河流的流水聲和鳥叫聲，全身心都能感受到大自然的祝福。',
N'露營車露營地面積約6mx10m，僅供1台車使用，部分出入口較為狹窄，如擔心露營車不好經過，請洽詢客服專線詢問。',
N'分為面向河岸和面向森林地等露營場，每一塊露營地大約10mx10m，如果攜帶超過露營地面積的大帳篷，請預約複數的露營地',
3000,1500,10,8,'Y','N','N','Y','N','Y','N','Y','N','N','Y','Y'
),(
N'種差TANESASHI Campsite',
N'青森県',
N'〒031-0841 青森県八戸市鮫町赤コウ55-4',
N'開車：從八戶駅出發40分、八戶市中心街出發30分。火車：JR八戶線種差海岸站走5分鐘即可抵達。',
N'湛藍色的海洋，清爽的海風，種差海岸邊唯一的露營場地。從露營場到葦毛崎展望台有約5.2㎞的步道，隨著季節變化，能夠欣賞各種有趣的花草。除了能享受露營野炊和野營的樂趣，還能享有獨一無二的海景露營體驗。',
NULL,
N'專為一人露營者設計的露營場地！靜靜地眺望海景，渡過舒適愜意的時光。',
0,1500,0,7,'Y','Y','Y','Y','Y','Y','Y','Y','N','N','N','Y'
),(
N'雷鳥沢RAICHOZAEA Campsite',
N'富山県',
N'〒930-1403 富山県中新川郡立山町芦峅寺雷鳥平',
N'從立山黒部室堂徒步到露營地約45分',
N'被美麗的立山山群環繞，海拔2277m的露營場。不僅可以看到立山連峰和大日連山，還能欣賞平地少見的高山植物。在立山縱走和奥大日岳的登山客中，不論是想要一個人獨宿一晚享受個人時光，或是家族旅行都是人氣超高的高山露營地！',
NULL,
N'遼闊的露營場，沒有分區，自由選位。費用以一單人帳為限，如果需要複數帳篷請複數選位。',
0,1000,0,9,'N','N','N','N','Y','N','N','Y','N','N','N','Y'
),(
N'RetreatCamp Mahoroba',
N'山梨県',
N'〒401-0304 山梨県南都留郡富士河口湖町河口山宮2553',
N'開車的話，在中央道河口湖IC下車20分可抵達。從河口湖駅徒步到河口駐在所巴士站約25分',
N'距離河口湖5.3公里，有花園和露台，為了旅客的方便還提供共用廚房。館內提供私人停車位。如果住客想探索該地區，可以在附近地區健行。Mahoroba距離富士急高原樂園7.6公里，距離富士山29公里。露營時也能遠眺日本代表富士山的美景。',
N'費用包含停車場、衛浴設備、廁所和廚房。營地面積約9mx4.3m，在營地範圍內不論放幾頂帳篷都沒有關係',
N'一露營地可容納一露營車，營地大小約10.5mx7.5m，費用包含停車場、衛浴設備、廁所和廚房。',
13000,4000,10,10,'Y','Y','Y','Y','Y','Y','Y','Y','N','N','Y','Y'
);
 
CREATE TABLE campingUnit(
unitId INT PRIMARY KEY not NULL IDENTITY(1,1),
unitType NVARCHAR(100),
unitName NVARCHAR(100),
xPos INT,
yPos INT,
campsiteId INT,
FOREIGN KEY (campsiteId) REFERENCES Campsite(id)
)
 


INSERT INTO [EEIT54fifth].[dbo].[campingUnit]
VALUES('CA','C1',462,317,1),('CA','C2',436,345,1),('CA','C3',482,470,1),('CA','C4',517,419,1),('CA','C5',547,365,1),('CA','C6',669,399,1),('CA','C7',678,444,1),('CA','C8',697,494,1),('CA','C9',706	,542,1),('CA','C10',792,487,1),
('TA','T1',13,177,1),('TA','T2',44,138,1),('TA','T3',106,115,1),('TA','T4',132,76,1),('TA','T5',129,30,1),('TA','T6',158,215,1),('TA','T7',150,163,1),('TA','T8',174,117,1),('TA','T9',195,56,1),('TA','T10',270,377,1),('TA','T11',313,342,1),('TA','T12',340,207,1)
 
INSERT INTO [EEIT54fifth].[dbo].[campingUnit]
VALUES('CA','C1',197,536,2),('CA','C2',215,445,2),('CA','C3',258,367,2),('CA','C4',354,367,2),('CA','C5',459,406,2),('CA','C6',563,362,2),('CA','C7',596,269,2),('CA','C8',638,197,2),('CA','C9',699,158,2),('CA','C10',761,137,2),
('TA','T1',47,98,2),('TA','T2',45,145,2),('TA','T3',45,187,2),('TA','T4',215,168,2),('TA','T5',221,203,2),('TA','T6',119,352,2),('TA','T7',145,294,2),('TA','T8',322,169,2),('TA','T9',293,87,2),('TA','T10',300,37,2)
 
INSERT INTO [EEIT54fifth].[dbo].[campingUnit]
VALUES('CA','C1',564,295,3),('CA','C2',617,246,3),('CA','C3',706,226,3),('CA','C4',689,280,3),('CA','C5',764,260,3),('CA','C6',789,192,3),('CA','C7',470,28,3),('CA','C8',536,26,3),('CA','C9',609,21,3),('CA','C10',550,75,3),
('TA','T1',41,461,3),('TA','T2',118,454,3),('TA','T3',52,498,3),('TA','T4',127,489,3),('TA','T5',215,485,3),('TA','T6',349,470,3),('TA','T7',416,452,3),('TA','T8',319,265,3)
 
 
INSERT INTO [EEIT54fifth].[dbo].[campingUnit]
VALUES
('TA','T1',449,29,4),('TA','T2',510,18,4),('TA','T3',574,15,4),('TA','T4',640,191,4),('TA','T5',431,397,4),('TA','T6',589,412,4),('TA','T7',655,427,4)
 
INSERT INTO [EEIT54fifth].[dbo].[campingUnit]
VALUES
('TA','T1',42,471,5),('TA','T2',113,448,5),('TA','T3',172,418,5),('TA','T4',231,391,5),('TA','T5',294,362,5),('TA','T6',353,315,5),('TA','T7',403,258,5),('TA','T8',439,199,5),('TA','T9',484,140,5)
 
INSERT INTO [EEIT54fifth].[dbo].[campingUnit]
VALUES('CA','C1',485,405,6),('CA','C2',532,368,6),('CA','C3',588,334,6),('CA','C4',621,291,6),('CA','C5',561,424,6),('CA','C6',641,407,6),('CA','C7',618,453,6),('CA','C8',774,413,6),('CA','C9',751,460,6),('CA','C10',733,503,6),
('TA','T1',80,170,6),('TA','T2',79,249,6),('TA','T3',82,333,6),('TA','T4',92,413,6),('TA','T5',161,194,6),('TA','T6',153,253,6),('TA','T7',164,320,6),('TA','T8',359,187,6),('TA','T9',433,194,6),('TA','T10',487,226,6)
 
 
 


 
CREATE TABLE paidList(
paidListId INT PRIMARY KEY not NULL IDENTITY(1,1),
total INT)




 
CREATE TABLE bookingCampsite(
orderId INT PRIMARY KEY not NULL IDENTITY(1,1),
arrivalDate DATETIME,
paidStatus NVARCHAR(10),
bookingDate DATETIME,
paidListId INT,
unitId INT,
userId INT,
FOREIGN KEY (unitId) REFERENCES campingUnit(unitId),
FOREIGN KEY (userId) REFERENCES [EEIT54fifth].[dbo].[users](id),
FOREIGN KEY (paidListId) REFERENCES paidList(paidListId)
)




