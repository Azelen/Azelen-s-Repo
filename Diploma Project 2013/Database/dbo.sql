/*
Navicat SQL Server Data Transfer

Source Server         : Azelen-PC
Source Server Version : 100000
Source Host           : AZELEN-PC\SQLEXPRESS:1433
Source Database       : Users
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 100000
File Encoding         : 65001

Date: 2013-05-04 17:58:18
*/


-- ----------------------------
-- Table structure for [dbo].[Articles]
-- ----------------------------
DROP TABLE [dbo].[Articles]
GO
CREATE TABLE [dbo].[Articles] (
[id] int NOT NULL IDENTITY(1,1) ,
[title] char(255) NULL ,
[content] nvarchar(MAX) NULL ,
[posted] date NULL ,
[edited] date NULL 
)


GO

-- ----------------------------
-- Records of Articles
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Articles] ON
GO
SET IDENTITY_INSERT [dbo].[Articles] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[ArticlesList]
-- ----------------------------
DROP TABLE [dbo].[ArticlesList]
GO
CREATE TABLE [dbo].[ArticlesList] (
[id] int NOT NULL IDENTITY(1,1) ,
[list_id] int NOT NULL ,
[position] tinyint NOT NULL 
)


GO

-- ----------------------------
-- Records of ArticlesList
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ArticlesList] ON
GO
SET IDENTITY_INSERT [dbo].[ArticlesList] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[BlogsTest]
-- ----------------------------
DROP TABLE [dbo].[BlogsTest]
GO
CREATE TABLE [dbo].[BlogsTest] (
[MessageID] int NOT NULL ,
[Title] nvarchar(32) NULL ,
[DatePosted] nvarchar(MAX) NULL ,
[MessageText] nvarchar(MAX) NULL ,
[Author] nvarchar(MAX) NULL 
)


GO

-- ----------------------------
-- Records of BlogsTest
-- ----------------------------
INSERT INTO [dbo].[BlogsTest] ([MessageID], [Title], [DatePosted], [MessageText], [Author]) VALUES (N'1', N'', N'22.01.2013 0:00:00', N'', N'');
GO
INSERT INTO [dbo].[BlogsTest] ([MessageID], [Title], [DatePosted], [MessageText], [Author]) VALUES (N'2', N'', N'22.01.2013 0:00:00', N'', N'zerk');
GO
INSERT INTO [dbo].[BlogsTest] ([MessageID], [Title], [DatePosted], [MessageText], [Author]) VALUES (N'3', N'Thread 1', N'22.01.2013 0:00:00', N'<p>This is content of thread 1.</p>

<p>this content goes from \n line.</p>
', N'Azelen');
GO
INSERT INTO [dbo].[BlogsTest] ([MessageID], [Title], [DatePosted], [MessageText], [Author]) VALUES (N'4', N'Thread 1', N'22.01.2013 0:00:00', N'<p>This is content of thread 1.</p>

<p>this content goes from \n line.</p>
', N'Azelen');
GO
INSERT INTO [dbo].[BlogsTest] ([MessageID], [Title], [DatePosted], [MessageText], [Author]) VALUES (N'5', N'Thread 1', N'22.01.2013 0:00:00', N'<p>dfg</p>

<p>dsad</p>

<p>sadsa</p>

<p>d</p>

<p>sa</p>

<p>d</p>
', N'Azelen');
GO
INSERT INTO [dbo].[BlogsTest] ([MessageID], [Title], [DatePosted], [MessageText], [Author]) VALUES (N'6', N'Thread 2', N'23.01.2013 0:00:00', N'<p>This is thread 2 text and it should be filled with different blabla things that will teach other people to learn web-programming such as <strong>HTML</strong>, <strong>PHP</strong>, <strong>C#</strong> and helping languages such as Java, JavaScript...</p>

<p>I hope it will result in a <em>success</em>.</p>
', N'Azelen');
GO

-- ----------------------------
-- Table structure for [dbo].[CL_Groups]
-- ----------------------------
DROP TABLE [dbo].[CL_Groups]
GO
CREATE TABLE [dbo].[CL_Groups] (
[GroupID] int NOT NULL IDENTITY(1,1) ,
[GroupName] nvarchar(10) NOT NULL ,
[AccessLevel] int NOT NULL DEFAULT ((1)) 
)


GO
DBCC CHECKIDENT(N'[dbo].[CL_Groups]', RESEED, 34)
GO

-- ----------------------------
-- Records of CL_Groups
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CL_Groups] ON
GO
INSERT INTO [dbo].[CL_Groups] ([GroupID], [GroupName], [AccessLevel]) VALUES (N'32', N'Викладачі', N'2');
GO
INSERT INTO [dbo].[CL_Groups] ([GroupID], [GroupName], [AccessLevel]) VALUES (N'33', N'КМ-602', N'1');
GO
INSERT INTO [dbo].[CL_Groups] ([GroupID], [GroupName], [AccessLevel]) VALUES (N'34', N'КМ-603', N'1');
GO
SET IDENTITY_INSERT [dbo].[CL_Groups] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[CL_Individuals]
-- ----------------------------
DROP TABLE [dbo].[CL_Individuals]
GO
CREATE TABLE [dbo].[CL_Individuals] (
[AuthorID] varchar(24) NULL ,
[IndividualIndex] int NOT NULL ,
[DateCreated] varchar(10) NULL ,
[Title] nvarchar(MAX) NULL ,
[Content] nvarchar(MAX) NULL ,
[Page] int NOT NULL DEFAULT ((0)) 
)


GO

-- ----------------------------
-- Records of CL_Individuals
-- ----------------------------
INSERT INTO [dbo].[CL_Individuals] ([AuthorID], [IndividualIndex], [DateCreated], [Title], [Content], [Page]) VALUES (N'Azelen', N'1', N'04.05.2013', N'Переведення чисел із однієї системи числення в іншу', N'<ol style="margin-left: 24px;">
	<li><em>Використовуючи непозиційну систему числення (римську нумерологію) записати десяткове число.</em></li>
</ol>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td>1.</td>
			<td width="100px">2993</td>
			<td>11.</td>
			<td width="100px">1996</td>
			<td>21.</td>
			<td width="100px">3759</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>46638</td>
			<td>12.</td>
			<td>5911</td>
			<td>22.</td>
			<td>1925</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>47756</td>
			<td>13.</td>
			<td>5088</td>
			<td>23.</td>
			<td>8396</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>7892</td>
			<td>14.</td>
			<td>3851</td>
			<td>24.</td>
			<td>2738</td>
		</tr>
		<tr>
			<td>5.</td>
			<td>6730</td>
			<td>15.</td>
			<td>3607</td>
			<td>25.</td>
			<td>40681</td>
		</tr>
		<tr>
			<td>6.</td>
			<td>6077</td>
			<td>16.</td>
			<td>2578</td>
			<td>26.</td>
			<td>2348</td>
		</tr>
		<tr>
			<td>7.</td>
			<td>20967</td>
			<td>17.</td>
			<td>2967</td>
			<td>27.</td>
			<td>7291</td>
		</tr>
		<tr>
			<td>8.</td>
			<td>4997</td>
			<td>18.</td>
			<td>4943</td>
			<td>28.</td>
			<td>4073</td>
		</tr>
		<tr>
			<td>9.</td>
			<td>3776</td>
			<td>19.</td>
			<td>2906</td>
			<td>29.</td>
			<td>2664</td>
		</tr>
		<tr>
			<td>10.</td>
			<td>47765</td>
			<td>20.</td>
			<td>7001</td>
			<td>30.</td>
			<td>3775</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<ol start="2" style="margin-left: 24px;">
	<li><em>Перевести ціле число з 10-вої в 8-ву, 2-кову, 16-кову&nbsp; системи числення.</em></li>
</ol>

<table class="BodyTable">
	<tbody>
		<tr>
			<td>1.</td>
			<td width="100px">1975</td>
			<td>11.</td>
			<td width="100px">4981</td>
			<td>21.</td>
			<td width="100px">3832</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>2043</td>
			<td>12.</td>
			<td>3581</td>
			<td>22.</td>
			<td>4576</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>5602</td>
			<td>13.</td>
			<td>1981</td>
			<td>23.</td>
			<td>7504</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>4319</td>
			<td>14.</td>
			<td>5430</td>
			<td>24.</td>
			<td>9315</td>
		</tr>
		<tr>
			<td>5.</td>
			<td>3518</td>
			<td>15.</td>
			<td>8517</td>
			<td>25.</td>
			<td>3215</td>
		</tr>
		<tr>
			<td>6.</td>
			<td>6712</td>
			<td>16.</td>
			<td>7532</td>
			<td>26.</td>
			<td>5319</td>
		</tr>
		<tr>
			<td>7.</td>
			<td>3194</td>
			<td>17.</td>
			<td>8912</td>
			<td>27.</td>
			<td>6541</td>
		</tr>
		<tr>
			<td>8.</td>
			<td>8036</td>
			<td>18.</td>
			<td>3581</td>
			<td>28.</td>
			<td>7982</td>
		</tr>
		<tr>
			<td>9.</td>
			<td>4915</td>
			<td>19.</td>
			<td>4342</td>
			<td>29.</td>
			<td>9129</td>
		</tr>
		<tr>
			<td>10.</td>
			<td>8591</td>
			<td>20.</td>
			<td>5861</td>
			<td>30.</td>
			<td>4356</td>
		</tr>
	</tbody>
</table>

<p><span style="line-height: 1.6em;">&nbsp;</span></p>

<ol start="3" style="margin-left: 24px;">
	<li><em>Перевести дробове 10-ве число в 2-ву, 8-кову, 16-кову системи числення.</em></li>
</ol>

<table class="BodyTable">
	<tbody>
		<tr>
			<td>1.</td>
			<td width="100px">1975,575</td>
			<td>11.</td>
			<td width="100px">4342,342</td>
			<td>21.</td>
			<td width="100px">6712,167</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>1981,451</td>
			<td>12.</td>
			<td>4356,862</td>
			<td>22.</td>
			<td>7504,732</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>2043,321</td>
			<td>13.</td>
			<td>4576.327</td>
			<td>23.</td>
			<td>7532.659</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>3194,167</td>
			<td>14.</td>
			<td>4915,326</td>
			<td>24.</td>
			<td>7982,827</td>
		</tr>
		<tr>
			<td>5.</td>
			<td>3215,436</td>
			<td>15.</td>
			<td>4981,832</td>
			<td>25.</td>
			<td>8036,568</td>
		</tr>
		<tr>
			<td>6.</td>
			<td>3518.532</td>
			<td>16.</td>
			<td>5319,478</td>
			<td>26.</td>
			<td>8517,956</td>
		</tr>
		<tr>
			<td>7.</td>
			<td>3581,344</td>
			<td>17.</td>
			<td>5430,981</td>
			<td>27.</td>
			<td>8591,574</td>
		</tr>
		<tr>
			<td>8.</td>
			<td>3581,917</td>
			<td>18.</td>
			<td>5602,456</td>
			<td>28.</td>
			<td>8912,819</td>
		</tr>
		<tr>
			<td>9.</td>
			<td>3832,126</td>
			<td>19.</td>
			<td>5861,162</td>
			<td>29.</td>
			<td>9129,574</td>
		</tr>
		<tr>
			<td>10.</td>
			<td>4319,687</td>
			<td>20.</td>
			<td>6541,306</td>
			<td>30.</td>
			<td>9315,365</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<ol start="4" style="margin-left: 24px;">
	<li><em>Перевести ціле 2-ве число в 10-ву систему числення.</em></li>
</ol>

<table class="BodyTable">
	<tbody>
		<tr>
			<td>1.</td>
			<td width="160px">1110100111010111</td>
			<td>11.</td>
			<td width="160px">1111011101111010</td>
			<td>21.</td>
			<td width="160px">1110111011110100</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>1001100111101101</td>
			<td>12.</td>
			<td>1101110100101101</td>
			<td>22.</td>
			<td>1100001000100011</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>1110101110100010</td>
			<td>13.</td>
			<td>1101111001111011</td>
			<td>23.</td>
			<td>1110111010110111</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>1111101110100010</td>
			<td>14.</td>
			<td>1110000111101101</td>
			<td>24.</td>
			<td>1111011000100010</td>
		</tr>
		<tr>
			<td>5.</td>
			<td>1110111010001011</td>
			<td>15.</td>
			<td>1111011101001011</td>
			<td>25.</td>
			<td>1000100011110110</td>
		</tr>
		<tr>
			<td>6.</td>
			<td>1110111011010111</td>
			<td>16.</td>
			<td>1100010011101101</td>
			<td>26.</td>
			<td>1110111000100100</td>
		</tr>
		<tr>
			<td>7.</td>
			<td>1111011110111101</td>
			<td>17.</td>
			<td>1000111101110110</td>
			<td>27.</td>
			<td>1000100111101001</td>
		</tr>
		<tr>
			<td>8.</td>
			<td>1000100011110111</td>
			<td>18.</td>
			<td>1111101110111000</td>
			<td>28.</td>
			<td>1111100000100100</td>
		</tr>
		<tr>
			<td>9.</td>
			<td>1111011111011101</td>
			<td>19.</td>
			<td>1100001000100011</td>
			<td>29.</td>
			<td>1000100001111111</td>
		</tr>
		<tr>
			<td>10.</td>
			<td>1111111000010011</td>
			<td>20.</td>
			<td>1001000101011011</td>
			<td>30.</td>
			<td>0111101100001011</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', N'1');
GO
INSERT INTO [dbo].[CL_Individuals] ([AuthorID], [IndividualIndex], [DateCreated], [Title], [Content], [Page]) VALUES (N'Azelen', N'1', N'04.05.2013', N'Переведення чисел із однієї системи числення в іншу', N'<ol start="5" style="margin-left: 24px;">
	<li><em>Перевести ціле 2-ве число в 8-ву і 16-кову системи числення.</em></li>
</ol>

<table class="BodyTable">
	<tbody>
		<tr>
			<td>1.</td>
			<td width="160px">1110100111010111</td>
			<td>11.</td>
			<td width="160px">1111011101111010</td>
			<td>21.</td>
			<td width="160px">1110111011110100</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>1001100111101101</td>
			<td>12.</td>
			<td>1101110100101101</td>
			<td>22.</td>
			<td>1100001000100011</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>1110101110100010</td>
			<td>13.</td>
			<td>1101111001111011</td>
			<td>23.</td>
			<td>1110111010110111</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>1111101110100010</td>
			<td>14.</td>
			<td>1110000111101101</td>
			<td>24.</td>
			<td>1111011000100010</td>
		</tr>
		<tr>
			<td>5.</td>
			<td>1110111010001011</td>
			<td>15.</td>
			<td>1111011101001011</td>
			<td>25.</td>
			<td>1000100011110110</td>
		</tr>
		<tr>
			<td>6.</td>
			<td>1110111011010111</td>
			<td>16.</td>
			<td>1100010011101101</td>
			<td>26.</td>
			<td>1110111000100100</td>
		</tr>
		<tr>
			<td>7.</td>
			<td>1111011110111101</td>
			<td>17.</td>
			<td>1000111101110110</td>
			<td>27.</td>
			<td>1000100111101001</td>
		</tr>
		<tr>
			<td>8.</td>
			<td>1000100011110111</td>
			<td>18.</td>
			<td>1111101110111000</td>
			<td>28.</td>
			<td>1111100000100100</td>
		</tr>
		<tr>
			<td>9.</td>
			<td>1111011111011101</td>
			<td>19.</td>
			<td>1100001000100011</td>
			<td>29.</td>
			<td>1000100001111111</td>
		</tr>
		<tr>
			<td>10.</td>
			<td>1111111000010011</td>
			<td>20.</td>
			<td>1001000101011011</td>
			<td>30.</td>
			<td>0111101100001011</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<ol start="6" style="margin-left: 24px;">
	<li><em>Перевести ціле 16-ве число в 10-ву систему числення.</em></li>
</ol>

<table class="BodyTable">
	<tbody>
		<tr>
			<td>1.</td>
			<td width="100px">E4511632</td>
			<td>11.</td>
			<td width="100px">5903Р01</td>
			<td>21.</td>
			<td width="100px">351656</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>С3541</td>
			<td>12.</td>
			<td>53А6162</td>
			<td>22.</td>
			<td>34126</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>В750432</td>
			<td>13.</td>
			<td>53632361</td>
			<td>23.</td>
			<td>3315365</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>98АЗВ</td>
			<td>14.</td>
			<td>531477</td>
			<td>24.</td>
			<td>321Е536</td>
		</tr>
		<tr>
			<td>5.</td>
			<td>963202А</td>
			<td>15.</td>
			<td>4573В27</td>
			<td>25.</td>
			<td>23С5102</td>
		</tr>
		<tr>
			<td>6.</td>
			<td>7532657</td>
			<td>16.</td>
			<td>43F42ЕЕ2</td>
			<td>26.</td>
			<td>1В12674</td>
		</tr>
		<tr>
			<td>7.</td>
			<td>72В62327</td>
			<td>17.</td>
			<td>435ВВ462</td>
			<td>27.</td>
			<td>16В51F51</td>
		</tr>
		<tr>
			<td>8.</td>
			<td>6982301</td>
			<td>18.</td>
			<td>42Е126</td>
			<td>28.</td>
			<td>1591704</td>
		</tr>
		<tr>
			<td>9.</td>
			<td>6541306</td>
			<td>19.</td>
			<td>3А5744</td>
			<td>29.</td>
			<td>13B60D</td>
		</tr>
		<tr>
			<td>10.</td>
			<td>5F4302А41</td>
			<td>20.</td>
			<td>36ВВ12</td>
			<td>30.</td>
			<td>23E67</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<ol start="7" style="margin-left: 24px;">
	<li><em>Перевести ціле 8-ве число в 10-ву систему числення.</em></li>
</ol>

<table class="BodyTable">
	<tbody>
		<tr>
			<td>1.</td>
			<td width="100px">1675,575</td>
			<td>11.</td>
			<td width="100px">4511,632</td>
			<td>21.</td>
			<td width="100px">3432,126</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>2043,321</td>
			<td>12.</td>
			<td>3541,317</td>
			<td>22.</td>
			<td>4576,327</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>5602,456</td>
			<td>13.</td>
			<td>1651,451</td>
			<td>23.</td>
			<td>7504,732</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>4317,637</td>
			<td>14.</td>
			<td>5430,241</td>
			<td>24.</td>
			<td>3315,365</td>
		</tr>
		<tr>
			<td>5.</td>
			<td>3518,532</td>
			<td>15.</td>
			<td>3517,656</td>
			<td>25.</td>
			<td>3215,436</td>
		</tr>
		<tr>
			<td>6.</td>
			<td>6712,167</td>
			<td>16.</td>
			<td>7532,657</td>
			<td>26.</td>
			<td>5319,477</td>
		</tr>
		<tr>
			<td>7.</td>
			<td>3104,167</td>
			<td>17.</td>
			<td>2312,512</td>
			<td>27.</td>
			<td>6541,306</td>
		</tr>
		<tr>
			<td>8.</td>
			<td>6036,563</td>
			<td>18.</td>
			<td>3571,344</td>
			<td>28.</td>
			<td>7262,327</td>
		</tr>
		<tr>
			<td>9.</td>
			<td>4215,326</td>
			<td>19.</td>
			<td>4342,342</td>
			<td>29.</td>
			<td>1126,574</td>
		</tr>
		<tr>
			<td>10.</td>
			<td>1591,574</td>
			<td>20.</td>
			<td>5361,162</td>
			<td>30.</td>
			<td>4356,462</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', N'2');
GO
INSERT INTO [dbo].[CL_Individuals] ([AuthorID], [IndividualIndex], [DateCreated], [Title], [Content], [Page]) VALUES (N'Azelen', N'2', N'04.05.2013', N'Виконання арифметичних операцій у різних системах числення', N'<ol style="margin-left: 24px;">
	<li><em>Додати цілі двійкові числа.</em></li>
</ol>

<table class="BodyTable">
	<tbody>
		<tr>
			<td>1.</td>
			<td width="150px">101101 + 101111</td>
			<td>11.</td>
			<td width="150px">1110110 + 11011</td>
			<td>21.</td>
			<td width="150px">1010011 + 11011</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>1000111 + 11010</td>
			<td>12.</td>
			<td>1000111 + 10110</td>
			<td>22.</td>
			<td>1011011 + 11001</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>1010110 + 10011</td>
			<td>13.</td>
			<td>10000111 + 1001</td>
			<td>23.</td>
			<td>1111001 + 11011</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>1110011 + 10011</td>
			<td>14.</td>
			<td>101101 + 110100</td>
			<td>24.</td>
			<td>1001111 + 10111</td>
		</tr>
		<tr>
			<td>5.</td>
			<td>1110110 + 10001</td>
			<td>15.</td>
			<td>11111 + 1011101</td>
			<td>25.</td>
			<td>110011 + 111001</td>
		</tr>
		<tr>
			<td>6.</td>
			<td>1110111 + 10110</td>
			<td>16.</td>
			<td>1101101 + 11001</td>
			<td>26.</td>
			<td>10111101 + 1100</td>
		</tr>
		<tr>
			<td>7.</td>
			<td>1011101 + 10101</td>
			<td>17.</td>
			<td>11101101 + 1011</td>
			<td>27.</td>
			<td>11001001 + 1011</td>
		</tr>
		<tr>
			<td>8.</td>
			<td>101110 + 101101</td>
			<td>18.</td>
			<td>1111011 + 11100</td>
			<td>28.</td>
			<td>1110110 + 10101</td>
		</tr>
		<tr>
			<td>9.</td>
			<td>1011111 + 11010</td>
			<td>19.</td>
			<td>101110 + 100011</td>
			<td>29.</td>
			<td>1001101 + 11011</td>
		</tr>
		<tr>
			<td>10.</td>
			<td>1100011 + 10111</td>
			<td>20.</td>
			<td>101101 + 101101</td>
			<td>30.</td>
			<td>100101 + 111011</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<ol start="2" style="margin-left: 24px;">
	<li><em>Відняти цілі двійкові числа.</em></li>
</ol>

<table class="BodyTable">
	<tbody>
		<tr>
			<td>1.</td>
			<td width="150px">1110100 - 011101</td>
			<td>11.</td>
			<td width="150px">1110111 - 111011</td>
			<td>21.</td>
			<td width="150px">1101011 - 111011</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>1110101 - 110111</td>
			<td>12.</td>
			<td>1110100 - 101110</td>
			<td>22.</td>
			<td>1101011 - 111101</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>1110101 - 100101</td>
			<td>13.</td>
			<td>1101000 - 100011</td>
			<td>23.</td>
			<td>1101111 - 110111</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>1110111 - 100011</td>
			<td>14.</td>
			<td>1101001 - 110110</td>
			<td>24.</td>
			<td>1101111 - 101011</td>
		</tr>
		<tr>
			<td>5.</td>
			<td>1110011 - 100111</td>
			<td>15.</td>
			<td>1101111 - 101111</td>
			<td>25.</td>
			<td>1101111 - 111001</td>
		</tr>
		<tr>
			<td>6.</td>
			<td>1110011 - 010110</td>
			<td>16.</td>
			<td>1101101 - 110111</td>
			<td>26.</td>
			<td>1111101 - 110110</td>
		</tr>
		<tr>
			<td>7.</td>
			<td>1110100 - 011101</td>
			<td>17.</td>
			<td>1111101 - 101110</td>
			<td>27.</td>
			<td>1101001 - 101011</td>
		</tr>
		<tr>
			<td>8.</td>
			<td>1110101 - 101101</td>
			<td>18.</td>
			<td>1101011 - 111010</td>
			<td>28.</td>
			<td>1110110 - 101101</td>
		</tr>
		<tr>
			<td>9.</td>
			<td>1110101 - 101100</td>
			<td>19.</td>
			<td>1101010 - 100111</td>
			<td>29.</td>
			<td>1101101 - 110011</td>
		</tr>
		<tr>
			<td>10.</td>
			<td>1110110 - 100011</td>
			<td>20.</td>
			<td>1101101 - 101101</td>
			<td>30.</td>
			<td>1110101 - 110011</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<ol start="3" style="margin-left: 24px;">
	<li><em>Помножити</em><em> цілі двійкові числа.</em></li>
</ol>

<table class="BodyTable">
	<tbody>
		<tr>
			<td>1.</td>
			<td width="150px">101101&nbsp;&middot;&nbsp;1011101</td>
			<td>6.</td>
			<td width="150px">1110111&nbsp;&middot;&nbsp;10110110</td>
			<td>11.</td>
			<td width="150px">&nbsp;1110110&nbsp;&middot;&nbsp;1110011</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>1000111&nbsp;&middot;&nbsp;1101110</td>
			<td>7.</td>
			<td>1011101&nbsp;&middot;&nbsp;10110101</td>
			<td>12.</td>
			<td>&nbsp;1000111&nbsp;&middot;&nbsp;1011101</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>1010110&nbsp;&middot;&nbsp;100101</td>
			<td>8.</td>
			<td>101110&nbsp;&middot;&nbsp;1011101</td>
			<td>13.</td>
			<td>10000111&nbsp;&middot;&nbsp;1000111</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>1110011&nbsp;&middot;&nbsp;1000111</td>
			<td>9.</td>
			<td>1011111&nbsp;&middot;&nbsp;11011100</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>5.</td>
			<td>1110110&nbsp;&middot;&nbsp;1000111</td>
			<td>10.</td>
			<td>&nbsp;1100011&nbsp;&middot;&nbsp;1000111</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<ol start="4" style="margin-left: 24px;">
	<li><em>Поділити цілі двійкові числа.</em></li>
</ol>

<table class="BodyTable">
	<tbody>
		<tr>
			<td>1.</td>
			<td width="150px">10010101 : 101</td>
			<td>11.</td>
			<td width="150px">10010101 : 110</td>
			<td>21.</td>
			<td width="150px">10010101 : 111</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>101101101 : 110</td>
			<td>12.</td>
			<td>101101101 : 100</td>
			<td>22.</td>
			<td>101101101 : 1011</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>1100011101 : 100</td>
			<td>13.</td>
			<td>1100011101 : 101</td>
			<td>23.</td>
			<td>1100011101 : 110</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>111001110 : 1011</td>
			<td>14.</td>
			<td>111001110 : 101</td>
			<td>24.</td>
			<td>111001110 : 100</td>
		</tr>
		<tr>
			<td>5.</td>
			<td>101111011 : 110</td>
			<td>15.</td>
			<td>101111011 : 100</td>
			<td>25.</td>
			<td>101111011 : 1101</td>
		</tr>
		<tr>
			<td>6.</td>
			<td>11101001 : 100</td>
			<td>16.</td>
			<td>11101001 : 101</td>
			<td>26.</td>
			<td>11101001 : 110</td>
		</tr>
		<tr>
			<td>7.</td>
			<td>10101010 : 110</td>
			<td>17.</td>
			<td>10101010 : 100</td>
			<td>27.</td>
			<td>10101010 : 101</td>
		</tr>
		<tr>
			<td>8.</td>
			<td>11001110 : 101</td>
			<td>18.</td>
			<td>11001110 : 100</td>
			<td>28.</td>
			<td>11001110 : 1010</td>
		</tr>
		<tr>
			<td>9.</td>
			<td>111011001:101</td>
			<td>19.</td>
			<td>111011001:110</td>
			<td>29.</td>
			<td>111011001:100</td>
		</tr>
		<tr>
			<td>10.</td>
			<td>1110111010:110</td>
			<td>20.</td>
			<td>1110111010:101</td>
			<td>30.</td>
			<td>1110111010:100</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', N'1');
GO
INSERT INTO [dbo].[CL_Individuals] ([AuthorID], [IndividualIndex], [DateCreated], [Title], [Content], [Page]) VALUES (N'Azelen', N'3', N'04.05.2013', N'Представлення чисел у прямому,  оберненому та доповняльному кодах', N'<ol style="margin-left: 24px;">
	<li><em>Подати додатні двійкові числа в прямому коді (номер завдання відповідає номеру в списку):</em></li>
</ol>

<table class="BodyTable">
	<tbody>
		<tr>
			<td>1.</td>
			<td width="100px">11010011</td>
			<td>11.</td>
			<td width="100px">111101110</td>
			<td>21.</td>
			<td width="100px">11101110111</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>10011001</td>
			<td>12.</td>
			<td>1101110101</td>
			<td>22.</td>
			<td>1100001000</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>111010111</td>
			<td>13.</td>
			<td>1101111001</td>
			<td>23.</td>
			<td>11101110101</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>1111101110</td>
			<td>14.</td>
			<td>1110000111</td>
			<td>24.</td>
			<td>11110110001</td>
		</tr>
		<tr>
			<td>5.</td>
			<td>1110111010</td>
			<td>15.</td>
			<td>1111011100</td>
			<td>25.</td>
			<td>1000100011</td>
		</tr>
		<tr>
			<td>6.</td>
			<td>1110111011</td>
			<td>16.</td>
			<td>11000100111</td>
			<td>26.</td>
			<td>11101110001</td>
		</tr>
		<tr>
			<td>7.</td>
			<td>1111011110</td>
			<td>17.</td>
			<td>10001111011</td>
			<td>27.</td>
			<td>10001001111</td>
		</tr>
		<tr>
			<td>8.</td>
			<td>100010001</td>
			<td>18.</td>
			<td>11111011101</td>
			<td>28.</td>
			<td>1111100000</td>
		</tr>
		<tr>
			<td>9.</td>
			<td>111101111</td>
			<td>19.</td>
			<td>11000010001</td>
			<td>29.</td>
			<td>100010000111</td>
		</tr>
		<tr>
			<td>10.</td>
			<td>1111111000</td>
			<td>20.</td>
			<td>1001000101</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<ol start="2" style="margin-left: 24px;">
	<li><em>Представити від&#39;ємні числа в оберненому </em><em>і додатковому кодах.</em></li>
</ol>

<table class="BodyTable">
	<tbody>
		<tr>
			<td>1.</td>
			<td width="140px">-10100111010111</td>
			<td>11.</td>
			<td width="140px">-11011101111010</td>
			<td>21.</td>
			<td width="140px">-110111011110100</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>-10011011101101</td>
			<td>12.</td>
			<td>-01110100101101</td>
			<td>22.</td>
			<td>-00001000100011</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>-11010111000010</td>
			<td>13.</td>
			<td>-01111001111011</td>
			<td>23.</td>
			<td>-10111010110111</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>-11110111100010</td>
			<td>14.</td>
			<td>-10000111101101</td>
			<td>24.</td>
			<td>-111011000100010</td>
		</tr>
		<tr>
			<td>5.</td>
			<td>-11011101001011</td>
			<td>15.</td>
			<td>-11011101001011</td>
			<td>25.</td>
			<td>-00100011110110</td>
		</tr>
		<tr>
			<td>6.</td>
			<td>-10111010101101</td>
			<td>16.</td>
			<td>-10010011101101</td>
			<td>26.</td>
			<td>-10111000100100</td>
		</tr>
		<tr>
			<td>7.</td>
			<td>-11011110111101</td>
			<td>17.</td>
			<td>-10111101110110</td>
			<td>27.</td>
			<td>-001001111010001</td>
		</tr>
		<tr>
			<td>8.</td>
			<td>-00000011110111</td>
			<td>18.</td>
			<td>-11101110111000</td>
			<td>28.</td>
			<td>-111100000100100</td>
		</tr>
		<tr>
			<td>9.</td>
			<td>-11011111011101</td>
			<td>19.</td>
			<td>-10001000100011</td>
			<td>29.</td>
			<td>-000100001111111</td>
		</tr>
		<tr>
			<td>10.</td>
			<td>-11111000010011</td>
			<td>20.</td>
			<td>-01000101011011</td>
			<td>30.</td>
			<td>-111101100001011</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<ol start="3" style="margin-left: 24px;">
	<li><em>Додати числа в оберненому і додатковому кодах (в однобайтовому режимі).</em></li>
</ol>

<table class="BodyTable">
	<tbody>
		<tr>
			<td>1.</td>
			<td width="130px">
			<p>X= -1101001</p>

			<p>Y=&nbsp;100110</p>
			</td>
			<td>11.</td>
			<td width="130px">
			<p>X= -1110111</p>

			<p>Y=&nbsp;110000</p>
			</td>
			<td>21.</td>
			<td width="130px">
			<p>X=&nbsp;1111011</p>

			<p>Y= -110111</p>
			</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>
			<p>X= -1110101</p>

			<p>Y=&nbsp;111110</p>
			</td>
			<td>12.</td>
			<td>
			<p>X= -1110111</p>

			<p>Y=&nbsp;111101</p>
			</td>
			<td>22.</td>
			<td>
			<p>X=&nbsp;1101111</p>

			<p>Y= -111000</p>
			</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>
			<p>X= -1110111</p>

			<p>Y=&nbsp;111011</p>
			</td>
			<td>13.</td>
			<td>
			<p>X= -1000100&nbsp;</p>

			<p>Y=&nbsp;111011</p>
			</td>
			<td>23.</td>
			<td>
			<p>X=&nbsp;1111011</p>

			<p>Y= -110001</p>
			</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>
			<p>X= -1111011</p>

			<p>Y=&nbsp;100010</p>
			</td>
			<td>14.</td>
			<td>
			<p>X= -1000100</p>

			<p>Y=&nbsp;111110</p>
			</td>
			<td>24.</td>
			<td>
			<p>X=&nbsp;1000111</p>

			<p>Y= -111110</p>
			</td>
		</tr>
		<tr>
			<td>5.</td>
			<td>
			<p>X= -1111011</p>

			<p>Y=&nbsp;111111</p>
			</td>
			<td>15.</td>
			<td>
			<p>X= -1000100</p>

			<p>Y=&nbsp;111101</p>
			</td>
			<td>25.</td>
			<td>
			<p>X=&nbsp;1100001</p>

			<p>Y= -100100</p>
			</td>
		</tr>
		<tr>
			<td>6.</td>
			<td>
			<p>X= -1111011</p>

			<p>Y=&nbsp;110111</p>
			</td>
			<td>16.</td>
			<td>
			<p>X= -1101001</p>

			<p>Y=&nbsp;100110</p>
			</td>
			<td>26.</td>
			<td>
			<p>X=&nbsp;1110111</p>

			<p>Y= -110000</p>
			</td>
		</tr>
		<tr>
			<td>7.</td>
			<td>
			<p>X= -1101110</p>

			<p>Y=&nbsp;111000</p>
			</td>
			<td>17.</td>
			<td>
			<p>X= -1110101</p>

			<p>Y=&nbsp;111110</p>
			</td>
			<td>27.</td>
			<td>
			<p>X=&nbsp;1110111</p>

			<p>Y= -111101</p>
			</td>
		</tr>
		<tr>
			<td>8.</td>
			<td>
			<p>X= -111101</p>

			<p>Y=&nbsp;110001</p>
			</td>
			<td>18.</td>
			<td>
			<p>X=&nbsp;1110111</p>

			<p>Y= -111011</p>
			</td>
			<td>28.</td>
			<td>
			<p>X=&nbsp;1000100</p>

			<p>Y= -111011</p>
			</td>
		</tr>
		<tr>
			<td>9.</td>
			<td>
			<p>X= -1000111</p>

			<p>Y=&nbsp;111110</p>
			</td>
			<td>19.</td>
			<td>
			<p>X=&nbsp;111101</p>

			<p>Y= -100010</p>
			</td>
			<td>29.</td>
			<td>
			<p>X=&nbsp;1000100</p>

			<p>Y= -111110</p>
			</td>
		</tr>
		<tr>
			<td>10.</td>
			<td>
			<p>X= -1100001</p>

			<p>Y=&nbsp;100100</p>
			</td>
			<td>20.</td>
			<td>
			<p>X=&nbsp;1111011</p>

			<p>Y= -111111</p>
			</td>
			<td>30.</td>
			<td>
			<p>X=&nbsp;1000100</p>

			<p>Y= -111101</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', N'1');
GO
INSERT INTO [dbo].[CL_Individuals] ([AuthorID], [IndividualIndex], [DateCreated], [Title], [Content], [Page]) VALUES (N'Azelen', N'4', N'04.05.2013', N'Логічні функції. Таблиці істинності.  Представлення логічних операцій на схемах', N'<ol style="margin-left: 24px;">
	<li><em>Для аналітично заданих логічних функцій побудувати таблиці істинності та логічні схеми, за побудованими таблицями істинності утворити ДДНФ і ДКНФ булевих функцій:</em></li>
</ol>

<table class="BodyTable" style="width: 80%;">
	<tbody>
		<tr>
			<td width="25px">1.</td>
			<td>f(x,y) = <span style="border-top: 1px solid">x ^ y</span></td>
			<td width="25px">16.</td>
			<td>f(x,y,z) = x ^ y ^ z v x ^ <span style="border-top: 1px solid">y</span> ^ <span style="border-top: 1px solid">z</span></td>
		</tr>
		<tr>
			<td>2.</td>
			<td>f(x,y,z) = <span style="border-top: 1px solid">z ^ y v x</span></td>
			<td>17.</td>
			<td>f(x,y,z) = <span style="border-top: 1px solid">(x v y)</span> ^ z</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>f(x,y) = x v (y ^ z)</td>
			<td>18.</td>
			<td>f(x,y,z) = <span style="border-top: 1px solid">(x v y)</span> ^ <span style="border-top: double">z</span></td>
		</tr>
		<tr>
			<td>4.</td>
			<td>f(x,y,z) = (x ^ <span style="border-top: 1px solid">y</span>) v z</td>
			<td>19.</td>
			<td>f(x,y,z) = y ^ <span style="border-top: 1px solid">(x v y)</span> ^ <span style="border-top: double">z</span></td>
		</tr>
		<tr>
			<td>5.</td>
			<td>f(x,y) = <span style="border-top: 1px solid">x</span> ^ y v <span style="border-top: 1px solid">x v y</span> v x</td>
			<td>20.</td>
			<td>f(x,y,z) = y ^ z v <span style="border-top: 1px solid">(y ^ z)</span></td>
		</tr>
		<tr>
			<td>6.</td>
			<td>f(x,y) = <span style="border-top: 1px solid">x v y</span> ^ (x ^ <span style="border-top: 1px solid">y</span>)</td>
			<td>21.</td>
			<td>f(x,y,z) = y ^ <span style="border-top: 1px solid">z v <span style="border-top: double">(y ^ z)</span></span></td>
		</tr>
		<tr>
			<td>7.</td>
			<td>f(x,y,z) = (<span style="border-top: 1px solid">x</span> v y) ^ z</td>
			<td>22.</td>
			<td>f(x,y,z) = <span style="border-top: 1px solid">y</span> ^ <span style="border-top: 1px solid">z v <span style="border-top: double">(y ^ z)</span></span></td>
		</tr>
		<tr>
			<td>8.</td>
			<td>f(x,y,z) = (<span style="border-top: 1px solid">x</span> v y) ^ <span style="border-top: 1px solid">(z v z)</span></td>
			<td>23.</td>
			<td>f(x,y,z) = <span style="border-top: double">y</span> ^ <span style="border-top: 1px solid">z v <span style="border-top: double">(y ^ z)</span></span></td>
		</tr>
		<tr>
			<td>9.</td>
			<td>f(x,y,z) = <span style="border-top: 1px solid">y</span> ^ z v <span style="border-top: 1px solid">(y ^ z)</span></td>
			<td>24.</td>
			<td>f(x,y,z) = <span style="border-top: 1px solid">(x v y)</span> ^ <span style="border-top: 1px solid">z v y</span></td>
		</tr>
		<tr>
			<td>10.</td>
			<td>f(x,y,z) = y ^ <span style="border-top: 1px solid">z</span> v <span style="border-top: 1px solid">(y ^ z)</span></td>
			<td>25.</td>
			<td>f(x,y,z) = <span style="border-top: 1px solid"><span style="border-top: double">(x v y)</span> ^ z</span></td>
		</tr>
		<tr>
			<td>11.</td>
			<td>f(x,y,z) = <span style="border-top: double">y</span> ^ z v <span style="border-top: double">(y ^ z)</span></td>
			<td>26.</td>
			<td>f(x,y,z) = (x v y) ^ z v y</td>
		</tr>
		<tr>
			<td>12.</td>
			<td>f(x,y,z) = y ^ <span style="border-top: double">z</span> v <span style="border-top: 1px solid">(y ^ z)</span></td>
			<td>27.</td>
			<td>f(x,y,z) = <span style="border-top: 1px solid">(y ^ z) v x</span></td>
		</tr>
		<tr>
			<td>13.</td>
			<td>f(x,y) = <span style="border-top: 1px solid">x v y</span> ^ (x ^ <span style="border-top: 1px solid">y</span>)</td>
			<td>28.</td>
			<td>f(x,y,z) = <span style="border-top: 1px solid">(y ^ z) v x v <span style="border-top: double">z</span></span></td>
		</tr>
		<tr>
			<td>14.</td>
			<td>f(x,y,z) = (<span style="border-top: 1px solid">x</span> v y) ^ z</td>
			<td>29.</td>
			<td>f(x,y,z) = (x v y) ^ (x v z)</td>
		</tr>
		<tr>
			<td>15.</td>
			<td>f(x,y,z) = (<span style="border-top: 1px solid">x</span> v y) ^ <span style="border-top: 1px solid">(z v z)</span></td>
			<td>30.</td>
			<td>f(x,y) = <span style="border-top: 1px solid">x</span> ^ y v <span style="border-top: 1px solid">x v y</span> v x</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', N'1');
GO
INSERT INTO [dbo].[CL_Individuals] ([AuthorID], [IndividualIndex], [DateCreated], [Title], [Content], [Page]) VALUES (N'Azelen', N'5', N'04.05.2013', N'Мінімізація булевих функцій. Таблиці Карно', N'<ol style="margin-left: 24px;">
	<li><em>Для таблично заданих булевих функцій трьох змінних утворити МДНФ і МКНФ (аналітично або за допомогою таблиць Карно), за отриманими формулами МДНФ та МКНФ побудувати логічні схеми.</em></li>
</ol>

<table style="margin-left:auto;margin-right:auto;">
	<tbody>
		<tr>
			<td width="100px">1.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td width="100px">2.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td width="100px">3.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td width="100px">4.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td width="100px">5.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td width="100px">6.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
			<td>7.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>8.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>9.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>10.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>11.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>12.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
			<td>13.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>14.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>15.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>16.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>17.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>18.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
			<td>19.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>20.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>21.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>22.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>23.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>24.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
			<td>25.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>26.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>27.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>28.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>29.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>30.
			<table border="1">
				<tbody>
					<tr>
						<td>x1</td>
						<td>x2</td>
						<td>x3</td>
						<td>y</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
	</tbody>
</table>
', N'1');
GO

-- ----------------------------
-- Table structure for [dbo].[CL_Labs]
-- ----------------------------
DROP TABLE [dbo].[CL_Labs]
GO
CREATE TABLE [dbo].[CL_Labs] (
[AuthorID] varchar(24) NULL ,
[LabIndex] int NOT NULL ,
[DateCreated] varchar(10) NULL ,
[Title] nvarchar(MAX) NULL ,
[Content] nvarchar(MAX) NULL ,
[Subtitle] nvarchar(MAX) NULL ,
[Page] int NOT NULL DEFAULT ((0)) 
)


GO

-- ----------------------------
-- Records of CL_Labs
-- ----------------------------
INSERT INTO [dbo].[CL_Labs] ([AuthorID], [LabIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'1', N'27.04.2013', N'Виконання арифметичних операцій у різних системах числення', N'<p align="center"><strong>Теоретичні відомості</strong></p>

<p><strong>Арифметичні операції у двійковій системі числення.</strong></p>

<p style="text-align: justify;">Для подання чисел та виконання над ними арифметичних операцій використовують спеціальні двійкові коди:&nbsp;<em>прямий, обернений&nbsp;</em>та&nbsp;<em>доповняльний (додатковий).</em>&nbsp;Числа зберігаються в прямому коді, а операції додавання та віднімання найчастіше виконують в додатковому коді.</p>

<p style="text-align: justify;"><em>Прямий код&nbsp;</em>числа подається у вигляді його абсолютного значення і коду знака. Код знака &quot;+&quot; - &quot;0&quot;, код знаку &quot;-&quot; - &quot;1&quot;.&nbsp; Найпростіше одержати прямий код двійкового числа за таким алгоритмом: &nbsp;якщо х &gt; 0, то замінити в ньому знак &quot;+&quot; знаком 0, якщо х &lt; 0, то замінити в ньому знак &quot;-&quot; знаком 1.</p>

<p style="text-align: justify;">Прямий код використовується в ЕОМ для зберігання додатних і від&rsquo;ємних чисел у запам&rsquo;ятовуючих пристроях, а також при виконанні операцій множення та ділення.</p>

<p style="text-align: justify;"><em style="line-height: 1.6em;">Обернений код&nbsp;</em><span style="line-height: 1.6em;">додатного двійкового числа співпадає з його прямим кодом.</span></p>

<p style="text-align: justify;"><strong style="line-height: 1.6em;"><em>Для того, щоб одержати обернений код від&#39;ємного цілого двійкового числа, необхідно:</em></strong></p>

<p style="margin-left: 18.25pt;"><em>1)&nbsp;</em><em>побудувати прямий код цього числа;</em></p>

<p style="margin-left: 18.25pt;"><em style="line-height: 1.6em;">2)&nbsp;</em><em style="line-height: 1.6em;">у цифровій частині одержаного коду замінити одинички на нулі, а нулі на одинички (інвертувати цифрову частину коду).</em></p>

<p style="text-align: justify;">В разі додавання двійкових чисел в оберненому коді, одиниця переносу в старший розряд додається до&nbsp;<span style="line-height: 1.6em;">наймолодшого розряду цифрової частини числа.</span></p>

<p style="text-align: justify;"><em style="line-height: 1.6em;">Доповняльний</em><span style="line-height: 1.6em;">&nbsp;</span><em style="line-height: 1.6em;">код</em><span style="line-height: 1.6em;">&nbsp;додатного двійкового числа співпадає з його прямим і оберненим кодом.</span></p>

<p style="text-align: justify;"><strong style="line-height: 1.6em;"><em>Для того, щоб одержати доповняльний код цілого від&#39;ємного двійкового числа, потрібно:</em></strong></p>

<p style="margin-left: 18.95pt;"><em>1)&nbsp;побудувати обернений код цього числа:</em></p>

<p style="margin-left: 18.95pt;"><em style="line-height: 1.6em;">2) до наймолодшого розряду цифрової частини оберненого коду додати одиницю.&nbsp;</em></p>

<p style="text-align: justify;">При використанні доповняльного (додаткового) коду одиниця переносу в старший розряд відкидається. Дію віднімання двійкових чисел в комп&#39;ютері замінюють операцією додавання їх доповняльних (обернених) кодів, виходячи зі співвідношення: х - у = х+(-у)</p>

<p><strong>Приклад:</strong></p>

<p style="text-align: justify;">Додамо двійкові числа X<strong>=111</strong>&nbsp;і&nbsp;<strong>Y= &ndash;110</strong>&nbsp;в оберненому і доповняльному кодах.</p>

<p style="margin-left: 24px;"><em>1) додамо числа за правилами двійкової арифметики:</em></p>

<p style="text-align: center;">X = 111</p>

<p style="text-align: center;">Y =&nbsp;<u>-11</u></p>

<p style="text-align: center;">X+Y = 100</p>

<p style="margin-left: 24px;"><em>2) додамо числа за допомогою кодів:</em></p>

<p style="text-align: center;"><img alt="" src="../Uploads/table_001.png" style="width: 452px; height: 113px;" /></p>

<p style="text-align: center;">&nbsp;</p>

<p align="center"><strong>Переведення чисел із однієї системи числення в іншу та виконання операцій над ними за допомогою програми&nbsp;</strong><strong>Калькулятор</strong><strong>.</strong></p>

<p style="text-align: justify;">Для переведення чисел в позиційних системах числення використовується стандартна програма операційної системи&nbsp;<strong>Windows &ndash; Калькулятор</strong>&nbsp;(<strong>інженерний вигляд</strong>). Це один із найпростіших способів переведення чисел із однієї системи числення в іншу. Для виклику програми необхідно&nbsp; в меню&nbsp;<strong>Пуск</strong>&nbsp;вибрати наступну послідовність команд&nbsp;<strong>Програми-Стандартні-Калькулятор</strong>&nbsp;<strong>(Программы-Стандартные Калькулятор)</strong>. При першому запуску програми, калькулятор з&rsquo;являється в режимі&nbsp;<strong>&laquo;Звичайний&raquo;</strong>&nbsp;<strong>(Обычный)</strong>. В цьому режимі він працює лише з десятковими числами. Для зручності роботи в різних системах числення, калькулятор необхідно перевести в режим&nbsp;<strong>&laquo;Інженерний&raquo; (Инженерный),&nbsp;</strong>вибравши в рядку меню програми Калькулятор команду&nbsp;<strong>Вигляд-Інженерний (Вид-Інженерный)&nbsp;</strong>(див. рис. 1)<strong>.</strong></p>

<p style="text-align: center;"><img alt="" src="../Uploads/img_001.png" /></p>

<p align="center"><strong>Рис. 1 &ndash; Вигляд вікна програми Калькулятор в режимі Інженерний</strong></p>

<p>Після вибору Інженерного режиму роботи вікно калькулятора відразу збільшиться і на ньому з&rsquo;являться ряд нових кнопок та інших елементів керування. Для роботи в різних системах числення з&rsquo;явиться відповідна панель, яка містить кнопки переходу від однієї системи числення до іншої:</p>

<p style="text-align: justify;"><strong><u>Hex</u></strong>&nbsp;&ndash; шістнадцяткова система числення (в цьому режимі активними стають літерні кнопки A, B, C, D, E, F)</p>
', N'Вдосконалити вміння розв’язувати практичні задачі, що стосуються арифметики в ЕОМ. Вміти представляти цілі двійкові числа зі знаком у прямому, оберненому та 		додатковому кодах; а також виконувати операції додавання двійкових чисел за допомогою кодів. Навчитися переводити числа із одної системи числення в іншу та виконувати операції із ними за допомогою стандартної програми MS Windows Калькулятор.', N'1');
GO
INSERT INTO [dbo].[CL_Labs] ([AuthorID], [LabIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'1', N'27.04.2013', N'Виконання арифметичних операцій у різних системах числення', N'<p align="center"><strong>Технології переведення чисел за допомогою програми Калькулятор:</strong></p>

<p style="text-align: justify;">Припустимо нам потрібно перевести число 243 із десяткової системи числення в двійкову. Переконавшись, що калькулятор знаходиться в режимі роботи з десятковими числами (вибрано кнопку <strong>Dec</strong>). В іншому випадку переводимо калькулятор в потрібний режим. Набираємо за допомогою цифрових клавіш калькулятора шукане число. Після цього, за допомогою маніпулятора мишки, переводимо, калькулятор в двійковий режим, обравши кнопку <strong>Bin</strong>. Відразу ж після цього на індикаторі калькулятора задане число відобразиться в двійковій формі (11110011).</p>

<p style="text-align: justify;">Таким чином можна відобразити відповідне число і в інших можливих системах числення (Hex і Oct). Для оберненого переведення, например із двійкової системи в десяткову, потрібно вибрати двійковий режим ( Bin ) калькулятора, потім набрати задане двійкове число, після чого слід вибрати десятковий режим ( Dec ) калькулятора.</p>

<p style="text-align: justify;">&nbsp;</p>

<p align="center"><strong>Хід роботи:</strong></p>

<div>
<p><strong><u>Завдання 1</u></strong><strong>. </strong>Виконати арифметичні дії віднімання, додавання і множення в десятковій і двійковій системі числення (перевівши десяткові числа в двійкові), (номер завдання відповідає номеру в списку) без використання програми Калькулятор.</p>

<p><strong><em><u>Варіанти завдань:</u></em></strong></p>
</div>

<table border="0" cellpadding="0" cellspacing="0" class="BodyTable">
	<tbody>
		<tr>
			<td><strong>1.</strong> 45 і 49</td>
			<td><strong>2.</strong> 46 і 38</td>
			<td><strong>3.</strong> 56 і 47</td>
			<td><strong>4.</strong> 92 і 78</td>
			<td><strong>5.</strong> 67 і 30</td>
			<td><strong>6.</strong> 77 і 60</td>
		</tr>
		<tr>
			<td><strong>7.</strong> 67 і 29</td>
			<td><strong>8.</strong> 97 і 49</td>
			<td><strong>9.</strong> 76 і 37</td>
			<td><strong>10.</strong> 76 і 47</td>
			<td><strong>11.</strong> 96 і 19</td>
			<td><strong>12.</strong> 59 і 11</td>
		</tr>
		<tr>
			<td><strong>13.</strong> 88 і 50</td>
			<td><strong>14.</strong> 51 і 38</td>
			<td><strong>15.</strong> 36 і 27</td>
			<td><strong>16.</strong> 78 і 25</td>
			<td><strong>17.</strong> 67 і 29</td>
			<td><strong>18.</strong> 49 і 43</td>
		</tr>
		<tr>
			<td><strong>19.</strong> 29 і 26</td>
			<td><strong>20.</strong> 70 і 21</td>
			<td><strong>21.</strong> 67 і 39</td>
			<td><strong>22.</strong> 39 і 25</td>
			<td><strong>23.</strong> 83 і 56</td>
			<td><strong>24.</strong> 47 і 38</td>
		</tr>
		<tr>
			<td><strong>25.</strong> 96 і 51</td>
			<td><strong>26.</strong> 48 і 23</td>
			<td><strong>27.</strong> 72 і 41</td>
			<td><strong>28.</strong> 73 і 40</td>
			<td><strong>29.</strong> 64 і 35</td>
			<td><strong>30.</strong> 75 і 37</td>
		</tr>
	</tbody>
</table>

<div>
<p style="text-align: justify;"><strong><u>Завдання 2</u></strong><strong>.</strong> Із таблиці 1, у відповідності з порядковим номером в журналі групи, вибрати значення чисел <strong>X</strong> і <strong>Y </strong>і представити їх відповідно в прямому, оберненому і додатковому кодах, а також отримати результат&nbsp;<span style="line-height: 1.6em;">додавання даних чисел в оберненому і додатковому кодах відповідно.</span></p>
</div>

<p style="text-align: justify;"><em>&nbsp;Для зображення обох чисел використати поле довжиною 1 байт (мати на увазі, що зображення знака числа відокремлюється від зображення значущої частини числа крапкою).</em></p>

<table align="center" border="0" cellpadding="0" cellspacing="0" class="BodyTable">
	<tbody>
		<tr>
			<td style="height:37px;">
			<p style="margin-left: 0.75pt;"><strong>№</strong></p>
			</td>
			<td style="height:37px;">
			<p><strong><em>X</em></strong></p>
			</td>
			<td style="height:37px;">
			<p style="margin-left: 0.75pt;"><strong><em>Y</em></strong></p>
			</td>
			<td style="height:37px;">
			<p style="margin-left: 0.75pt;"><strong>№</strong></p>
			</td>
			<td style="height:37px;">
			<p style="margin-left: 0.75pt;"><strong><em>X</em></strong></p>
			</td>
			<td style="height:37px;">
			<p style="margin-left: 0.75pt;"><strong><em>Y</em></strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>1</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-110111</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">110111</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>16</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">1101010</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-110110</p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>2</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-1010111</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">10111</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>17</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">000111</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-1110001</p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>3</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-1110110</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">101011</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>18</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-11111</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">110000</p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>4</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">101011</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-1011001</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>19</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">1001011</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-100110</p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>5</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">1111101</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-10111</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>20</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">01011</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-1011011</p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>6</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">100111</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-0111101</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>21</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-1011001</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">1100100</p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>7</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-1001111</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">100010</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>22</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">11011</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-1001011</p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>8</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">1001100</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-1101101</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>23</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-0111100</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">1101</p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>9</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-0111</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">100010</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>24</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">101110</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">10111</p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>10</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">10111</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-101110</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>25</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">1101101</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">1110</p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>11</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">1101011</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">100011</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>26</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">1111</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">1011101</p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>12</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-100011</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">111001</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>27</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">1001011</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">111101</p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>13</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-01110</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">111010</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>28</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">111011</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">100111</p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>14</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">110001</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">0110110</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>29</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">10111</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">101111</p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="margin-left: 0.75pt;"><strong>15</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">-10111</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">10011</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;"><strong>30</strong></p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">11011</p>
			</td>
			<td>
			<p style="margin-left: 0.75pt;">1100000</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', N'Вдосконалити вміння розв’язувати практичні задачі, що стосуються арифметики в ЕОМ. Вміти представляти цілі двійкові числа зі знаком у прямому, оберненому та 		додатковому кодах; а також виконувати операції додавання двійкових чисел за допомогою кодів. Навчитися переводити числа із одної системи числення в іншу та виконувати операції із ними за допомогою стандартної програми MS Windows Калькулятор.', N'2');
GO
INSERT INTO [dbo].[CL_Labs] ([AuthorID], [LabIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'1', N'27.04.2013', N'Виконання арифметичних операцій у різних системах числення', N'<p><strong><u>Завдання 3</u></strong><strong>. </strong>Перевести числа із однієї системи числення в іншу та виконати відповідні операції над ними за допомогою програми Калькулятор, відповідно до наступних кроків:</p>

<ol>
	<li style="margin-left: 24px;">Запустіть програму Калькулятор <strong>(Пуск-Програми-Стандартні-Калькулятор)</strong>.</li>
	<li style="margin-left: 24px;">В меню <strong>Вид (Вигляд)</strong> виберіть команду <strong>Инженерный</strong>.</li>
	<li style="margin-left: 24px;">Введіть число для перетворення, згідно завдань наведених нижче.</li>
	<li style="margin-left: 24px;">Виберіть систему числення, в яку його потрібно перетворити.</li>
</ol>

<p><strong><u>Hex</u></strong> &ndash; шістнадцяткова система числення</p>

<p><strong><u>Dec</u></strong> &ndash; десяткова система числення</p>

<p><strong><u>Oct</u></strong> &ndash; вісімкова система числення</p>

<p><strong><u>Bin</u></strong> &ndash; двійкова система числення</p>

<ol start="5">
	<li style="margin-left: 24px;">Виконайте наступні завдання:</li>
</ol>

<p><strong>Вправа №1:</strong> За допомогою Калькулятора перевести числа із одної системи числення в іншу:</p>

<ol>
	<li style="margin-left: 24px;"><span style="line-height: 1.6em;">125</span><sub style="line-height: 1.6em;">10&nbsp;</sub><span style="line-height: 1.6em;">= Х</span><sub style="line-height: 1.6em;">16&nbsp;</sub><span style="line-height: 1.6em;">= Х</span><sub style="line-height: 1.6em;">8&nbsp;</sub><span style="line-height: 1.6em;">= Х</span><sub style="line-height: 1.6em;">2</sub></li>
	<li style="margin-left: 24px;"><span style="line-height: 1.6em;">125</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=______</span><sub style="line-height: 1.6em;">16&nbsp;</sub><span style="line-height: 1.6em;">= __________</span><sub style="line-height: 1.6em;">8&nbsp;</sub><span style="line-height: 1.6em;">= _____________</span><sub style="line-height: 1.6em;">2</sub></li>
	<li style="margin-left: 24px;"><span style="line-height: 1.6em;">37</span><sub style="line-height: 1.6em;">8&nbsp;</sub><span style="line-height: 1.6em;">= Х</span><sub style="line-height: 1.6em;">2&nbsp;</sub><span style="line-height: 1.6em;">= Х</span><sub style="line-height: 1.6em;">10&nbsp;</sub><span style="line-height: 1.6em;">= Х</span><sub style="line-height: 1.6em;">16</sub></li>
	<li style="margin-left: 24px;"><span style="line-height: 1.6em;">37</span><sub style="line-height: 1.6em;">8&nbsp;</sub><span style="line-height: 1.6em;">= _____________</span><sub style="line-height: 1.6em;">2&nbsp;</sub><span style="line-height: 1.6em;">= ________</span><sub style="line-height: 1.6em;">10&nbsp;</sub><span style="line-height: 1.6em;">= ________</span><sub style="line-height: 1.6em;">16</sub></li>
	<li style="margin-left: 24px;"><span style="line-height: 1.6em;">10100101</span><sub style="line-height: 1.6em;">2&nbsp;</sub><span style="line-height: 1.6em;">= Х</span><sub style="line-height: 1.6em;">8&nbsp;</sub><span style="line-height: 1.6em;">= Х</span><sub style="line-height: 1.6em;">10&nbsp;</sub><span style="line-height: 1.6em;">= Х</span><sub style="line-height: 1.6em;">16</sub></li>
	<li style="margin-left: 24px;"><span style="line-height: 1.6em;">10100101</span><sub style="line-height: 1.6em;">2&nbsp;</sub><span style="line-height: 1.6em;">= ________</span><sub style="line-height: 1.6em;">8&nbsp;</sub><span style="line-height: 1.6em;">= _______</span><sub style="line-height: 1.6em;">10&nbsp;</sub><span style="line-height: 1.6em;">= ________</span><sub style="line-height: 1.6em;">16</sub></li>
	<li style="margin-left: 24px;"><span style="line-height: 1.6em;">FF</span><sub style="line-height: 1.6em;">16&nbsp;</sub><span style="line-height: 1.6em;">= X</span><sub style="line-height: 1.6em;">10&nbsp;</sub><span style="line-height: 1.6em;">= X</span><sub style="line-height: 1.6em;">8&nbsp;</sub><span style="line-height: 1.6em;">= X</span><sub style="line-height: 1.6em;">2</sub></li>
	<li style="margin-left: 24px;"><span style="line-height: 1.6em;">FF</span><sub style="line-height: 1.6em;">16&nbsp;</sub><span style="line-height: 1.6em;">=_______</span><sub style="line-height: 1.6em;">10&nbsp;</sub><span style="line-height: 1.6em;">= __________</span><sub style="line-height: 1.6em;">8&nbsp;</sub><span style="line-height: 1.6em;">= _____________</span><sub style="line-height: 1.6em;">2</sub></li>
</ol>

<p><strong>Вправа №2:</strong> Перевірити за допомогою Калькулятора справедливість рівностей, здійснивши переведення у відповідну систему числення:</p>

<ol>
	<li style="margin-left: 24px;">1650<sub>10</sub>=3162<sub>8 _________________________________</sub></li>
	<li style="margin-left: 24px;">11001110010<sub>2</sub>=3257<sub>8</sub>_______________________</li>
	<li style="margin-left: 24px;">EE8<sub>16</sub>=7350<sub>8</sub>_____________________________</li>
	<li style="margin-left: 24px;">571<sub>10</sub>=23B<sub>16</sub>______________________________</li>
	<li style="margin-left: 24px;">11111111<sub>2</sub>=256<sub>10</sub>__________________________</li>
	<li style="margin-left: 24px;">1CA<sub>16</sub>=110101001<sub>2</sub>________________________</li>
</ol>

<p><strong>Вправа №3:</strong> Виконати арифметичні операції над двійковими числами за допомогою Калькулятора:</p>

<ol>
	<li style="margin-left: 24px;">10111*11011 = _____________</li>
	<li style="margin-left: 24px;">10111+11011=_____________</li>
	<li style="margin-left: 24px;">10101*1010 = ______________</li>
	<li style="margin-left: 24px;">100011/101 = ______________</li>
</ol>

<p><strong>Вправа №4:</strong> Обчислити значення виразу за допомогою Калькулятора: (106<sub>8</sub> + 1E<sub>16</sub>) : 10<sub>2</sub>&nbsp;+ 50<sub>10</sub>&nbsp;= ________<sub>10</sub></p>

<p>&nbsp;</p>

<p><strong><u>4.</u></strong>&nbsp;Перевірити засвоєний на лабораторному занятті матеріал, проробивши відповідні тестові завдання:</p>

<ol>
	<li style="margin-left: 24px;"><strong>Спосіб запису чисел за допомогою певної кількості знаків називають:</strong></li>
</ol>

<p>а) системою числення; б) алфавітом; в) буквами; г) арифметикою.</p>

<ol start="2">
	<li style="margin-left: 24px;"><strong>Число, вибране</strong> <strong>для утворення системи числення, називають її </strong></li>
</ol>

<p>а) базою; б) основою; в) числом; г) показником.</p>

<ol start="3">
	<li style="margin-left: 24px;"><strong>Для того, щоб перевести _______число із деякої системи p в систему q необхідно _____ </strong>це число на основу системи <strong>q</strong> записану в цифрах системи <strong>p</strong>:</li>
</ol>

<p>а) ціле ділити; б) ціле множити; в) ціле додавати.</p>

<ol start="4">
	<li style="margin-left: 24px;"><strong>Системи числення поділяються на: </strong></li>
</ol>

<p>а) Сучасні та застарілі; б) Формальні та неформальні; в) буквенні та числові; г) позиційні та непозиційні</p>

<ol style="margin-left: 24px;">
	<li value="5"><strong>Яка система числення є найпоширенішою для подання чисел у пам&#39;яті комп&#39;ютера?</strong></li>
</ol>

<p>а) двійкова; б) вісімкова; в) тріскова; г) десяткова.</p>

<p><u><strong>5.</strong></u>&nbsp;Зробити висновки. Оформити звіт.&nbsp;</p>
', N'Вдосконалити вміння розв’язувати практичні задачі, що стосуються арифметики в ЕОМ. Вміти представляти цілі двійкові числа зі знаком у прямому, оберненому та 		додатковому кодах; а також виконувати операції додавання двійкових чисел за допомогою кодів. Навчитися переводити числа із одної системи числення в іншу та виконувати операції із ними за допомогою стандартної програми MS Windows Калькулятор.', N'3');
GO
INSERT INTO [dbo].[CL_Labs] ([AuthorID], [LabIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'2', N'28.04.2013', N'Спрощення логічних виразів. Логічні елементи і найпростіші комбінаційні схеми. Побудова найпростіших комбінаційних схем на основі базових логічних  елементів,  а  також інструментальних засобів цифрової  частини  програмного пакету «Конструктор логічних схем для Windows», версія 1.12.', N'<div>
<p align="center" style="margin-left:18.0pt;"><strong>Теоретичні відомості</strong></p>

<p style="text-align: justify;">Математичний апарат, який описує дії дискретних пристроїв, базується на алгебрі логіки, її ще називають по імені автора &ndash; англійського математика Джорджа Буля (1815 &ndash; 1864) <strong><em>булевою алгеброю</em></strong>. Практичне застосування алгебри логіки першим знайшов американський вчений Клод Шеннон у 1938 р. при дослідженні електричних кіл з контактними вимикачами. Для формального опису цифрових&nbsp;<span style="line-height: 1.6em;">автоматів використовується апарат алгебри логіки.</span></p>
</div>

<p style="text-align: justify;"><strong><em>Логічною (булевою) змінною</em></strong> називається величина, яка може приймати тільки два значення <strong>0 </strong>і <strong>1</strong>. Сукупність різних значень змінних називаються набором.</p>

<p style="text-align: justify;"><em>Булевою функцією, </em><em>називається така</em> <em>функція, значення та кожен аргумент якої можуть дорівнювати одному з двох чисел: 0 або 1.</em></p>

<p style="text-align: justify;"><em>Основними булевими функціями </em>є: заперечення (операція <strong>НЕ</strong>, <em>інверсія</em>), диз&rsquo;юнкція (операція <strong>АБО</strong>, логічне додавання, об&rsquo;єднання) і кон&rsquo;юнкція (операція <strong>І</strong>, логічне множення).</p>

<p style="text-align: justify;"><em><u>Булеву функцію можна задати двома основними способами: </u></em></p>

<ol style="margin-left: 24px;">
	<li style="text-align: justify;">Через булеві вирази; булевий вираз визначає явну формулу, за якою можна обчислити функцію при даних значеннях змінних;</li>
	<li style="text-align: justify;">За допомогою таблиці істинності; таблиця істинності - це таблиця, яка ставить у відповідність кожній комбінації аргументів певне значення.</li>
</ol>

<p style="text-align: justify;">Важливе значення мають <em>правила перетворень для булевих виразів або Закони алгебри логіки</em><em>, за допомогою яких можна спрощувати булеві вирази.</em></p>

<p style="text-align: center;"><strong>Закони алгебри логіки (Таблиця 1)</strong></p>

<table cellpadding="0" cellspacing="0" class="BodyTable">
	<tbody>
		<tr>
			<td><strong>№</strong></td>
			<td><strong>Закон</strong></td>
			<td><strong>для АБО</strong></td>
			<td><strong>для І</strong></td>
		</tr>
		<tr>
			<td>1.</td>
			<td>комутативності&nbsp;</td>
			<td>x v y = y v x</td>
			<td>x&nbsp;&middot; y = y&nbsp;&middot; x</td>
		</tr>
		<tr>
			<td>2.</td>
			<td>асоціативності</td>
			<td>x v (y v z) = (x v y) v z</td>
			<td>x&nbsp;&middot; (y&nbsp;&middot; z) = (x&nbsp;&middot; y)&nbsp;&middot; z</td>
		</tr>
		<tr>
			<td>3.</td>
			<td>дистрибутивності</td>
			<td>x&nbsp;&middot; (y v z) = x&nbsp;&middot; y v x&nbsp;&middot; z</td>
			<td>x v (y&nbsp;&middot; z) = (x v y)&nbsp;&middot; (x v z)</td>
		</tr>
		<tr>
			<td>4.</td>
			<td>де Моргана</td>
			<td><span style="border-top: solid 1px">x v y</span> = <span style="border-top: solid 1px">y</span> &nbsp;&middot; <span style="border-top: solid 1px">x</span></td>
			<td><span style="border-top: solid 1px">x &nbsp;&middot; y</span> = <span style="border-top: solid 1px">y</span> v <span style="border-top: solid 1px">x</span></td>
		</tr>
		<tr>
			<td>5.</td>
			<td>повторення</td>
			<td>x v x = x</td>
			<td>x&nbsp;&middot; x = x</td>
		</tr>
		<tr>
			<td>6.</td>
			<td>поглинання</td>
			<td>x v (x&nbsp;&middot; y) = x</td>
			<td>x&nbsp;&middot; (x v y) = x</td>
		</tr>
		<tr>
			<td>7.</td>
			<td>зклеювання</td>
			<td>(x&nbsp;&middot; y) v (<span style="border-top: solid 1px">x</span>&nbsp;&middot; y) = y</td>
			<td>(x v y)&nbsp;&middot; (<span style="border-top: solid 1px">x</span> v y) = y</td>
		</tr>
		<tr>
			<td>8.</td>
			<td>нуля та одиниці</td>
			<td>x v <span style="border-top: solid 1px">x</span> = 1</td>
			<td>x&nbsp;&middot; <span style="border-top: solid 1px">x</span> = 0</td>
		</tr>
		<tr>
			<td>9.</td>
			<td>нуля та одиниці</td>
			<td>x v 0 = x; x v 1 = 1</td>
			<td>x v 1 = x; x&nbsp;&middot; 0 = 0</td>
		</tr>
		<tr>
			<td>10.</td>
			<td>подвійного заперечення</td>
			<td><span style="border-top: double">x</span> = x</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>11.</td>
			<td>протиріччя</td>
			<td>&nbsp;</td>
			<td>x ^ x = 0</td>
		</tr>
		<tr>
			<td>12.</td>
			<td>виключення третього</td>
			<td>x v <span style="border-top: solid 1px">x</span></td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p>Розглянемо приклади спрощення логічних виразів на основі законів алгебри логіки (див. таблиця 1).</p>

<p><strong>Приклад 1:</strong></p>

<p><span style="border-top: solid 1px">x v y</span>&nbsp;&middot; (x&nbsp;&middot;<span style="border-top: solid 1px">y</span>) = <span style="border-top: solid 1px">x</span>&nbsp;&middot; <span style="border-top: solid 1px">y</span>&nbsp;&middot; (x&nbsp;&middot; <span style="border-top: solid 1px">y</span>) = <span style="border-top: solid 1px">x</span>&nbsp;&middot; x&nbsp;&middot; <span style="border-top: solid 1px">y</span>&nbsp;&middot; <span style="border-top: solid 1px">y</span> = 0&nbsp;&middot; <span style="border-top: solid 1px">y</span>&nbsp;&middot; <span style="border-top: solid 1px">y</span> = 0&nbsp;&middot; <span style="border-top: solid 1px">y</span> = 0</p>

<p><strong>Примітка. </strong>В даному прикладі закони алгебри логіки використовуються в наступній послідовності: правило де Моргана, асоціативний закон, закони нуля та одиниці.&nbsp;</p>

<p><strong>Приклад 2:</strong></p>

<p><span style="border-top: solid 1px">x</span>&nbsp;&middot; y v <span style="border-top: solid 1px">x v y</span> v x = <span style="border-top: solid 1px">x</span>&nbsp;&middot; y v <span style="border-top: solid 1px">x</span>&nbsp;&middot; <span style="border-top: solid 1px">y</span> v x = <span style="border-top: solid 1px">x</span>&nbsp;&middot; (y v <span style="border-top: solid 1px">y</span>) v x = <span style="border-top: solid 1px">x</span>&nbsp;v x = 1</p>

<p><strong>Примітка. </strong>В даному випадку застосовується правило де Моргана, виносяться за дужки спільний множник, використовується правило операцій змінної з її запереченням.</p>

<p>Розглянуті нами булева алгебра і булева функція використовуються для аналізу та синтезу логічних схем. Основною складовою логічних схем є набір логічних елементів. Логічний елемент - це електронний пристрій, що реалізує одну з логічних функцій. &nbsp;Кожний логічний елемент реалізує деяку булеву функцію. Його вхід відповідає булевим змінним, а вихід &ndash; значенню функції.</p>

<p><em>Графічне зображення</em> <em>основних логічних елементів</em><em>:</em></p>

<p style="text-align: center;"><em><img alt="" src="../Uploads/img_008.png" /></em></p>
', N'Вивчення основних законів алгебри логіки та їх доведення з використанням логічних елементів І, АБО, НЕ. Навчитися спрощувати логічні вирази на основі законів алгебри логіки. Набути навичок побудови найпростіших комбінаційних схем на основі базових логічних елементів.', N'1');
GO
INSERT INTO [dbo].[CL_Labs] ([AuthorID], [LabIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'2', N'28.04.2013', N'Спрощення логічних виразів. Логічні елементи і найпростіші комбінаційні схеми. Побудова найпростіших комбінаційних схем на основі базових логічних  елементів,  а  також інструментальних засобів цифрової  частини  програмного пакету «Конструктор логічних схем для Windows», версія 1.12.', N'<h1 align="center"><strong><span style="font-size: 14px;">Хід роботи</span></strong></h1>

<ol style="margin-left: 24px;">
	<li>На основі побудови таблиць істинності дослідити закони алгебри логіки (див. таблиця 1).&nbsp;</li>
</ol>

<ul>
	<li>Завдання виконуються згідно варіанту (номер варіанту &ndash; номер у списку підгрупи):</li>
</ul>

<p><strong><em><u>Варіанти завдань:</u></em></strong></p>

<table class="BodyTable">
	<tbody>
		<tr>
			<td style="text-align: center;"><strong>№ варіанту</strong></td>
			<td style="text-align: center;"><strong>№ закону в таблиці 1</strong></td>
			<td style="text-align: center;"><strong>№ варіанту</strong></td>
			<td style="text-align: center;"><strong>№ закону в таблиці 1</strong></td>
		</tr>
		<tr>
			<td style="text-align: center;">1</td>
			<td style="text-align: center;">1,6,10</td>
			<td style="text-align: center;">2</td>
			<td style="text-align: center;">2,7,11</td>
		</tr>
		<tr>
			<td style="text-align: center;">3</td>
			<td style="text-align: center;">3,8,12</td>
			<td style="text-align: center;">4</td>
			<td style="text-align: center;">4,9,5</td>
		</tr>
		<tr>
			<td style="text-align: center;">5</td>
			<td style="text-align: center;">5,10,1</td>
			<td style="text-align: center;">6</td>
			<td style="text-align: center;">6,11,2</td>
		</tr>
		<tr>
			<td style="text-align: center;">7</td>
			<td style="text-align: center;">7,12,3</td>
			<td style="text-align: center;">8</td>
			<td style="text-align: center;">8,1,12</td>
		</tr>
		<tr>
			<td style="text-align: center;">9</td>
			<td style="text-align: center;">8,2,11</td>
			<td style="text-align: center;">10</td>
			<td style="text-align: center;">9,3,10</td>
		</tr>
		<tr>
			<td style="text-align: center;">11</td>
			<td style="text-align: center;">10,4,11</td>
			<td style="text-align: center;">12</td>
			<td style="text-align: center;">11,5,12</td>
		</tr>
		<tr>
			<td style="text-align: center;">13</td>
			<td style="text-align: center;">12,6,1</td>
			<td style="text-align: center;">14</td>
			<td style="text-align: center;">1,12,11</td>
		</tr>
		<tr>
			<td style="text-align: center;">15</td>
			<td style="text-align: center;">2,11,10</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<ol start="2" style="margin-left: 24px;">
	<li>Спросити логічний вираз і побудувати таблицю істинності &nbsp;для неї (номер варіанту &ndash; номер у списку підгрупи):</li>
</ol>

<p><strong><em><u>Варіанти завдань:</u></em></strong></p>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td style="text-align: center;"><strong>№ варіанту</strong></td>
			<td style="text-align: center;"><strong>Завдання</strong></td>
			<td style="text-align: center;"><strong>№ варіанту</strong></td>
			<td style="text-align: center;"><strong>Завдання</strong></td>
		</tr>
		<tr>
			<td style="text-align: center;">1</td>
			<td>A ^&nbsp;<span style="border-top-width: 1px; border-top-style: solid;">B</span>&nbsp;^ C v A v B v&nbsp;<span style="border-top-width: 1px; border-top-style: solid;">C</span>&nbsp;=&nbsp;</td>
			<td style="text-align: center;">2</td>
			<td><span style="border-top-width: 1px; border-top-style: solid;">A</span>&nbsp;v C v&nbsp;<span style="border-top-width: 1px; border-top-style: solid;">A ^ B</span>&nbsp;=&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">3</td>
			<td><span style="border-top-width: 1px; border-top-style: solid;">A v C</span>&nbsp;^&nbsp;<span style="border-top-width: 1px; border-top-style: solid;">A</span>&nbsp;v B =&nbsp;</td>
			<td style="text-align: center;">4</td>
			<td><span style="border-top-width: 1px; border-top-style: solid;">A</span>&nbsp;^ B v&nbsp;<span style="border-top-width: 1px; border-top-style: solid;">A v B</span>&nbsp;=&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">5</td>
			<td>A ^ (<span style="border-top-width: 1px; border-top-style: solid;">B ^ C v&nbsp;<span style="border-top-style: double;">A</span></span>) =&nbsp;</td>
			<td style="text-align: center;">6</td>
			<td><span style="border-top-width: 1px; border-top-style: solid;">A v C</span>&nbsp;v&nbsp;<span style="border-top-width: 1px; border-top-style: solid;">A</span>&nbsp;^ B =&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">7</td>
			<td><span style="border-top-width: 1px; border-top-style: solid;">A v C</span>&nbsp;v&nbsp;<span style="border-top-width: 1px; border-top-style: solid;">A ^ B</span>&nbsp;=&nbsp;</td>
			<td style="text-align: center;">8</td>
			<td>A ^ (<span style="border-top-width: 1px; border-top-style: solid;">B v C ^&nbsp;<span style="border-top-style: double;">A</span></span>) =&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">9</td>
			<td>A ^ B v&nbsp;<span style="border-top-width: 1px; border-top-style: solid;">B</span>&nbsp;v&nbsp;<span style="border-top-width: 1px; border-top-style: solid;">A</span>&nbsp;^ C =&nbsp;</td>
			<td style="text-align: center;">10</td>
			<td>(<span style="border-top-width: 1px; border-top-style: solid;">B v A</span>) v (<span style="border-top-width: 1px; border-top-style: solid;">B v&nbsp;<span style="border-top-style: double;">A</span></span>) =&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">11</td>
			<td>A v&nbsp;<span style="border-top-width: 1px; border-top-style: solid;">B</span>&nbsp;v C ^ (A v&nbsp;<span style="border-top-width: 1px; border-top-style: solid;">C</span></td>
			<td style="text-align: center;">12</td>
			<td>A ^ (<span style="border-top-width: 1px; border-top-style: solid;">B ^ C v&nbsp;<span style="border-top-style: double;">A</span></span>) =&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">13</td>
			<td>(<span style="border-top-width: 1px; border-top-style: solid;">B v A</span>) v (<span style="border-top-width: 1px; border-top-style: solid;">B v&nbsp;<span style="border-top-style: double;">B</span></span>) =&nbsp;</td>
			<td style="text-align: center;">14</td>
			<td>A ^ B ^&nbsp;<span style="border-top-width: 1px; border-top-style: solid;">C</span>&nbsp;v A v B =&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">15</td>
			<td>A ^ B v&nbsp;<span style="border-top-width: 1px; border-top-style: solid;">A</span>&nbsp;v C ^&nbsp;<span style="border-top-width: 1px; border-top-style: solid;">A</span>&nbsp;=&nbsp;</td>
			<td style="text-align: center;">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<div>
<ol start="3" style="margin-left: 24px;">
	<li>Користуючись інструментальними засобами цифрової&nbsp; частини&nbsp; програмного пакету &laquo;Конструктор логічних схем для Windows&raquo;, версія 1.12. на основі базових логічних елементів побудувати комбінаційні схеми, (номер варіанту &ndash; номер у списку підгрупи) та&nbsp;проаналізувавши відповідну&nbsp; комбінаційну схему побудувати на основі неї відповідний їй логічний вираз.</li>
</ol>

<p style="text-align: center;"><img alt="" src="/Uploads/img_010.png" /></p>

<p style="text-align: center;"><img alt="" src="../Uploads/img_011.png" /></p>

<p style="text-align: center;"><img alt="" src="../Uploads/img_012.png" /></p>
</div>
', N'Вивчення основних законів алгебри логіки та їх доведення з використанням логічних елементів І, АБО, НЕ. Навчитися спрощувати логічні вирази на основі законів алгебри логіки. Набути навичок побудови найпростіших комбінаційних схем на основі базових логічних елементів.', N'2');
GO
INSERT INTO [dbo].[CL_Labs] ([AuthorID], [LabIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'2', N'28.04.2013', N'Спрощення логічних виразів. Логічні елементи і найпростіші комбінаційні схеми. Побудова найпростіших комбінаційних схем на основі базових логічних  елементів,  а  також інструментальних засобів цифрової  частини  програмного пакету «Конструктор логічних схем для Windows», версія 1.12.', N'<ul style="margin-left: 24px;">
	<li>Порядок побудови логічних схем на основі програмного пакету &laquo;Конструктор логічних схем для Windows&raquo;, версія 1.12:</li>
</ul>

<p><img alt="" src="../Uploads/img_002.png" style="width: 66px; height: 300px; float: left;" /></p>

<ul style="margin-left: 96px;">
	<li>Завантажити &laquo;Конструктор логічних схем для Windows&raquo;.</li>
	<li>Зібрати задану схему за допомогою програми &laquo;Конструктор логічних схем для Windows&raquo;.</li>
	<li>&nbsp;Командою <strong>Файл-Новий</strong>, відкрити вікно програми, у якому зліва, розміщена панель інструментів, яка містить відповідні логічні елементи та лінії необхідні для їх з&rsquo;єднання у схему.</li>
	<li><img alt="" src="../Uploads/img_003.png" style="opacity: 0.9; width: 198px; height: 100px; float: right;" />Користуючись відповідними інструментами програми, зібрати логічну схему.</li>
	<li>Зберегти зібрану схему (<strong>Файл-Сохранить как</strong>). В результаті з&rsquo;явиться вікно діалогу, в яке слід ввести потрібну назву.</li>
	<li>Перевірити правильність побудови логічної схеми, за допомогою команди меню <strong>Конструктор-Контроль</strong>.</li>
</ul>

<p>В цьому випадку з&rsquo;являться логічні сигнали &laquo;0&raquo; та &laquo;1&raquo;, змінюючи, які можна знаходити.&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<ol start="4" style="margin-left: 24px;">
	<li>По заданому логічному виразу побудувати комбінаційну схему і знайти значення логічних елементів на виході схеми (номер варіанту &ndash; номер у списку підгрупи):</li>
</ol>

<p><strong><em><u>Варіанти завдань:</u></em></strong></p>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td style="text-align: center;"><strong>№ варіанту</strong></td>
			<td style="text-align: center;"><strong>Завдання</strong></td>
			<td style="text-align: center;"><strong>№ варіанту</strong></td>
			<td style="text-align: center;"><strong>Завдання</strong></td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td><em>f(x,y) = <span style="border-top: 1px solid">x ^ y</span></em></td>
			<td style="text-align: center;">2.</td>
			<td><em>f(x,y,z) = <span style="border-top: 1px solid">z ^ y v x</span> v z&nbsp;</em></td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>f(x,y) = x v (y ^ z)</td>
			<td style="text-align: center;">4.</td>
			<td>f(x,y,z) = (x v y) ^ (x v z)</td>
		</tr>
		<tr>
			<td style="text-align: center;">5.</td>
			<td>f(x,y,z) = (x ^ <span style="border-top: 1px solid">y</span>) v z</td>
			<td style="text-align: center;">6.</td>
			<td>f(x,y) = x ^ y v x v y v x</td>
		</tr>
		<tr>
			<td style="text-align: center;">7.</td>
			<td>f(x,y) = <span style="border-top: 1px solid">x v y</span> ^ (x ^ <span style="border-top: 1px solid">y</span>)</td>
			<td style="text-align: center;">8.</td>
			<td>f(x,y,z) = (<span style="border-top: 1px solid">x</span> v y) ^ z</td>
		</tr>
		<tr>
			<td style="text-align: center;">9.</td>
			<td>f(x,y,z) = (<span style="border-top: 1px solid">x</span> v y) ^ (<span style="border-top: 1px solid">z v z</span>)</td>
			<td style="text-align: center;">10.</td>
			<td>f(x,y,z) = x ^ y ^ z v x ^ <span style="border-top: 1px solid">y</span> ^ <span style="border-top: 1px solid">z</span></td>
		</tr>
		<tr>
			<td style="text-align: center;">11.</td>
			<td>f(x,y,z) = x ^ y ^ z v x ^ <span style="border-top: 1px solid">y</span> ^ <span style="border-top: 1px solid">z</span> v <span style="border-top: 1px solid">x</span> v <span style="border-top: 1px solid">y</span></td>
			<td style="text-align: center;">12.</td>
			<td>f(x<sub>1</sub>x<sub>2</sub>x<sub>3</sub>) = x<sub>1</sub>x<sub>2</sub>x<sub>3</sub> v&nbsp;x<sub>1</sub>x<sub>2</sub><span style="border-top: 1px solid">x<sub>3</sub></span>&nbsp;v&nbsp;<span style="border-top: 1px solid">x<sub>1</sub></span>x<sub>2</sub><span style="border-top: 1px solid">x<sub>3</sub></span></td>
		</tr>
		<tr>
			<td style="text-align: center;">13.</td>
			<td>f(x<sub>1</sub>x<sub>2</sub>x<sub>3</sub>) = (x<sub>1</sub> v <span style="border-top: 1px solid">x<sub>2</sub></span>) v (x<sub>2</sub>&nbsp;^ <span style="border-top: 1px solid">x<sub>3</sub></span>)</td>
			<td style="text-align: center;">14.</td>
			<td>f(x<sub>1</sub>x<sub>2</sub>x<sub>3</sub>) = (<span style="border-top: 1px solid">x<sub>1</sub> v <span style="border-top: double">x<sub>2</sub></span></span>) v (x<sub>2</sub>&nbsp;^ <span style="border-top: 1px solid">x<sub>3</sub></span>)</td>
		</tr>
		<tr>
			<td style="text-align: center;">15.</td>
			<td>f(x<sub>1</sub>x<sub>2</sub>x<sub>3</sub>) = (<span style="border-top: 1px solid">x<sub>1</sub>&nbsp;v <span style="border-top: double">x<sub>2</sub></span></span>) v (<span style="border-top: 1px solid">x<sub>2</sub> ^ <span style="border-top: double">x<sub>3</sub></span></span>)</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<ol start="5" style="margin-left: 24px;">
	<li>Перевірити засвоєний на лабораторному занятті матеріал, проробивши відповідні тестові завдання:</li>
</ol>

<p>&nbsp;</p>

<p align="center" style="margin-left:3.7pt;"><strong>Тестові завдання</strong> <strong>для самоконтролю</strong></p>

<p align="center" style="margin-left:3.7pt;"><em>(в</em><em>иберіть найбільш правильну відповідь</em><em>)</em></p>

<p><strong style="line-height: 1.6em;">1.</strong><span style="line-height: 1.6em;"> </span><strong style="line-height: 1.6em;">Операція логічного множення в булевій алгебрі має назву:</strong></p>

<p style="margin-left: 24px;">а) інверсія;&nbsp;б) диз&rsquo;юнкція;&nbsp;в) кон&rsquo;юнкція;&nbsp;г) імплікація.</p>

<p><strong>2. Яке із позначень не використовується для інверсії:</strong></p>

<p style="margin-left: 24px;">а) НЕ;&nbsp; б)&brvbar;;&nbsp; в) &not;;&nbsp;&nbsp;&nbsp; г) NOT.</p>

<p><strong style="line-height: 1.6em;">3</strong><strong style="line-height: 1.6em;">. </strong><strong style="line-height: 1.6em;">Як</strong><strong style="line-height: 1.6em;"> інакше називається операція логічного заперечення?</strong></p>

<p style="margin-left: 24px;">а) імплікація;&nbsp; б) диз&rsquo;юнкція;&nbsp; в) кон&rsquo;юнкція; &nbsp;г) інверсія.</p>

<p><strong>4.&nbsp; Яким значком позначається диз&rsquo;юнкція?</strong></p>

<p style="margin-left: 24px;">а) ^;&nbsp; &nbsp; б) ~;&nbsp;&nbsp;&nbsp; в) v; &nbsp;&nbsp;&nbsp; &nbsp;г) &rarr;.</p>

<p><strong style="line-height: 1.6em;">5.</strong><span style="line-height: 1.6em;"> </span><strong style="line-height: 1.6em;">Таблиця істинності &ndash; це:</strong></p>

<p style="margin-left: 24px;">а) таблиця з невірними значеннями;</p>

<p style="margin-left: 24px;">б) результат математичних обчислень;</p>

<p style="margin-left: 24px;">в) таблиця значень логічних схем;</p>

<p style="margin-left: 24px;">г) інверсія таблиці хибності.</p>

<ol start="6" style="margin-left: 24px;">
	<li>Зробити висновки. Оформити звіт.&nbsp;</li>
</ol>

<p>&nbsp;</p>
', N'Вивчення основних законів алгебри логіки та їх доведення з використанням логічних елементів І, АБО, НЕ. Навчитися спрощувати логічні вирази на основі законів алгебри логіки. Набути навичок побудови найпростіших комбінаційних схем на основі базових логічних елементів.', N'3');
GO
INSERT INTO [dbo].[CL_Labs] ([AuthorID], [LabIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'3', N'29.04.2013', N'Знаходження МДНФ та МКНФ. Синтез логічних пристроїв', N'<p align="center" style="margin-left:18.0pt;"><strong>Теоретичні відомості</strong></p>

<p style="text-align: justify;">Для запису однієї i тієї ж функції алгебри логіки існує багато різних форм, але найбільш прийнятними, з міркувань зручності, <em>є дві канонічні форми зображення логічних функцій</em>: досконала диз&#39;юнктивна нормальна форма <strong>(ДДНФ)</strong> i досконала кон&#39;юнктива нормальна форма <strong>(ДКНФ).</strong></p>

<p style="text-align: justify;"><em>ДДНФ булевої функції</em> називається формула, що зображена у вигляді диз&rsquo;юнкції елементарних кон&rsquo;юнцій, при яких дана функція приймає значення 1.</p>

<p style="text-align: justify;"><em>ДКНФ</em><em> булевої функції</em> називається формула, що зображена у вигляді кон&rsquo;юнкції елементарних диз&rsquo;юнцій, при яких дана функція приймає значення 1.</p>

<p style="text-align: justify;">ДДНФ (ДКНФ) функції називається <strong><em>мінімальною</em></strong>, якщо кількість символів, які вона містить, буде не більшою, ніж у будь-якої іншої ДДНФ (ДКНФ) тієї самої функції.</p>

<p style="text-align: justify;">У багатьох випадках вдається так спростити логічний вираз, не порушуючи функції, що відповідна структурна схема виходить істотно простішою.</p>

<p style="text-align: justify;">Методи такого спрощення функції називають <em>методами мiнiмiзацiї логічних функцій</em>.</p>

<p style="text-align: justify;">Функції, які внаслідок цього утворюються уже називаються <strong>МДНФ</strong> і <strong>МКНФ</strong>.</p>

<p style="text-align: justify;"><em>Існує декілька способів мінімізації складних висловлювань</em>.</p>

<p style="text-align: justify;">Найпоширеніші із них:</p>

<ul style="margin-left: 48px;">
	<li style="text-align: justify;">метод Квайна;</li>
	<li style="text-align: justify;">карти Вейча;</li>
	<li style="text-align: justify;">мінімізуючі карти Карно.</li>
</ul>

<p style="text-align: justify;">Карта Карно для булевих функцій є аналогом таблиці істинності, зображеної у спеціальній формі. Значення змінних розташовані в заголовках рядків і стовпців карти. Нуль або одиниця в клітці визначає значення функції на даній інтерпретації.</p>

<p style="text-align: justify;">У картах Карно інтерпретації двох змінних розташовуються у такій послідовності: (0, 0), (0, 1), (1, 1), (1, 0).</p>

<p style="text-align: center;"><em>Карта Карно для двох змінних має вигляд:</em></p>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td style="text-align: center;">&nbsp;</td>
			<td style="text-align: center;"><span style="border-top: 1px solid">x</span> (0) &nbsp;&nbsp;</td>
			<td style="text-align: center;">x (1) &nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td><span style="border-top: 1px solid">y</span> (0) &nbsp; &nbsp;</td>
			<td>00<sub>0</sub></td>
			<td>10<sub>2</sub></td>
		</tr>
		<tr>
			<td>y (1)</td>
			<td>01<sub>1</sub></td>
			<td>11<sub>3</sub></td>
		</tr>
	</tbody>
</table>

<p style="text-align: center;"><em>Карта Карно для трьох змінних набуває вигляду:</em></p>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td style="text-align: center;">&nbsp;</td>
			<td style="text-align: center;">xy</td>
			<td style="text-align: center;">xy</td>
			<td style="text-align: center;">xy</td>
			<td style="text-align: center;">xy</td>
		</tr>
		<tr>
			<td>z (0) &nbsp; &nbsp;</td>
			<td style="text-align: center;">000<sub>0</sub></td>
			<td style="text-align: center;">010<sub>2</sub></td>
			<td style="text-align: center;">110<sub>6</sub></td>
			<td style="text-align: center;">100<sub>4</sub></td>
		</tr>
		<tr>
			<td>z (1)</td>
			<td style="text-align: center;">001<sub>1</sub></td>
			<td style="text-align: center;">011<sub>3</sub></td>
			<td style="text-align: center;">111<sub>7</sub></td>
			<td style="text-align: center;">101<sub>5</sub>?</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<h1 align="center"><strong><span style="font-size:14px;">Хід роботи</span></strong></h1>

<ol style="margin-left: 24px;">
	<li style="text-align: justify;">Для відповідного варіанту (номер у списку підгрупи) побудувати таблицю істинності. Утворити ДДНФ та ДКНФ. За ДДНФ побудувати карту Карно та утворити МДНФ і МКНФ. До утвореної (мінімізованої) функції побудувати функціональну схему (номер варіанту &ndash; номер у списку підгрупи).</li>
</ol>

<p><strong><em><u>Варіанти завдань:</u></em></strong></p>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td style="text-align: center;"><strong>№ варіанту</strong></td>
			<td style="text-align: center;"><strong>Завдання</strong></td>
			<td style="text-align: center;"><strong>№ варіанту</strong></td>
			<td style="text-align: center;"><strong>Завдання</strong></td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>(xy v <span style="border-top: 1px solid">yz</span>)&nbsp;&hArr; (xz v y)</td>
			<td style="text-align: center;">2.</td>
			<td>(<span style="border-top: 1px solid">x</span>y v z)&nbsp;&hArr; (zy v x)</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>(<span style="border-top: 1px solid">xz</span> v y) (<span style="border-top: 1px solid">xz</span> v y<span style="border-top: 1px solid">z</span>)</td>
			<td style="text-align: center;">4.</td>
			<td>(xz v xy) (xz v <span style="border-top: 1px solid">y</span>z)</td>
		</tr>
		<tr>
			<td style="text-align: center;">5.</td>
			<td>(<span style="border-top: 1px solid">x</span> v y v z) (xz v <span style="border-top: 1px solid">y</span>z)</td>
			<td style="text-align: center;">6.</td>
			<td>(<span style="border-top: 1px solid">x</span>z v y) (x v y v z)</td>
		</tr>
		<tr>
			<td style="text-align: center;">7.</td>
			<td>(xy v z)&nbsp;&rArr; (x<span style="border-top: 1px solid">y</span> v z)</td>
			<td style="text-align: center;">8.</td>
			<td>(x<span style="border-top: 1px solid">z</span> v yz) (x<span style="border-top: 1px solid">z</span> v y)</td>
		</tr>
		<tr>
			<td style="text-align: center;">9.</td>
			<td>(xz v y) (x<span style="border-top: 1px solid">y</span> v z)</td>
			<td style="text-align: center;">10.</td>
			<td>(<span style="border-top: 1px solid">x</span>z v y)&nbsp;&rArr; (z<span style="border-top: 1px solid">y</span> v x)</td>
		</tr>
		<tr>
			<td style="text-align: center;">11.</td>
			<td>(<span style="border-top: 1px solid">x</span> v y v z)&nbsp;&hArr; (<span style="border-top: 1px solid">xy</span> v xz)</td>
			<td style="text-align: center;">12.</td>
			<td>(<span style="border-top: 1px solid">x</span> v y v <span style="border-top: 1px solid">z</span>)&nbsp;&hArr; (<span style="border-top: 1px solid">zy</span> v x)</td>
		</tr>
		<tr>
			<td style="text-align: center;">13.</td>
			<td>(<span style="border-top: 1px solid">xy</span> v z)&nbsp;&hArr; (xy v <span style="border-top: 1px solid">z</span>)</td>
			<td style="text-align: center;">14.</td>
			<td>(<span style="border-top: 1px solid">x</span> v <span style="border-top: 1px solid">y</span> v z) (x<span style="border-top: 1px solid">y</span> v z)</td>
		</tr>
		<tr>
			<td style="text-align: center;">15.</td>
			<td>(<span style="border-top: 1px solid">x</span> v y v z) (xz v <span style="border-top: 1px solid">y</span>)</td>
			<td style="text-align: center;">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', N'Закріпити знання з побудови ДДНФ та ДКНФ, сформувати навички побудови ДДНФ та ДКНФ', N'1');
GO
INSERT INTO [dbo].[CL_Labs] ([AuthorID], [LabIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'3', N'29.04.2013', N'Знаходження МДНФ та МКНФ. Синтез логічних пристроїв', N'<ol start="2" style="margin-left: 24px;">
	<li>На основі заданих таблиць (номер варіанту - номер у списку) побудувати карти Карно. За утвореними картами Карно побудувати ДДНФ і спростити їх до МДНФ (номер варіанту &ndash; номер у списку підгрупи).</li>
</ol>

<p><strong><em><u>Варіанти завдань:</u></em></strong></p>

<p style="text-align: center;"><img alt="" src="../Uploads/img_018.png" /></p>

<ol start="3" style="margin-left: 24px;">
	<li style="text-align: justify;">Користуючись інструментальними засобами цифрової&nbsp; частини&nbsp; програмного продукту Carno Minimizer, версія 1.6, мінімізувати булеву функцію від трьох змінних f(x, y, z), яка набуває значень одиниці на наборах з номерами згідно відповідного номеру списку підгрупи:&nbsp;</li>
</ol>

<p><strong><em><u>Варіанти завдань:</u></em></strong></p>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td style="text-align: center;"><strong>№ варіанту</strong></td>
			<td style="text-align: center;"><strong>Завдання</strong></td>
			<td style="text-align: center;"><strong>№ варіанту</strong></td>
			<td style="text-align: center;"><strong>Завдання</strong></td>
		</tr>
		<tr>
			<td style="text-align: center;">1.</td>
			<td>
			<p><em>f(x, y, z) = Y(0,1,5)</em></p>
			</td>
			<td style="text-align: center;">2.</td>
			<td>
			<p><em>f(x, y, z) = Y(2,6,4)</em></p>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;">3.</td>
			<td>
			<p><em>f(x, y, z) = Y(0,1,2)</em></p>
			</td>
			<td style="text-align: center;">4.</td>
			<td>
			<p><em>f(x, y, z) = Y(2,4,1)</em></p>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;">5.</td>
			<td>
			<p><em>f(x, y, z) = Y(3,4,5)</em></p>
			</td>
			<td style="text-align: center;">6.</td>
			<td>
			<p><em>f(x, y, z) = Y(0,1,4)</em></p>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;">7.</td>
			<td>
			<p><em>f(x, y, z) = Y(0,3,4)</em></p>
			</td>
			<td style="text-align: center;">8.</td>
			<td>
			<p><em>f(x, y, z) = Y(0,1,3)</em></p>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;">9.</td>
			<td>
			<p><em>f(x, y, z) = Y(0,2,4)</em></p>
			</td>
			<td style="text-align: center;">10.</td>
			<td>
			<p><em>f(x, y, z) = Y(0,1,5)</em></p>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;">11.</td>
			<td>
			<p><em>f(x, y, z) = Y(5,6,7)</em></p>
			</td>
			<td style="text-align: center;">12.</td>
			<td>
			<p><em>f(x, y, z) = Y(1,5,7)</em></p>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;">13.</td>
			<td>
			<p><em>f(x, y, z) = Y(4,6,5)</em></p>
			</td>
			<td style="text-align: center;">14.</td>
			<td>
			<p><em>f(x, y, z)&nbsp; = Y(0,5,6)</em></p>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;">15.</td>
			<td>
			<p><em>f(x, y, z)&nbsp; = Y(0,4,1)</em></p>
			</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<ul style="margin-left: 24px;">
	<li>Порядок побудови таблиць Карно на основі програми Carno Minimizer:
	<ul>
		<li>Завантажити програму Carno Minimizer.</li>
		<li>В результаті з&rsquo;явиться вікно даної програми:</li>
	</ul>
	</li>
</ul>

<p style="text-align: center;"><img alt="" src="../Uploads/img_019.png" /></p>

<ul style="margin-left: 24px;">
	<li>Визначити вихідну форму заданої мулевої функції (Таблиця істинності, Набори значень, Булева формула).</li>
</ul>

<ul style="margin-left: 24px;">
	<li>Визначити кількість змінних в булевій функції і підготувати таблицю потрібного розміру, використовуючи регулятор кількості змінних: для цього на панелі інструментів (справа), вибрати кількість змінних для заповнення таблиці Карно:</li>
</ul>

<p style="text-align: center;"><img alt="" src="../Uploads/img_020.png" /></p>

<ul style="margin-left: 24px;">
	<li style="text-align: justify;">Відповідно до заданих значень функції заповнити таблицю Карно, яка з&rsquo;явиться в результаті вибору відповідної кількості змінних.</li>
	<li style="text-align: justify;">Командою <strong>Установки-Карта</strong>, відкрити вікно <strong>Options</strong><strong>, </strong>в якому вибрати метод мінімізації мулевої функції КНФ (для 0) або ДНФ (для 1):</li>
</ul>

<p style="text-align: center;"><img alt="" src="../Uploads/img_021.png" style="width: 290px; height: 251px;" /></p>

<ul style="margin-left: 24px;">
	<li>Натиснувши на кнопку <span style="border: 1px solid">Go</span>. Провести мінімізацію, в результаті одержимо шукану формулу:</li>
</ul>

<p style="text-align: center;"><img alt="" src="../Uploads/img_022.png" style="width: 400px; height: 203px;" /></p>

<ol style="margin-left: 24px;">
	<li>Перевірити засвоєний на лабораторному занятті матеріал, проробивши відповідні тестові завдання:</li>
</ol>

<p>&nbsp;</p>

<p align="center"><strong>Тестові завдання</strong> <strong>для самоконтролю</strong></p>

<p align="center"><em>(в</em><em>иберіть найбільш правильну відповідь</em><em>)</em></p>

<ol style="margin-left: 24px;">
	<li style="text-align: justify;">Досконалою кон&rsquo;юнктивною нормальною формою (скорочено _______) функції називається формула, яка представлена у вигляді: а) диз&rsquo;юнкції; б) кон&rsquo;юнкції конституент: а) одиниці; б) нуля даної функції.</li>
	<li style="text-align: justify;">Алгоритм переходу від таблиці істинності булевої функції до ДДНФ полягає в тому, що потрібно виділити всі інтерпретації (x1, x2, ..., xn), на яких значення функції дорівнює: а) 0; б) 1.</li>
	<li style="text-align: justify;">Елементарна кон&rsquo;юнкція виду х<sub>1</sub>^ х<sub>2</sub>^ ... ^х<sub>n</sub> називається: а) конституцією; б) константою; в) конструкцією; г) конституентою; д) конструктором одиниці (мінтермом) функції f(x<sub>1</sub>, х<sub>2</sub>,..., х<sub>n</sub>), якщо f(х<sub>1</sub>, х<sub>2</sub>, ..., х<sub>n</sub>) = 1,</li>
	<li style="text-align: justify;">&nbsp;Елементарною диз&rsquo;юнкцією називається диз&rsquo;юнкція будь-якого числа булевих змінних, взятих із запереченням або без нього, в якій кожна змінна зустрічається а) точно один раз; б) не більше одного разу; в) не менше одного разу.</li>
</ol>

<p>&nbsp;</p>
', N'Закріпити знання з побудови ДДНФ та ДКНФ, сформувати навички побудови ДДНФ та ДКНФ', N'2');
GO

-- ----------------------------
-- Table structure for [dbo].[CL_Lessons]
-- ----------------------------
DROP TABLE [dbo].[CL_Lessons]
GO
CREATE TABLE [dbo].[CL_Lessons] (
[AuthorID] varchar(24) NULL ,
[LessonIndex] int NOT NULL ,
[DateCreated] varchar(10) NULL ,
[Title] nvarchar(MAX) NULL ,
[Content] nvarchar(MAX) NULL ,
[Subtitle] nvarchar(MAX) NULL ,
[Page] int NOT NULL DEFAULT ((0)) 
)


GO

-- ----------------------------
-- Records of CL_Lessons
-- ----------------------------
INSERT INTO [dbo].[CL_Lessons] ([AuthorID], [LessonIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'1', N'26.04.2013', N'Системи числення', N'&nbsp; &nbsp; &nbsp;Система числення визначає правило представлення числа з комбінації цифр даної системи числення. У десятковій системі числення, якою ми користуємося повсякденно, &nbsp;є десять цифр, комбінація яких визначає число. При представленні числа з цифр має значення, на якому місці знаходиться цифра. Місце визначає вагу даної цифри. Одна і та ж цифра може визначати кількість одиниць, десятків, сотень і так далі, все залежить від її місцерозташування в числі.<br />&nbsp; &nbsp; &nbsp;Такі системи числення називаються позиційними системами числення по основі 2. У цих системах використовується кінцевий набір символів, кожен символ називається цифрою і позначає деяку кількість. Число різних цифр в наборі називається основою системи числення. Щоб отримати яке-небудь число, необхідно цифри записати поряд. Відносній позиції цифри в числі ставиться у відповідність ваговий множник (коефіцієнт).<br />&nbsp; &nbsp; &nbsp;У десятковій системі числення 10 цифр: 0, 1 &hellip;9. Представлення числа в десятковій системі числення можна представити у такий спосіб &nbsp;у вигляді полінома. Наприклад, число 678 матиме вигляд:</p><p style="text-align: justify;">&nbsp; &nbsp; &nbsp;6x10<sup>2</sup>&nbsp;+ 7x10<sup>1</sup>&nbsp;+ 8x10<sup>0</sup></p><p style="text-align: justify;">Тут цифра 6 входить з вагою 100, цифра 7 &ndash; з вагою 10, цифра 8 &ndash; з вагою 1.<br />&nbsp; &nbsp; &nbsp;У загальному вигляді даний вираз можна представити у такий спосіб:&nbsp;</p><p style="text-align: justify;"><em>&nbsp; &nbsp; &nbsp;N = a<sub>n-1</sub>a<sub>n-2</sub>...a<sub>1</sub>a<sub>0</sub>&nbsp;=&nbsp;a<sub>n-1</sub>b<sup>n-1</sup>&nbsp;+ a<sub>n-2<sup>b</sup></sub>b<sup>n-2</sup>&nbsp;+ a<sub>1</sub>b<sup>1</sup>&nbsp;+ a<sub>0</sub>b<sup>0</sup></em>, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1.1)</p><p style="text-align: justify;">&nbsp; &nbsp; &nbsp;У таблиці 1.1 приведені найбільш споживані системи числення і їх характеристики.</p><p style="text-align: justify;"><strong>Таблиця 1.1</strong><strong>.</strong><strong>&nbsp;Системи числення</strong></p><table border="1" cellpadding="0" cellspacing="0">	<tbody>		<tr>			<td style="width: 103px;">			<p><strong>Основа</strong></p>			</td>			<td style="width: 184px;">			<p><strong>Система числення</strong></p>			</td>			<td style="width: 92px;">			<p><strong>Позначення</strong></p>			</td>			<td style="width: 316px;">			<p><strong>Цифрові символи</strong></p>			</td>		</tr>		<tr>			<td style="width: 103px;">			<p><strong>2</strong></p>			</td>			<td style="width: 184px;">			<p><strong>Двійкова</strong></p>			</td>			<td style="width: 92px;">			<p><strong>b</strong></p>			</td>			<td style="width: 316px;">			<p><strong>0,1</strong></p>			</td>		</tr>		<tr>			<td style="width: 103px;">			<p><strong>3</strong></p>			</td>			<td style="width: 184px;">			<p><strong>Трійкова</strong></p>			</td>			<td style="width: 92px;">			<p>&nbsp;</p>			</td>			<td style="width: 316px;">			<p><strong>0,1,2</strong></p>			</td>		</tr>		<tr>			<td style="width: 103px;">			<p><strong>4</strong></p>			</td>			<td style="width: 184px;">			<p><strong>Четверкова</strong></p>			</td>			<td style="width: 92px;">			<p>&nbsp;</p>			</td>			<td style="width: 316px;">			<p><strong>0,1,2,3</strong></p>			</td>		</tr>		<tr>			<td style="width: 103px;">			<p><strong>5</strong></p>			</td>			<td style="width: 184px;">			<p><strong>П&#39;ятіркова</strong></p>			</td>			<td style="width: 92px;">			<p>&nbsp;</p>			</td>			<td style="width: 316px;">			<p><strong>0,1,2,3,4</strong></p>			</td>		</tr>		<tr>			<td style="width: 103px;">			<p><strong>8</strong></p>			</td>			<td style="width: 184px;">			<p><strong>Вісімкова</strong></p>			</td>			<td style="width: 92px;">			<p><strong>о</strong></p>			</td>			<td style="width: 316px;">			<p><strong>0,1,2,3,4,5,6,7</strong></p>			</td>		</tr>		<tr>			<td style="width: 103px;">			<p><strong>10</strong></p>			</td>			<td style="width: 184px;">			<p><strong>Десяткова</strong></p>			</td>			<td style="width: 92px;">			<p><strong>d</strong></p>			</td>			<td style="width: 316px;">			<p><strong>0,1,2,3,4,5,6,7,8,9</strong></p>			</td>		</tr>		<tr>			<td style="width: 103px;">			<p><strong>12</strong></p>			</td>			<td style="width: 184px;">			<p><strong>Дванадцяткова</strong></p>			</td>			<td style="width: 92px;">			<p>&nbsp;</p>			</td>			<td style="width: 316px;">			<p><strong>0,1,2,3,4,5,6,7,8,9,A,B</strong></p>			</td>		</tr>		<tr>			<td style="width: 103px;">			<p><strong>16</strong></p>			</td>			<td style="width: 184px;">			<p><strong>Шістнадцяткова</strong></p>			</td>			<td style="width: 92px;">			<p><strong>h</strong></p>			</td>			<td style="width: 316px;">			<p><strong>0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F</strong></p>			</td>		</tr>	</tbody></table><p style="text-align: justify;">&nbsp; &nbsp; &nbsp;З приведених в таблиці 1.1 систем числення в обчислювальній техніці найбільше застосування разом з десятковою&nbsp;<span style="line-height: 1.6em;">системою числення отримали&nbsp;двійкова, вісімкова і шістнадцяткова системи числення. Для відмінності систем числення застосовують наступні:</span></p><p>100<sub>(10)</sub>, 100<sub>(</sub><sub>d)&nbsp;</sub>&ndash; число представлене у десятковій системі числення;<br />100(2), 100(b) - число представлене у двійковій системі числення;<br />100(8), 100(o) - число представлене у вісімковій системі числення;</p><p style="text-align: justify;">100<sub>(16)</sub>, 100<sub>(</sub><sub>h)</sub>&nbsp;- число представлене у шістнадцятковій системі числення.</p><p style="text-align: justify;">&nbsp;</p><p style="text-align: center;"><strong>Двійкова система числення</strong></p><p style="text-align: justify;">&nbsp; &nbsp; Двійкова система числення використовує тільки дві цифри 0 і 1, що дозволяє використовувати цю систему числення технічними пристроями для виконання арифметичних операцій [3]. Дані технічні пристрої мають два стійкі стани: увімкнено-вимкнено, низький-високий рівень.<br />&nbsp; &nbsp; &nbsp; У двійковій системі числення кожної позиції відповідає певна вага, яка визначається як ступінь числа 2, оскільки основа двійкової системи числення дорівнює 2. Через те, що дана система числення має дві цифри, розрядність двійкових чисел значно більше розрядності десяткових чисел.<br />&nbsp; &nbsp; &nbsp;Представлення двійкових чисел і їх перетворення в десяткове число здійснюється по виразу (1.1)<br />&nbsp; &nbsp; &nbsp;1011012 = 1*25 + 0*24 + 1*23 + 1*22 + 0*21 + 1*20 = 1*32 + 0*16 + 1*8 + 1*4 + 0*2 +1*1 = 4510<br />&nbsp; &nbsp;&nbsp;&nbsp;При записі двійкового числа кожна позиція зайнята двійковою цифрою, яка називається бітом. Слово біт штучне, воно відбулося як скорочення від двох слів: binary digit (двійкова одиниця) - bit.<br />&nbsp; &nbsp;При розгляді двійкових чисел користуються поняттями найменший значущий біт (самий молодший двійковий розряд) і найбільший значущий біт (самий старший двійковий розряд). Звичайне двійкове число записується так, що найбільший значущий біт є крайнім зліва.<br />&nbsp;&nbsp;&nbsp;Перетворення з десяткової системи в двійкову систему числення здійснюється у такий спосіб. Перетворення здійснюється багатократним діленням десяткового числа на 2. Наприклад, перетворення десяткового числа 35 в двійкове число</p><p>35:2=17 залишок 1 = a<sub>0</sub></p><p>17:2=8&nbsp; залишок 1 = a<sub>1</sub></p><p>8:2 =4&nbsp; залишок 0 = a<sub>2</sub></p><p>4:2 =2&nbsp; залишок 0 = a<sub>3</sub></p><p style="text-align: justify;">2:2 =1&nbsp; залишок 0 = a<sub>4</sub></p><p style="text-align: justify;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1 = a<sub>5</sub></p><p style="text-align: justify;">&nbsp; &nbsp; &nbsp;Таким чином, двійкове число матиме вид a<sub>5</sub>a<sub>4</sub>a<sub>3</sub>a<sub>2</sub>a<sub>1</sub>a<sub>0</sub></p><p style="text-align: justify;">&nbsp; &nbsp; &nbsp;100011<sub>2</sub>&nbsp;= 1*2<sup>5</sup>&nbsp;+ 0*2<sup>4</sup>&nbsp;+ 0*2<sup>3</sup>&nbsp;+ 0*2<sup>2</sup>&nbsp;+ 1*2<sup>1</sup>&nbsp;+ 1*2<sup>0</sup>&nbsp;= 1*32 + 0*16 + 0*8 + 0*4 + 1*2 +1*1 = 35<sub>10</sub></p><p style="text-align: justify;">&nbsp;</p>', N'Ознайомитися з існуючими системами сислення', N'1');
GO
INSERT INTO [dbo].[CL_Lessons] ([AuthorID], [LessonIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'1', N'26.04.2013', N'Системи числення', N'<p style="text-align: justify;">&nbsp; &nbsp; &nbsp;У шістнадцятковій системі числення використовуються 16 цифр: 0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F. Шістнадцяткова система числення використовується як засіб&nbsp;скороченого запису 4-х розрядного двійкового числа. У таблиці 1.2 приведені шістнадцяткові числа і їх двійкові і десяткові еквіваленти.</p><p><strong>Таблиця 1.2</strong></p><table align="center" border="1" cellpadding="0" cellspacing="0">	<tbody>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>Шістнадцяткове число</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>Двійкове<br />			число</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>Десяткове<br />			число</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>Шістнадцяткове число</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>Двійкове<br />			число</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>Десяткове<br />			число</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>0</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>0000</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>0</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>10</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>10000</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>16</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>1</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>0001</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>1</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>11</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>10001</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>17</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>2</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>0010</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>2</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>12</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>10010</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>18</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>3</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>0011</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>3</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>13</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>10011</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>19</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>4</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>0100</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>4</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>14</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>10100</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>20</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>5</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>0101</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>5</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>15</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>10101</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>21</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>6</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>0110</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>6</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>16</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>10110</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>22</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>7</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>0111</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>7</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>17</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>10111</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>23</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>8</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>1000</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>8</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>18</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>11000</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>24</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>9</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>1001</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>9</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>19</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>11001</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>25</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>A</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>1010</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>10</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>1A</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>11010</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>26</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>B</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>1011</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>11</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>1B</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>11011</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>27</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>C</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>1100</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>12</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>1C</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>11100</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>28</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>D</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>1101</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>13</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>1D</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>11101</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>29</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>E</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>1110</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>14</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>1E</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>11110</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>30</strong></p>			</td>		</tr>		<tr>			<td style="width: 135px;">			<p style="text-align: center;"><strong>F</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>1111</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>15</strong></p>			</td>			<td style="width: 135px;">			<p style="text-align: center;"><strong>1F</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>11111</strong></p>			</td>			<td style="width: 115px;">			<p style="text-align: center;"><strong>31</strong></p>			</td>		</tr>	</tbody></table><p style="text-align: justify;">&nbsp; &nbsp; &nbsp;Перетворення двійкового числа в шістнадцяткове число полягає в тому, що біти, починаючи з молодшого значущого біта, об&#39;єднуються в групи по чотири. Кожній групі підбирається відповідний шістнадцятковий символ. Наприклад, щоб представити двійкове число 1010101111111012 у вигляді шістнадцяткового числа необхідно зліва додати два незначущі нулі з метою формування бітів в групи по чотири: 0010 1010 1111 1101. Замінивши кожну групу бітів відповідним шістнадцятковим символом, отримаємо число 2AFD16. Дана форма запису набагато простіше і сприймається легше, ніж двійкова.<br />&nbsp; &nbsp; &nbsp;Потрібно пам&#39;ятати, що шістнадцяткові числа &ndash; це спосіб представлення двійкових чисел, якими оперує мікропроцесор.<br />&nbsp; &nbsp; &nbsp;Представлення шістнадцяткового числа у вигляді десяткового також здійснюється по виразу (1.1).</p><p>&nbsp; &nbsp; &nbsp;&nbsp;2AFD16 = 2*163 + A*162 + F*161 + &nbsp;D*160 =&nbsp;&nbsp; 2*4096 + 10*256 + 15*16 + 13*1 =&nbsp;<span style="line-height: 1.6em;">8192 + 2560 + 240 + 13 = 11005</span><sub style="line-height: 1.6em;">10</sub></p><p>&nbsp;&nbsp;&nbsp;&nbsp; 10101011111101<sub>2&nbsp;</sub>= 1*2<sup>13</sup>&nbsp;+ 0*2<sup>12</sup>&nbsp;+ 1*2<sup>11</sup>&nbsp;+0*2<sup>10</sup>&nbsp;+ 1*2<sup>9</sup>&nbsp;+0*2<sup>8</sup>&nbsp;+ 1*2<sup>7</sup>&nbsp;+ 1*2<sup>6</sup>&nbsp;+ 1*2<sup>5</sup>&nbsp;+ 1*2<sup>4</sup>&nbsp;+ 1*2<sup>3</sup>&nbsp;+ 1*2<sup>2</sup>&nbsp;+0*2<sup>1</sup>&nbsp;+1*2<sup>0</sup>&nbsp;= 8192 + 0 + 2048 + 0 + 512 + 0 + 128 + 64 + 32 + 16 +&nbsp;8 + 4 + 0 + 1 = 11005<sub>10</sub></p>', N'Ознайомитися з існуючими системами сислення', N'2');
GO
INSERT INTO [dbo].[CL_Lessons] ([AuthorID], [LessonIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'2', N'26.04.2013', N'Системи числення. Перетворення чисел з однієї системи числення в іншу.', N'<p align="center"><strong><u>ПЛАН:</u></strong></p>

<p><em>&nbsp; &nbsp; &nbsp;1. Системи числення.</em></p>

<p><em>&nbsp; &nbsp; &nbsp;2. Правила переведення чисел із десяткової &nbsp;системи числення в двійкову і навпаки.</em></p>

<p>&nbsp;</p>

<p align="center" style="margin-left: 18pt;"><strong>Хід заняття.</strong></p>

<p style="margin-left: 18pt;"><strong>І. Повторення матеріалу вивченого на минулому занятті.</strong></p>

<p style="margin-left: 18pt;"><u>а) Студенти пишуть короткий диктант на листочках:</u></p>

<p style="margin-left: 18pt;">- Що таке система числення?&nbsp;<em>(сукупність прийомів та правил найменування й позначення чисел або алфавіт системи чисел і дій з ними)</em></p>

<p style="margin-left: 18pt;">- Які типи систем числення ви знаєте?&nbsp;<em>(позиційні та не позиційні)</em></p>

<p style="margin-left: 18pt;">- Що таке основа позиційної системи числення?&nbsp;<em>(Кількість різних цифр, які використовуються для запису числа в позиційній системі числення.)</em></p>

<p style="margin-left: 18pt;">- Яка система числення використовується для подання чисел у пам&#39;яті комп&#39;ютера? Чому?</p>

<p style="margin-left: 18pt;">- Що таке алфавіт системи числення (інформатика) - це впорядкована множина символів або всі знаки, які входять в дану систему числення.</p>

<p style="margin-left: 18pt;"><span style="line-height: 1.6em;">- Яка залежність між максимальним елементом алфавіту та основою системи числення?&nbsp;</span><em style="line-height: 1.6em;">(основа на одиницю більша).</em></p>

<p style="margin-left: 18pt;">- Назвати алфавіти наступних систем числення: трійкова, пятіркова, сімкова, дванадцяткова, шістнадцяткова.</p>

<p style="margin-left: 18pt;"><span style="line-height: 1.6em;">- Яка система числення називається&nbsp;</span><span style="line-height: 1.6em;">Q-ковою?&nbsp;<em>(якщо в системі чис&shy;лення використовується Q різних цифр (і основа рівна Q)).</em></span></p>

<p style="margin-left: 18pt;">-&nbsp;Вибрати із переліку непозиційну систему числення:&nbsp;десяткова; двійкова; трійкова; римська; двадцяткова.&nbsp;<em>(римська).</em></p>

<p style="margin-left: 18pt;">-&nbsp;Назвати позиційні ситеми числення: десяткова;&bull; двійкова;&bull; римська;&bull; вісімкова.&nbsp;<em>(десяткова;&bull; двійкова; вісімкова).</em></p>

<p style="margin-left: 18pt;">-&nbsp;<span style="line-height: 1.6em;">Що таке непозиційна система числення? Навести приклад.&nbsp;</span><em style="line-height: 1.6em;">(</em><em style="line-height: 1.6em;">це така система, де значення кожної цифри не залежить від того місця (позиції), на якому вона знаходиться.</em><em style="line-height: 1.6em;">&nbsp;Пр. римська система числення).</em></p>

<p style="margin-left: 18pt;">-&nbsp;<span style="line-height: 1.6em;">Який алфавіт римської системи числення?&nbsp;</span><em style="line-height: 1.6em;">{І,&nbsp;</em><em style="line-height: 1.6em;">V,&nbsp;</em><em style="line-height: 1.6em;">X</em><em style="line-height: 1.6em;">,&nbsp;</em><em style="line-height: 1.6em;">L</em><em style="line-height: 1.6em;">&nbsp;(50), С (100),&nbsp;</em><em style="line-height: 1.6em;">D</em><em style="line-height: 1.6em;">&nbsp;(500),&nbsp;</em><em style="line-height: 1.6em;">М(1</em><em style="line-height: 1.6em;">000)}</em></p>

<p style="margin-left: 18pt;">-&nbsp;<span style="line-height: 1.6em;">Які цифри записано за допомогою римських цифр: MMMD, LIV, XCIV, MCMXCVII?</span></p>

<p style="margin-left: 18pt;"><span style="line-height: 1.6em;">- Запишіть сьогоднішню дату в римській системі числення.</span></p>

<p style="margin-left: 18pt;">&nbsp;</p>

<p style="margin-left: 18pt;"><u>б) В цей же час троє студентів працюють на дошці:</u></p>

<p style="margin-left: 18pt;">Студент 1:</p>

<p style="margin-left: 18pt;">а)&nbsp;Виконайте&nbsp;дії і запишіть результат римськими цифрами: XXII - V; XX / V</p>

<p style="margin-left: 18pt;">б)&nbsp;Охарактеризувати 2 та 10 системи числення (алфавіт, основа, базис).</p>

<p style="margin-left: 18pt;">Студент 2:</p>

<p style="margin-left: 18pt;">а)&nbsp;Виконайте&nbsp;дії і запишіть результат римськими цифрами: CV - LII; X * IV;</p>

<p style="margin-left: 18pt;">б)&nbsp;Охарактеризувати 8 та 16 системи числення (алфавіт, основа, базис).</p>

<p style="margin-left: 18pt;">Студент 3:</p>

<p style="margin-left: 18pt;">а)&nbsp;Виконайте&nbsp;дії і запишіть результат римськими цифрами: IC&nbsp;+&nbsp;XIX; LXVI /&nbsp;XI;</p>

<p style="margin-left: 18pt;">б)&nbsp;Охарактеризувати 8 та 16 системи числення (алфавіт, основа, базис).</p>

<p style="margin-left: 18pt;">&nbsp;</p>

<p style="margin-left: 18pt;"><u>в) А тим часом решта студентів виконує таке завдання:</u></p>

<p style="margin-left: 18pt;">MCM + VIII</p>

<p style="margin-left: 18pt;">XXIV * VII</p>

<p style="margin-left: 18pt;">&nbsp;</p>

<p style="margin-left: 18pt;"><strong style="line-height: 1.6em;">ІІ. Пояснення нового матеріалу.&nbsp;</strong></p>

<p style="margin-left: 18pt; text-align: justify;">В процесі налагодження програм та в деяких інших ситуаціях у програмуванні актуальною є проблема переведення чисел з однієї позиційної системи числення в іншу. З цією темою ви вже мали змогу ознайомитися при вивченні дисципліни &quot;Інформатика&quot;. Тому зараз пригадаємо собі основні навики роботи переведення чисел і почнемо це робити, переводячи числа з десяткової системи числення у двійкову і навпаки.</p>

<div style="margin-left: 18pt;">
<p style="text-align: justify;"><span style="color: rgb(255, 0, 0);"><strong><em><u>Алгоритм переведення цілого числа з десяткової системи числення до двійкової</u></em></strong>&nbsp;здійснюється шляхом його послідовного цілочисельного ділення на 2, поки в частці не вийде 0. Остачі від ділень, якщо їх прочитати справа наліво, утворюють число в двійковій системі (перша остача записується в молодший, тобто крайній справа, розряд, друга - в наступний за ним і т.д).</span></p>

<p style="text-align: justify;">Приклад:</p>
</div>

<p style="margin-left: 18pt;"><img alt="" src="../Source/img/2.01.jpg" style="opacity: 0.9; text-align: justify; width: 161px; height: 132px; float: left;" /></p>

<div>&nbsp;</div>

<div>&nbsp;</div>

<div>&nbsp;75<sub>&nbsp;10</sub>=1001011<sub>&nbsp;2</sub></div>

<div>&nbsp;</div>

<div>&nbsp;</div>

<p>&nbsp;</p>

<p><strong style="line-height: 1.6em;"><em>Проробимо цю ж операцію для чисел від 1 до 15, переводячи їх із десяткової у двійкову систему числення.</em></strong></p>

<p>0<sub>10</sub>=00<sub>2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</sub><span style="line-height: 1.6em;">1</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=01</span><sub style="line-height: 1.6em;">2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</sub><span style="line-height: 1.6em;">2</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=10</span><sub style="line-height: 1.6em;">2 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</sub><span style="line-height: 1.6em;">3</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=11</span><sub style="line-height: 1.6em;">2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</sub><span style="line-height: 1.6em;">4</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=100</span><sub style="line-height: 1.6em;">2 &nbsp; &nbsp; &nbsp; &nbsp;</sub><span style="line-height: 1.6em;">5</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=101</span><sub style="line-height: 1.6em;">2</sub></p>

<p><span style="line-height: 1.6em;">6</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=110</span><sub style="line-height: 1.6em;">2 &nbsp; &nbsp; &nbsp;&nbsp;</sub><span style="line-height: 1.6em;">7</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=111</span><sub style="line-height: 1.6em;">2 &nbsp; &nbsp; &nbsp;&nbsp;</sub><span style="line-height: 1.6em;">8</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=1000</span><sub style="line-height: 1.6em;">2 &nbsp; &nbsp;&nbsp;</sub><span style="line-height: 1.6em;">9</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=1001</span><sub style="line-height: 1.6em;">2 &nbsp; &nbsp;&nbsp;</sub><span style="line-height: 1.6em;">10</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=1010</span><sub style="line-height: 1.6em;">2 &nbsp; &nbsp;</sub><span style="line-height: 1.6em;">11</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=1011</span><sub style="line-height: 1.6em;">2</sub></p>

<p><span style="line-height: 1.6em;">12</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=1100</span><sub style="line-height: 1.6em;">2 &nbsp;</sub><span style="line-height: 1.6em;">13</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=1101</span><sub style="line-height: 1.6em;">2 &nbsp;&nbsp;</sub><span style="line-height: 1.6em;">14</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=1110</span><sub style="line-height: 1.6em;">2 &nbsp; &nbsp;&nbsp;</sub><span style="line-height: 1.6em;">15</span><sub style="line-height: 1.6em;">10</sub><span style="line-height: 1.6em;">=1111</span><sub style="line-height: 1.6em;">2</sub></p>

<p><strong style="line-height: 1.6em;"><em>Далі будемо виконувати практичні завдання:</em></strong></p>

<p><strong><em>Перевести ціле число з 10-вої в 2-ву систему числення.</em></strong></p>

<p><span style="line-height: 1.6em;">&nbsp; &nbsp; &nbsp;1.</span><span style="line-height: 1.6em;">33, 9, 17, 101, 286</span></p>

<p><span style="line-height: 1.6em;">&nbsp; &nbsp; &nbsp;2. 1</span><span style="line-height: 1.6em;">07, 1007, 10007, 100007&nbsp;</span></p>

<p>&nbsp; &nbsp; &nbsp;3. 89, 254, 2781, 10950, 555</p>

<p style="margin-left: 16.6pt;">Тепер спробуємо попрацювати навпаки: будемо переводити числа із двійкової системи числення у десяткову. Для цього скористаємося таким алгоритмом.</p>

<p style="margin-left: 16.6pt; text-align: justify;"><span style="color: rgb(255, 0, 0);"><strong style="line-height: 1.6em;"><em><u>Алгоритм переведення чисел з двійкової системи до десяткової</u></em></strong><span style="line-height: 1.6em;">&nbsp;безпосередньо спирається на визначення позиційної системи числення. Всі розряди домножуються на відповідні степені двійки (крайній справа - на 1, наступний - на 2 і т.д), після чого отримані добутки додаються за правилами десяткової системи.</span></span></p>

<p><strong>Приклад.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></p>

<p>(101011)<sub>2</sub>&nbsp;= 1*2<sup>5</sup>+ 0*2<sup>4</sup>+1*2<sup>3</sup>+0*2<sup>2</sup>+1*2<sup>1</sup>+1*2<sup>0</sup>=32*1+0+8+0+1*2+1*1= 32+8+2+1= 43<sub>10</sub>.</p>

<p>з двійкової в десяткову:</p>

<p>110100101<sub>2</sub>&nbsp;= 1*10<sub>2</sub><sup>8</sup>&nbsp;+ 1*10<sub>2</sub><sup>7</sup>&nbsp;+ 0*10<sub>2</sub><sup>6</sup>&nbsp;+ 1*10<sub>2</sub><sup>5</sup>&nbsp;+ 0*10<sub>2</sub><sup>4</sup>&nbsp;+ 0*10<sub>2</sub><sup>3</sup>&nbsp;+ 1*10<sub>2</sub><sup>2</sup>&nbsp;+ 0*10<sub>2</sub><sup>1</sup>&nbsp;+ 1*10<sub>2</sub><sup>0</sup>&nbsp;= 1*2<sub>10</sub><sup>8</sup>&nbsp;+ 1*2<sub>10</sub><sup>7</sup>&nbsp;+ 1*2<sub>10</sub><sup>6</sup>&nbsp;+ 1*2<sub>10</sub><sup>5</sup>&nbsp;+ 1*2<sub>10</sub><sup>4</sup>&nbsp;+ 1*2<sub>10</sub><sup>3</sup>&nbsp;+ 1*2<sub>10</sub><sup>2</sup>&nbsp;+ 1*2<sub>10</sub><sup>1</sup>&nbsp;+ 1*2<sub>10</sub><sup>0</sup>&nbsp;= 421<sub>10</sub></p>

<p>перевести ціле 2-ве число в 10-ву систему числення:</p>

<p>&nbsp; &nbsp;&nbsp;<u>543210</u></p>

<p><span style="line-height: 1.6em;">1. 101110</span><sub style="line-height: 1.6em;">2</sub><span style="line-height: 1.6em;">&nbsp;= 2</span><sup style="line-height: 1.6em;">2&nbsp;</sup><span style="line-height: 1.6em;">+ 2</span><sup style="line-height: 1.6em;">3</sup><span style="line-height: 1.6em;">&nbsp;+ 2</span><sup style="line-height: 1.6em;">2</sup><span style="line-height: 1.6em;">&nbsp;+ 2</span><sup style="line-height: 1.6em;">1</sup><span style="line-height: 1.6em;">&nbsp;= 46</span><sub style="line-height: 1.6em;">10</sub></p>

<p>2. 110111<sub>2</sub>&nbsp;=&nbsp;</p>

<p>3. 111010000<sub>2</sub>&nbsp;= 464<sub>10</sub></p>

<p>4. 1000001<sub>2</sub>&nbsp;= 1*2<sup>6</sup>&nbsp;+ 0*2<sup>5</sup>&nbsp;+ 0*2<sup>4</sup>&nbsp;+ 0*2<sup>3</sup>&nbsp;+ 0*2<sup>2</sup>&nbsp;+&nbsp;0*2<sup>1</sup>&nbsp;+ 1*2<sup>0</sup>&nbsp;= 64 + 1 = 65<sub>10</sub></p>

<p>5. 11011<sub>2</sub>&nbsp;=&nbsp;</p>

<p>&nbsp;</p>

<p><strong style="line-height: 1.6em;">ІІІ. Систематизація і узагальнення знань:</strong></p>

<p><span style="line-height: 1.6em;">1) Яким чином здійснюється переведення цілих чисел із десяткової ситеми числення у двійкову?</span></p>

<p><span style="line-height: 1.6em;">2) Яким чином здійснюється переведення цілих чисел із двійкової в десяткову ситему числення?</span></p>

<p><span style="line-height: 1.6em;">3) Яким чином здійснюється переведення дробових чисел із десяткової ситеми числення у двійкову?</span></p>

<p><span style="line-height: 1.6em;">4) Яким чином здійснюється переведення дробових чисел із двійкової в десяткову ситему числення?</span></p>

<p>&nbsp;</p>

<p><strong>Виконати вправи:</strong></p>

<p><strong><em>Перевести ціле число з 10-вої в 2-ву систему числення.</em></strong></p>

<p>1.4319</p>

<p>2.3518</p>

<p>3.2043,321</p>

<p>4.3194,167</p>

<p><strong><em>Перевести ціле 2-ве число в 10-ву систему числення.</em></strong></p>

<p>1.1111101110100010</p>

<p>2.1110111010001011</p>

<p>&nbsp;</p>

<p><strong>IV. Повідомлення домашнього завдання</strong></p>

<p>&nbsp;</p>

<p><strong>V. Завершення заняття.</strong></p>

<p>&nbsp;</p>
', N'Ознайомити студентів із основними правилами переведення чисел із однієї системи числення в іншу на прикладі десяткової і двійкової системи числення.', N'1');
GO
INSERT INTO [dbo].[CL_Lessons] ([AuthorID], [LessonIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'3', N'29.04.2013', N'Форми подання двійкових чисел в ЕОМ', N'<p style="text-align: justify;">Двійкові числа в обчислювальних пристроях розміщуються у комірках пам&#39;яті, причому для кожного розряду числа виділяється окрема комірка, що зберігає один біт інформації. Сукупність комірок, призначених для розміщення одного двійкового числа, називають <em>розрядною сіткою</em>. Довжина розрядної сітки (число комірок <em>n </em>у розрядній сітці) обмежена і залежить від конструктивних особливостей обчислювального пристрою. Більшість існуючих електронних обчислювальних пристроїв мають розрядні сітки, що містять 16, 32 або 64 комірок.</p>

<p style="text-align: justify;">Розміщення розрядів числа у розрядній сітці може відбуватися різними способами. Спосіб розміщення визначається формою подання двійкових чисел у ЕОМ. <strong><em>Розрізняють дві форми подання двійкових чисел: із фіксованою комою і з &laquo;плавучою&raquo; комою.</em></strong> Іноді ці форми називають відповідно <em>природною і напівлогарифмічною</em>.</p>

<p style="text-align: justify;">Припустимо, що в розрядній сітці необхідно розмістити двійкове число, що містить цілу і дробову частини. Якщо для розміщення цілої частини числа виділяється k комірок n-розрядної сітки, то (якщо не враховувати знак) для розміщення дробової частини залишиться n-k вільних комірок (рис. 1).</p>

<p style="text-align: center;"><img alt="" src="../Uploads/img_004.png" style="width: 511px; height: 157px;" /></p>

<p align="center"><em>Рис. 1.</em> <em>Форма подання двійкових чисел із фіксованою комою.</em></p>

<p align="center">&nbsp;</p>

<p>Така форма подання двійкових чисел називається <em>формою з фіксованою</em> <em>комою.</em> Дійсно, положення коми строго фіксовано стосовно розрядної сітки. Якщо кількість розрядів у дробовій частині числа перевищують n-k<em>, </em>то деякі молодші розряди виходять за межі розрядної сітки і не будуть сприйматися обчислювальним пристроєм. <strong><em>Отже, будь-яке двійкове число, менше ніж одиниця молодшого розряду розрядної сітки, сприймається як нуль і називається машинним нулем.</em></strong></p>

<p>У результаті відкидання молодших розрядів дробової частини числа, розташованої за межами розрядної сітки, виникає похибка подання. Максимальне значення абсолютної похибки подання не перевищує одиниці молодшого розряду сітки.</p>

<p>В універсальних ЕОМ форма з фіксованою комою, у зв&#39;язку з властивою їй низькою точністю, застосовується лише для подання цілих чисел. Основною є форма подання чисел з &laquo;плавучою&raquo; комою. Її використання дозволяє суттєво розширити діапазон і зменшити відносну похибку.</p>

<p style="text-align: justify;">У цій формі числа подаються у вигляді суми деякого ступеня основи системи числення (який називається характеристикою числа) і цифрової частини, що має вигляд правильного дробу:</p>

<p style="text-align: center;"><span style="font-size:18px;"><em>N =&nbsp;&plusmn;aq<span style="text-align: center;"><sup>&plusmn;p</sup>?,</span></em></span></p>

<p style="text-align: justify;">де <em>p</em> звуть порядком числа, а правильний дріб <em>a</em> &ndash; його мантисою. Мантиса і порядок є знаковими числами. Тому для позначення знаків у розрядній сітці відводяться два додаткові розряди. Знак усього числа співпадає із знаком мантиси.</p>

<p style="text-align: justify;">При запису двійкового числа у показовій формі, в розрядній сітці використовуються дві групи розрядів (без урахування знакових розрядів мантиси і порядку). Перша група (k розрядів) призначена для розміщення коду мантиси, друга (n-k розрядів) &ndash; для розміщення коду порядку (рис.2).</p>

<p style="text-align: center;"><img alt="" src="../Uploads/img_005.png" /></p>

<p align="center"><em>Рис. 2.</em> <em>Форма подання двійкових чисел із &bdquo;плавучою&rdquo; комою.</em></p>

<p align="center">&nbsp;</p>

<p style="text-align: justify;">Отже, мантиса числа може мати необмежену кількість різних значень, менших за одиницю, при відповідних значеннях порядку (тобто кома може &laquo;плавати&raquo;). <strong><em>З усієї кількості подань числа у показовій формі те його подання, що не має в старшому розряді мантиси нуля, називають нормалізованим.</em></strong> Всі інші подання є ненормалізованими. У нормалізованій формі значення мантиси завжди більші або дорівнюють 1/2, але не перевищують одиниці.</p>

<p style="text-align: justify;">У обчислювальних пристроях із &laquo;плавучою&raquo; комою усі числа зберігаються у нормалізованому вигляді, при цьому не втрачаються молодші розряди мантиси і підвищується точність обчислень. Якщо після виконання будь-якої арифметичної операції результат виявляється ненормалізованим, то перед занесенням числа в пам&rsquo;ять виконують його нормалізацію, тобто зсув мантиси ліворуч на відповідну кількість розрядів, і зменшення порядку числа на відповідну кількість одиниць.</p>

<p style="text-align: justify;">Показова форма подання чисел має і свої вади, основною з яких є порівняно висока складність виконання арифметичних операцій, а отже, і більша вимогливість до ресурсів обчислювального пристрою. Це обмежує її застосування, наприклад, у спеціалізованих радіотехнічних обчислювальних пристроях, у системах управління технологічними процесами та обробки вимірювальної інформації у реальному часі.</p>
', N'', N'1');
GO
INSERT INTO [dbo].[CL_Lessons] ([AuthorID], [LessonIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'4', N'29.04.2013', N'Прямий, обернений та додатковий коди двійкових чисел', N'<p style="text-align: justify;">Залежно від способу обробки бітів, розміщених у розрядній сітці, розрізняють два види кодів: паралельний, коли в кожний момент часу всі розряди сітки доступні для обробки, і послідовний, коли в кожний момент часу доступний один розряд сітки. Числа, подані паралельним кодом, доступні за один такт, а числа, подані послідовним кодом, &ndash; за n тактів, де n &ndash; розрядність сітки. Якщо розрядність числа перевищує довжину сітки, то його обробка ведеться частинами.</p>

<p style="text-align: justify;"><strong><em>Натуральним кодом називають подання числа як цілого беззнакового у двійковій системі числення.</em></strong> Діапазон подання чисел у натуральному коді для n- розрядної сітки становить від 0 до 2<sup>n</sup>-1, тобто для 8-розрядної сітки &ndash; від 0 до 255.</p>

<p style="text-align: justify;">Для подання цілих знакових чисел використовують прямий, обернений і додатковий коди. Старший розряд сітки є знаковим. Значення цього розряду дорівнює 0 для додатних чисел і 1 &ndash; для від&rsquo;ємних. В інших розрядах розміщується модуль числа.</p>

<p style="text-align: justify;">Якщо до натурального коду цілого числа додати знаковий розряд, одержуємо запис числа у прямому коді (ПК). Домовимося знаковий розряд розташовувати зліва і відокремлювати від розрядів модуля числа крапкою, наприклад: + 6<sub>(10) </sub>= 0. 110<sub>(ПК)</sub>; - 6<sub>(10)</sub> = 1. 110<sub>(ПК)</sub>.</p>

<p style="text-align: justify;">Використання ПК забезпечує виконання операції додавання двох додатніх чисел звичайним способом без будь-яких складностей &ndash; не варто лише робити перенос одиниці старшого розряду модуля суми у знаковий розряд. Тобто при виконанні арифметичних операцій над ПК двійкових чисел знаковий розряд і розряди модуля не можна розглядати як єдине ціле. У цьому можна переконатися, розглянувши такий приклад:</p>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td style="text-align: center;"><strong>правильно</strong></td>
			<td style="text-align: center;"><strong>неправильно</strong></td>
		</tr>
		<tr>
			<td>
			<p>&nbsp; &nbsp;0.0110</p>

			<p>+&nbsp;<u>0.1010</u></p>

			<p>&nbsp; &nbsp;0.10000</p>
			</td>
			<td>
			<p>&nbsp; &nbsp;0.0110</p>

			<p>+&nbsp;<u>0.1010</u></p>

			<p>&nbsp; &nbsp;0.1000</p>
			</td>
		</tr>
		<tr>
			<td>(+6) + (10) = (+16) &nbsp;&nbsp;</td>
			<td>(+6) + (+10) = (-0) &nbsp;&nbsp;</td>
		</tr>
	</tbody>
</table>

<p style="text-align: justify;">Однак, виконання операції віднімання одного числа від іншого шляхом безпосереднього додавання їхніх ПК неможливо. Неважко також помітити, що в ПК нуль має два можливі зображення: - 0 = 1.000... і + 0 = 0.000..., що ускладнює інтерпретацію результатів виконання арифметичних операцій у ЕОМ.</p>

<p style="text-align: justify;">Іншою формою запису двійкових чисел є обернений код (ОК).</p>

<p style="text-align: justify;"><strong><em>ОК двійкового від&rsquo;ємного числа утворюється з ПК рівного йому за модулем додатнього числа шляхом інвертування значень усіх його розрядів. </em></strong>Або: <strong><em>ОК від&rsquo;ємного числа утворюється шляхом інверсії всіх розрядів модуля цього числа, записаного у ПК. Знаковий розряд при цьому зберігає значення 1. </em></strong>Наприклад, 6<sub>(10) </sub>= 1.110<sub>(ПК) </sub>=1.001<sub>(ОК)</sub>.</p>

<p style="text-align: justify;">При виконанні арифметичних операцій над двійковими числами, поданими в ОК, знаковий розряд і розряд модуля числа можна розглядати як єдине ціле (перенос одиниці зі старшого розряду модуля суми в знаковий розряд не приводить до помилкового результату), але нуль як і раніше має два зображення &ndash; &laquo;додатнє&raquo; і &laquo;від&rsquo;ємне&raquo;. Слід зазначити, що отриманий при додаванні від&rsquo;ємний результат також утворюється в ОК. У цьому випадку число може бути перетворене у ПК інверсією всіх значущих розрядів (розрядів модуля). Наприклад:</p>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td>
			<p>&nbsp; 0.110</p>

			<p>+<u>1.001</u></p>

			<p>&nbsp; 1.111<sub>(OK)</sub> = 1.000<sub>(ПК)</sub></p>
			</td>
		</tr>
		<tr>
			<td>
			<p style="text-align: center;">(+6) + (-6) = (-0)</p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align: justify;">Найбільше поширення в обчислювальних пристроях одержало подання від&rsquo;ємних двійкових чисел за допомогою додаткового коду (ДК).</p>

<p style="text-align: justify;"><strong><em>ДК від&rsquo;ємного числа утворюється з його прямого коду за правилом:</em></strong></p>

<ul style="margin-left: 48px;">
	<li style="text-align: justify;"><strong><em>у </em></strong><strong><em>знаковому розряді залишається одиниця;</em></strong></li>
	<li style="text-align: justify;"><strong><em>розряди</em></strong> <strong><em>модуля числа інвертуються;</em></strong></li>
	<li style="text-align: justify;"><strong><em>до молодшого розряду додається одиниця.</em></strong></li>
</ul>

<p style="text-align: justify;"><strong><em>Очевидно, що ДК від&rsquo;ємного числа утворюється з його ОК додаванням одиниці до молодшого розряду. </em></strong></p>

<p style="text-align: justify;">Наприклад, - 6<sub>(10)</sub> = 1.010<sub>(ДК).</sub></p>

<p style="text-align: justify;">Дійсно, для числа - 6 маємо:</p>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td>
			<p>&nbsp;1.110<sub>(ПК)</sub></p>

			<p>&nbsp;1.001<sub>(ОК)</sub></p>

			<p>+<u> &nbsp; &nbsp; 1</u></p>

			<p>&nbsp;1.010<sub>(ДК)</sub></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align: justify;">Зворотний перехід від ДК до ПК або ОК відбувається за тими ж правилами.</p>

<p style="text-align: justify;">Головною перевагою ДК є те, що цифра 0 у ньому має єдине подання: 0.000... Саме тому, для подання від&rsquo;ємних чисел у сучасних ПЕОМ використовується переважно ДК.</p>

<p style="text-align: justify;">Неправильний дріб (число, що має цілу частину) із знаком записують у різних кодах за допомогою традиційного роздільника &ndash; коми між цілою і дробовою частиною. Наприклад: - 118,375<sub>(10)</sub> = 1.0001,101<sub>(ДК).</sub></p>

<p style="text-align: justify;">Слід пам&#39;ятати, що для кодування додатніх чисел застосовується тільки ПК, хоча можна сказати, що для таких чисел ДК і ОК збігаються з прямим.</p>

<p style="text-align: justify;"><strong><em>Операція одержання ДК від&rsquo;ємного числа з ПК рівного йому за модулем додатнього числа називається операцією доповнення. Ця операція полягає в інвертуванні всіх розрядів вихідного коду (включаючи знаковий) і додавання до молодшого розряду одиниці.</em></strong></p>

<p style="text-align: justify;">Таким чином, сформулюємо наступне правило<strong><em>: у системі двійкових чисел із знаком заміна додатнього числа на рівне йому за модулем від&rsquo;ємне і навпаки, від&rsquo;ємного на додатнє, здійснюється шляхом застосуванням до коду даного числа операції доповнення.</em></strong></p>

<p style="text-align: justify;">Ця властивість подання від&rsquo;ємних чисел у ДК дозволяє при виконанні арифметичних операцій взагалі відмовитися від операції віднімання, замінивши її операцією додавання з числом, що має знак, протилежний знаку числа, яке віднімається.</p>
', N'', N'1');
GO
INSERT INTO [dbo].[CL_Lessons] ([AuthorID], [LessonIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'5', N'29.04.2013', N'Алгоритми виконання арифметичних операцій', N'<p align="center"><strong>Додавання двійкових чисел із знаком</strong></p>

<p style="text-align: justify;">Очевидно, що при додаванні чисел із знаком можуть виникати переноси одиниці із старшого розряду модуля суми до знакового розряду (домовимося позначати його Р<sub>1</sub>) та із знакового розряду &ndash; ліворуч за межі розрядної сітки, у розряд переповнення (Р<sub>2</sub>). Через використання розглянутих раніше кодів, у яких знак числа позначається тими ж цифрами, що і розряди модуля, переповнення розрядної сітки може виникати навіть у випадку додавання чисел із різними знаками, коли модуль результату не перевищує модуля будь-якого операнда. При додаванні ж двох від&rsquo;ємних чисел перенесення одиниці до розряду переповнення відбувається завжди.</p>

<p style="text-align: justify;">При виникненні переповнення розрядної сітки для одержання правильного результату додавання необхідно застосовувати таке правило:</p>

<ul style="margin-left: 48px;">
	<li><strong><em>якщо Р<sub>1</sub></em></strong>&nbsp;<strong><em>&Theta;</em></strong><strong><em>&nbsp;Р<sub>2&nbsp;</sub>= 0, одиниця в розряді переповнення ігнорується (відкидається);</em></strong></li>
	<li><strong><em>якщо Р<sub>1</sub></em></strong>&nbsp;<strong><em>&Theta;</em></strong><strong><em>&nbsp;Р<sub>2</sub>&nbsp;= 1, необхідно зсунути число на один розряд праворуч (або зсунути позицію точки на один розряд ліворуч).</em></strong></li>
</ul>

<p>Додавання дробових і цілих двійкових чисел, поданих у формі з фіксованою комою, відбувається однаково, тобто порядок додавання не залежить від розташування коми. Тому операцію додавання розглянемо на прикладі додавання цілих чисел.</p>

<p><strong>Приклади:</strong></p>

<ol style="margin-left: 48px;">
	<li>Додавання двох додатніх чисел (без переповнення розрядної сітки).</li>
</ol>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td>
			<p>&nbsp; &nbsp;0.100111</p>

			<p>+&nbsp;<u>0.001101</u></p>

			<p>&nbsp; &nbsp;0.110100</p>
			</td>
			<td>
			<p>&nbsp; &nbsp;39</p>

			<p>+&nbsp;<u>13</u></p>

			<p>&nbsp; &nbsp;52</p>
			</td>
		</tr>
	</tbody>
</table>

<p>Р<sub>1&nbsp;</sub>&Theta; Р<sub>2&nbsp;</sub>= 0 &ndash; результат коректний і остаточний.</p>

<ol start="2" style="margin-left: 48px;">
	<li>Додавання двох додатніх чисел (з переповненням розрядної сітки).</li>
</ol>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td>
			<p>&nbsp; &nbsp;0.01101</p>

			<p>+&nbsp;<u>0.10011</u></p>

			<p>&nbsp; &nbsp;1.00000</p>
			</td>
			<td>
			<p>&nbsp; &nbsp;13</p>

			<p>+&nbsp;<u>19</u></p>

			<p>&nbsp; &nbsp;32</p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align: justify;">Р<sub>1</sub>&nbsp;&Theta; Р<sub>2</sub>&nbsp;= 1. Результат некоректний, тому що відбулося переповнення розрядної сітки. Зсуваючи число на один розряд праворуч, остаточно маємо:</p>

<p style="text-align: center;">0.100000<sub>(ПК)</sub>&nbsp;= 32<sub>(10)</sub>.</p>

<ol start="3" style="margin-left: 48px;">
	<li style="text-align: justify;">Додавання двох чисел із різними знаками (без переповнення розрядної сітки)</li>
</ol>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td>
			<p>&nbsp; &nbsp;1.001100</p>

			<p>+&nbsp;<u>0.001101</u></p>

			<p>&nbsp; &nbsp;1.011001</p>
			</td>
			<td>
			<p>-&nbsp;52</p>

			<p>+&nbsp;<u>13</u></p>

			<p>-&nbsp;39</p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align: justify;">Р<sub>1&nbsp;</sub>&Theta; Р<sub>2&nbsp;</sub>= 0. Результат коректний, але тому що він є від&rsquo;ємним, для перевірки правильності розв&rsquo;язання необхідно перетворити його у прямий код. Остаточно маємо 1.100111<sub>(ПК)</sub>&nbsp;= 39<sub>(10).</sub></p>

<ol start="4" style="margin-left: 48px;">
	<li>Додавання двох чисел, рівних за модулем і різних за знаком.</li>
</ol>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td>
			<p>&nbsp; &nbsp;1.011001</p>

			<p>+&nbsp;<u>0.100111</u></p>

			<p>&nbsp;10.000000</p>
			</td>
			<td>
			<p>- 39</p>

			<p>+&nbsp;<u>39</u></p>

			<p>&nbsp; &nbsp;0</p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align: justify;">Р<sub>1&nbsp;</sub>&Theta; Р<sub>2&nbsp;</sub>= 0. Результат коректний, якщо не брати до уваги одиницю у розряді переповнення.</p>

<p style="text-align: justify;">Додавання двох від&rsquo;ємних чисел виконується аналогічно прикладам 1, 2 (у залежності від значення виразу Р<sub>1</sub>&nbsp;&Theta; Р<sub>2.&nbsp;</sub>Тому що результат у цьому випадку завжди від&rsquo;ємний, для перевірки правильності розв&rsquo;язання необхідно перетворити його у прямий код, аналогічно прикладу 3.</p>

<p style="text-align: justify;"><strong><em>Висновки:</em></strong></p>

<ul style="margin-left: 48px;">
	<li style="text-align: justify;">Правильність виконання операцій додавання обов&#39;язково повинна перевірятися шляхом аналізу значення виразу Р<sub>1&nbsp;</sub>&Theta; Р<sub>2,</sub>&nbsp;щоб уникнути одержання некоректного результату, що виникає при переповненні розрядної сітки, при цьому: якщо Р<sub>1</sub>&nbsp;&Theta;&nbsp;Р<sub>2</sub>&nbsp;= 0, одиниця в розряді переповнення ігнорується (відкидається); якщо Р<sub>1&nbsp;</sub>&Theta; Р<sub>2</sub>&nbsp;= 1, необхідно зсунути число на один розряд праворуч.</li>
	<li style="text-align: justify;">Правило перевірки коректності результату додавання двійкових чисел також можна сформулювати в такий спосіб: якщо знак операндів однаковий, а знак суми протилежний, результат є некоректним. При додаванні двох операндів із різними знаками результат завжди коректний, якщо не брати до уваги одиницю у розряді переповнення.</li>
</ul>
', N'', N'1');
GO
INSERT INTO [dbo].[CL_Lessons] ([AuthorID], [LessonIndex], [DateCreated], [Title], [Content], [Subtitle], [Page]) VALUES (N'Azelen', N'5', N'29.04.2013', N'Алгоритми виконання арифметичних операцій', N'<p align="center"><strong>Множення і ділення двійкових чисел із фіксованою комою</strong></p>

<p style="text-align: justify;">Множення двійкових чисел завжди виконують у прямому коді. Знак добутку визначають по знакових розрядах множників згідно з таким загальновідомим правилом: <strong><em>якщо знаки операндів однакові, то знак добутку &ndash; позитивний; у протилежному випадку &ndash; знак добутку негативний.</em></strong></p>

<p style="text-align: justify;">Знак добутку двох чисел не впливає на алгоритм виконання операції множення модулів цих чисел.</p>

<p style="text-align: justify;">Часто використовують спосіб множення, процедура якого аналогічна процедурам множення вручну. У цьому випадку результат одержують додаванням часткових добутків. Кожний частковий добуток удвічі перевищує попередній, що відповідає його зсуванню ліворуч на один розряд.</p>

<p>Характерно, що розрядність добутку двійкових чисел удвічі перевищує розрядність співмножників. Якщо у множенні беруть участь мантиси, тобто правильні дроби, то молодші розряди, що виходять за межі розрядної сітки, можуть бути відкинуті без округлення або з округленням.</p>

<p style="text-align: justify;">Операція ділення також виконується способом, аналогічним застосовуваному при діленні вручну, що наочно ілюструє приклад ділення двох чисел 506 : 23 = 22, тобто 0.111111010 : 0.10111 = 0.10110. Знак частки визначають аналогічно знаку добутку. Застосоване при діленні віднімання дільника виконують шляхом додавання його додаткового коду.</p>

<table border="0" class="BodyTable">
	<tbody>
		<tr>
			<td>0. 1 1 1 1 1 1 0 1 0</td>
			<td>&nbsp; &nbsp;ділене додатнє</td>
		</tr>
		<tr>
			<td>1. 0 1 0 0 1</td>
			<td>&nbsp; &nbsp;перше віднімання дільника</td>
		</tr>
		<tr>
			<td><span style="border-top: 1px solid">0 &nbsp;0.1 0 0 0 1</span></td>
			<td>&nbsp; &nbsp;1 -&nbsp;додатній&nbsp;<span style="line-height: 1.6em;">результат&nbsp;</span></td>
		</tr>
		<tr>
			<td>&nbsp; &nbsp; 1.0 1 0 0 1</td>
			<td>&nbsp; &nbsp;друге віднімання дільника</td>
		</tr>
		<tr>
			<td>&nbsp; &nbsp; 1 1.1 0 1 0 0</td>
			<td>&nbsp; &nbsp;0 - від&#39;ємний результат</td>
		</tr>
		<tr>
			<td>&nbsp; &nbsp; &nbsp; &nbsp;0.1 0 1 1 1</td>
			<td>&nbsp; &nbsp;додавання дільника</td>
		</tr>
		<tr>
			<td>&nbsp; &nbsp; <span style="border-top: 1px solid">1 0 0 1 0 1 1 1</span></td>
			<td>&nbsp; &nbsp;1 - додатній результат</td>
		</tr>
		<tr>
			<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1 0 1 0 0 1</td>
			<td>&nbsp; &nbsp;третє віднімання дільника</td>
		</tr>
		<tr>
			<td>&nbsp; &nbsp; &nbsp; &nbsp;<span style="border-top: 1px solid">1 0 0 0 0 0 0</span></td>
			<td>&nbsp; &nbsp;1 - остача дорівнює 0</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p style="text-align: justify;">У даному прикладі використаний так названий алгоритм без відновлення остачі, що передбачає таку послідовність дій:</p>

<ul style="margin-left: 48px;">
	<li style="text-align: justify;">із діленого віднімається дільник (додається дільник, записаний у додатковому коді);</li>
	<li style="text-align: justify;">якщо остача додатня, перша цифра частки дорівнює одиниці, у протилежному випадку &ndash; 0;</li>
	<li style="text-align: justify;">остача зсувається ліворуч, і до неї додається дільник із знаком, зворотним знаку остачі;</li>
	<li style="text-align: justify;">знак наступної остачі визначає наступну цифру частки;</li>
	<li style="text-align: justify;">ці дії повторюють доти, поки не утвориться необхідне число розрядів частки або нульова остача.</li>
</ul>

<p style="text-align: justify;">Слід зазначити, що оскільки даний алгоритм передбачає додавання чисел (остач і дільника) тільки з протилежними знаками, то всі розряди проміжних сум, старші за знаковий, слід ігнорувати.</p>

<p style="text-align: justify;">&nbsp;</p>

<p align="center"><strong>Виконання арифметичних операцій у пристроях із &laquo;плавучою&raquo; комою</strong></p>

<p style="text-align: justify;">Операція додавання у пристроях із &laquo;плавучою&raquo; комою відбувається у чотири етапи:</p>

<ol style="margin-left: 48px;">
	<li style="text-align: justify;">Порівнюються порядки доданків: менший порядок збільшується до більшого. При цьому відповідним чином корегується мантиса числа, яке перетворюється.</li>
	<li style="text-align: justify;">Виконується перетворення мантис у додаткові коди.</li>
	<li style="text-align: justify;">Виконується додавання мантис за правилами, розглянутими вище для чисел із фіксованої комою.</li>
	<li style="text-align: justify;">До суми приписується порядок доданків і, в разі необхідності, виконується нормалізація результату.</li>
</ol>

<p style="text-align: justify;">Операція множення чисел, поданих у формі з &laquo;плавучою&raquo; комою також виконується у чотири етапи:</p>

<ol style="margin-left: 48px;">
	<li style="text-align: justify;">Визначається знак добутку.</li>
	<li style="text-align: justify;">Перемножуються мантиси співмножників за правилами для чисел із фіксованої комою.</li>
	<li style="text-align: justify;">Обчислюється порядок добутку алгебраїчним додаванням порядків співмножників за правилами додавання цілих чисел із знаком.</li>
	<li style="text-align: justify;">Виконується нормалізація отриманого результату у випадку її необхідності.</li>
</ol>

<p style="text-align: justify;">Ділення чисел у пристроях із &laquo;плавучою&raquo; комою виконується так само, як і множення.</p>
', N'', N'2');
GO

-- ----------------------------
-- Table structure for [dbo].[CL_Marks]
-- ----------------------------
DROP TABLE [dbo].[CL_Marks]
GO
CREATE TABLE [dbo].[CL_Marks] (
[Username] char(24) NULL ,
[TestID] int NOT NULL ,
[Mark] tinyint NULL ,
[DatePassed] varchar(20) NULL ,
[GroupID] int NOT NULL 
)


GO

-- ----------------------------
-- Records of CL_Marks
-- ----------------------------
INSERT INTO [dbo].[CL_Marks] ([Username], [TestID], [Mark], [DatePassed], [GroupID]) VALUES (N'Izgilian                ', N'65', N'20', N'15.04.2013 14:28:47', N'34');
GO

-- ----------------------------
-- Table structure for [dbo].[CL_TestAnswers]
-- ----------------------------
DROP TABLE [dbo].[CL_TestAnswers]
GO
CREATE TABLE [dbo].[CL_TestAnswers] (
[ChoiceID] int NOT NULL IDENTITY(1,1) ,
[ChoiceText] nvarchar(MAX) NULL ,
[IsCorrect] bit NULL ,
[QuestionID] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[CL_TestAnswers]', RESEED, 756)
GO

-- ----------------------------
-- Records of CL_TestAnswers
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CL_TestAnswers] ON
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'94', N'Джон Негер', N'0', N'104');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'95', N'Джон Репер', N'0', N'104');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'96', N'Блез Паскаль', N'0', N'104');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'97', N'Джон Непер', N'1', N'104');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'98', N'зубчастих коліщатах', N'0', N'105');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'99', N'електронних лампах', N'1', N'105');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'100', N'транзисторах', N'0', N'105');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'101', N'Вільгельму Лейбніцу', N'0', N'106');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'102', N'Блезу Паскалю', N'0', N'106');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'103', N'Сергію Лєбєдєву', N'0', N'106');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'104', N'Чарльзу Бебіджу', N'1', N'106');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'105', N'Стефан Возняк', N'0', N'107');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'106', N'В. М. Глушков', N'0', N'107');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'107', N'Сергій Лєбєдєв', N'1', N'107');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'108', N'Катерина Рвачева', N'0', N'107');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'109', N'мікропроцесор', N'0', N'108');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'110', N'десяткову систему числення', N'0', N'108');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'111', N'двійкову систему числення', N'1', N'108');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'112', N'палички Непера', N'0', N'108');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'113', N'Сергієм Лєбєдєвим у 1951 році в Києві', N'0', N'109');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'114', N'Аланом Тьюрингом в Англії в 1944 році', N'0', N'109');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'115', N'Джоном Моучлі та Преспером Еккертом в США в 1946 році', N'1', N'109');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'116', N'Готфріду Лейбніцу', N'0', N'110');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'117', N'Леонардо да Вінчі', N'1', N'110');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'118', N'Джону Неперу', N'0', N'110');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'119', N'Мікеланджело Буанаротті', N'0', N'110');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'120', N'наявність транзисторів, програмування алгоритмічними мовами', N'0', N'111');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'121', N'наявність мікропроцесора, логічно-орієнтоване програмування', N'0', N'111');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'122', N'надвеликі інтегральні схеми, висока надійність', N'0', N'111');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'123', N'наявність електронних ламп, програмування на машинних кодах', N'1', N'111');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'124', N'наявність інтегральних схем', N'0', N'111');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'125', N'Блез Паскаль', N'0', N'112');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'126', N'Герберт Віннер', N'0', N'112');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'127', N'Чарльз Беббідж', N'1', N'112');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'128', N'Жозеф Жаккард', N'0', N'113');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'129', N'Алан Тьюринг', N'0', N'113');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'130', N'Джон Атанасов', N'1', N'113');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'131', N'Конрад Цузе', N'0', N'113');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'132', N'Готфрід Лейбніц', N'0', N'114');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'133', N'Конрад Цузе', N'0', N'114');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'134', N'Блез Паскаль', N'0', N'114');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'135', N'Жозеф Жаккард', N'1', N'114');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'136', N'логарифмічна лінійка', N'0', N'115');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'137', N'аналітична машина', N'0', N'115');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'138', N'паскаліна', N'0', N'115');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'139', N'абак', N'1', N'115');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'140', N'введення інформації', N'0', N'116');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'141', N'виконання лише логічних операцій', N'0', N'116');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'142', N'всіх можливих видів обробки інформації', N'1', N'116');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'143', N'Жозеф Жаккард', N'0', N'117');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'144', N'Алан Тьюринг', N'0', N'117');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'145', N'Конрад Цузе', N'1', N'117');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'146', N'Вільгельм Шикард', N'0', N'117');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'147', N'аналітичну машину', N'0', N'118');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'148', N'табулюючу обчислювальну машину', N'0', N'118');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'149', N'логічну машину', N'1', N'118');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'150', N'Джорджем Байроном', N'0', N'119');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'151', N'Готфрідом Лейбніцом', N'0', N'119');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'152', N'Адою Роговцевою', N'0', N'119');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'153', N'Адою Лавлейс', N'1', N'119');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'154', N'наявність електронних ламп, програмування на машинних кодах', N'0', N'120');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'155', N'наявність мікропроцесора, логічно-орієнтоване програмування', N'0', N'120');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'156', N'надвеликі інтегральні схеми, висока надійність', N'0', N'120');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'157', N'наявність транзисторів, програмування алгоритмічними мовами', N'1', N'120');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'158', N'наявність інтегральних схем', N'0', N'120');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'159', N'1883р.', N'0', N'121');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'160', N'1945р.', N'1', N'121');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'161', N'1955р.', N'0', N'121');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'162', N'1969р.', N'0', N'121');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'163', N'електронні лампи', N'0', N'122');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'164', N'транзистор', N'0', N'122');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'165', N'інтегральні схеми', N'0', N'122');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'166', N'мікропроцесор', N'1', N'122');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'167', N'вони мають графічний інтерфейс', N'0', N'123');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'168', N'вони мають закриту архітектуру', N'0', N'123');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'169', N'вони призначені для виконання арифметичних операцій', N'0', N'123');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'170', N'програма, створена на одному комп''ютері, буде працювати на іншому', N'1', N'123');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'171', N'Z-1', N'0', N'124');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'172', N'Аналітична машина', N'0', N'124');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'173', N'Колоссос', N'1', N'124');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'174', N'ЕНІАК', N'0', N'124');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'175', N'двійкова система числення', N'0', N'125');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'176', N'десяткова система числення', N'1', N'125');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'177', N'вісімкова система числення', N'0', N'125');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'178', N'шістнадцяткова система числення', N'0', N'125');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'179', N'наявність транзисторів, програмування алгоритмічними мовами', N'0', N'126');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'180', N'наявність мікропроцесора, логічно-орієнтоване програмування', N'0', N'126');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'181', N'надвеликі інтегральні схеми, висока надійність', N'0', N'126');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'182', N'електронні лампи, програмування на машинних кодах', N'0', N'126');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'183', N'наявність інтегральних схем', N'1', N'126');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'184', N'англійський вчений Алан Тьюринг', N'0', N'127');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'185', N'німецький студент Конрад Цузе', N'0', N'127');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'186', N'український винахідник Сергій Лєбєдєв', N'0', N'127');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'187', N'болгарський винахідник Джон Атанасов', N'1', N'127');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'188', N'IBM', N'0', N'128');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'189', N'Apple', N'1', N'128');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'190', N'Macintosh', N'0', N'128');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'191', N'Microsoft', N'0', N'128');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'267', N'Чарльза Бебіджа', N'0', N'151');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'268', N'Конрада Цузе', N'0', N'151');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'269', N'Ади Лавлейс', N'1', N'151');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'270', N'Стефана Возняка', N'0', N'151');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'271', N'електронні і логічні', N'0', N'152');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'272', N'арифметичні і логічні; механічні, логічні, електронні', N'0', N'152');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'273', N'механічні, електро-механічні; електронні', N'1', N'152');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'274', N'в 1945р.', N'0', N'153');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'275', N'в 1945р.', N'0', N'153');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'276', N'в 1951р.', N'1', N'153');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'277', N'той, що обчислює', N'1', N'154');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'278', N'той, що працює', N'0', N'154');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'279', N'той, що перекладає', N'0', N'154');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'280', N'той, що керує', N'0', N'154');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'281', N'Альтаир', N'0', N'155');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'282', N'БЕСМ', N'0', N'155');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'283', N'ЮНИВАК', N'0', N'155');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'284', N'МЕОМ', N'1', N'155');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'285', N'наявність транзисторів, програмування алгоритмічними мовами', N'0', N'156');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'286', N'наявність інтегральних схем', N'0', N'156');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'287', N'надвеликі інтегральні схеми, висока надійність', N'1', N'156');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'288', N'електронні лампи, програмування на машинних кодах', N'0', N'156');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'289', N'наявність мікропроцесора, логічно-орієнтоване програмування', N'0', N'156');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'290', N'абак', N'0', N'157');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'291', N'пристрої вводу і виводу, арифметичний пристрій, пристрій управління', N'0', N'157');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'292', N'пристрої вводу, виводу, керування, запам''ятовуючий пристрій, арифметичний пристрій', N'1', N'157');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'293', N'арифметичний пристрій, пристрій управління', N'0', N'157');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'294', N'ІВМ', N'0', N'158');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'295', N'Miscrosoft', N'0', N'158');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'296', N'Apple', N'1', N'158');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'297', N'Альтаир', N'0', N'158');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'298', N'в 1945р.', N'0', N'159');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'299', N'в 1945р.', N'0', N'159');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'300', N'в 1951р.', N'1', N'159');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'301', N'першого покоління', N'0', N'160');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'302', N'другого покоління', N'0', N'160');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'303', N'третього покоління', N'1', N'160');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'304', N'четвертого покоління', N'0', N'160');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'305', N'п''ятого покоління', N'0', N'160');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'306', N'біти, байти, гігабайти', N'0', N'161');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'307', N'вати, кіловати', N'0', N'161');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'308', N'біти, байти, кілобайти, мегабайти,  гігабайти, терабайти', N'1', N'161');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'309', N'послідовності із нулів та одиниць', N'0', N'161');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'310', N'десятковій формі', N'0', N'162');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'311', N'двійковій формі', N'1', N'162');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'312', N'шістнадцятковій формі', N'0', N'162');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'313', N'вісімковій формі', N'0', N'162');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'314', N'бірка', N'0', N'163');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'315', N'рахівниця', N'0', N'163');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'316', N'абак', N'1', N'163');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'317', N'наявність транзисторів, програмування алгоритмічними мовами', N'0', N'164');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'318', N'наявність інтегральних схем', N'0', N'164');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'319', N'надвеликі інтегральні схеми, висока надійність', N'0', N'164');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'320', N'електронні лампи, програмування на машинних кодах', N'0', N'164');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'321', N'наявність мікропроцесора, логічно-орієнтоване програмування', N'1', N'164');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'322', N'арифметико-логічний пристрій', N'0', N'165');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'323', N'електронні лампи', N'1', N'165');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'324', N'транзистори', N'0', N'165');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'325', N'резистори', N'0', N'165');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'326', N'Сергій Лєбєдєв і В.М. Глушков', N'0', N'166');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'327', N'Стефан Возняк і Стівен Джобс', N'0', N'166');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'328', N'Павло Хрущов і Олександр Щукарєв', N'1', N'166');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'329', N'двійкова система числення, тобто послідовність із нулів та одиниць', N'0', N'167');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'330', N'зубчасте колесо, розраховане на фiксацiю 10 цифр десяткової системи числення', N'1', N'167');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'331', N'арифметико-логічний пристрій', N'0', N'167');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'332', N'оператор умовного переходу', N'0', N'167');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'333', N'персональної машини класу «Macintosh»', N'0', N'168');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'334', N'ПК «Pentium»', N'0', N'168');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'335', N'ПК «Apple»', N'1', N'168');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'336', N'ЕОМ «Альтаир»', N'0', N'168');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'337', N'в Англії за участю Алана Тьюринга', N'1', N'169');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'338', N'у Франції винахідником Жозефом Жакартом', N'0', N'169');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'339', N'в Україні П.Д. Хрущовим і О.М. Щукарєвим', N'0', N'169');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'340', N'німецьким студентом Конрадом Цузе', N'0', N'169');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'341', N'в Україні у 1951 р. під керівництвом Сергія Лєбєдєва', N'0', N'170');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'342', N'в США у 1945 р. під керівницт¬вом Джона Моучлі та Проспера Еккерта', N'1', N'170');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'343', N'в Англії  у 1949 р.  під керівництвом  Моріса Віліса', N'0', N'170');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'344', N'Павла Хрущова', N'0', N'171');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'345', N'Сергія Лєбєдєва', N'1', N'171');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'346', N'Олександра Щукарєва', N'0', N'171');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'347', N'10 поколінь ЕОМ', N'0', N'172');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'348', N'4-5  поколінь ЕОМ', N'1', N'172');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'349', N'3 покоління ЕОМ', N'0', N'172');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'350', N'4 покоління ЕОМ', N'0', N'172');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'351', N'Чарльз Бебідж', N'1', N'173');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'352', N'Алан Тьюринг', N'0', N'173');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'353', N'Блез Паскаль', N'0', N'173');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'354', N'Сергій Лєбєдєв', N'0', N'173');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'355', N'Джорджем Байроном', N'0', N'174');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'356', N'Готфрідом Ляйбніцем', N'0', N'174');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'357', N'Адою Роговцевою', N'0', N'174');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'358', N'Адою Лавлейс', N'1', N'174');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'359', N'у 1883p.', N'0', N'175');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'360', N'у 1945p.', N'1', N'175');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'361', N'у 1955p.', N'0', N'175');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'362', N'у 1969p.', N'0', N'175');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'430', N'Кон''юнкція', N'0', N'193');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'431', N'Диз''юнкція', N'1', N'193');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'432', N'Заперечення', N'0', N'193');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'433', N'Імплікація', N'0', N'193');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'434', N'В двійковій системі числення 1 + 1 = 10', N'0', N'194');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'435', N'1 байт = 8 біт', N'0', N'194');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'436', N'Кожний паралелограм є прямокутником', N'1', N'194');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'437', N'Похідна від sinx буде cosx', N'0', N'194');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'438', N'C^B^A', N'0', N'195');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'439', N'<span style="border-top: 1px solid">A</span>vB^C', N'0', N'195');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'440', N'<span style="border-top: 1px solid">C</span>^AvB', N'1', N'195');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'441', N'<span style="border-top: 1px solid">A</span>vВvС', N'0', N'195');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'442', N'Вислів', N'1', N'196');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'443', N'Вираз', N'0', N'196');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'444', N'Запитання', N'0', N'196');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'445', N'Твердження', N'0', N'196');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'446', N'Кон''юнкція', N'0', N'197');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'447', N'Еквіваленція', N'1', N'197');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'448', N'Заперечення', N'0', N'197');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'449', N'Імплікація', N'0', N'197');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'450', N'логічне додавання', N'0', N'198');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'451', N'логічне слідування', N'0', N'198');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'452', N'логічне множення', N'1', N'198');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'453', N'логічне ділення', N'0', N'198');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'454', N'логічне додавання', N'1', N'199');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'455', N'логічне слідування', N'0', N'199');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'456', N'логічне множення', N'0', N'199');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'457', N'логічне ділення', N'0', N'199');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'458', N'Логіка', N'0', N'200');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'459', N'Схемотехніка', N'0', N'200');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'460', N'Алгебра', N'0', N'200');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'461', N'Алгебра логіки', N'1', N'200');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'462', N'^', N'1', N'201');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'463', N'v', N'0', N'201');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'464', N':', N'0', N'201');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'465', N'->', N'0', N'201');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'466', N'<->', N'0', N'201');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'467', N'^', N'0', N'202');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'468', N'v', N'1', N'202');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'469', N':', N'0', N'202');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'470', N'->', N'0', N'202');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'471', N'<->', N'0', N'202');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'472', N'0', N'0', N'203');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'473', N'самій змінній', N'1', N'203');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'474', N'1', N'0', N'203');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'475', N'оберненій змінній', N'0', N'203');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'476', N'^', N'0', N'204');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'477', N'v', N'0', N'204');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'478', N':', N'0', N'204');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'479', N'->', N'1', N'204');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'480', N'<->', N'0', N'204');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'481', N'Кон''юнкція', N'0', N'205');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'482', N'Диз''юнкція', N'0', N'205');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'483', N'Заперечення', N'0', N'205');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'484', N'Імплікація', N'1', N'205');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'485', N'не А і не В', N'1', N'206');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'486', N'не (А і В)', N'0', N'206');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'487', N'А і не В', N'0', N'206');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'488', N'не А або не В', N'0', N'206');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'489', N'Арістотель', N'0', N'207');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'490', N'Джордж Буль', N'1', N'207');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'491', N'Чарльз Беббідж', N'0', N'207');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'492', N'Демокріт', N'0', N'207');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'493', N'0', N'1', N'208');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'494', N'2', N'0', N'208');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'495', N'10', N'0', N'208');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'496', N'1', N'0', N'208');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'497', N'Хибне', N'0', N'209');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'498', N'Хибне та істина', N'0', N'209');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'499', N'Істина', N'1', N'209');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'500', N'Заперечення', N'0', N'209');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'525', N'П. Еренфест', N'1', N'218');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'526', N'І. Ньютон', N'0', N'218');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'527', N'М. Ломоносов', N'0', N'218');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'528', N'М. Гаврилів', N'0', N'218');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'529', N'регістр', N'0', N'219');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'530', N'комірка', N'0', N'219');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'531', N'вентиль', N'1', N'219');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'532', N'схема', N'1', N'220');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'533', N'рисунок', N'0', N'220');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'534', N'креслення', N'0', N'220');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'535', N'графік', N'0', N'220');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'536', N'конюнктор', N'1', N'221');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'537', N'дизюнктор', N'0', N'221');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'538', N'інвертор', N'0', N'221');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'539', N'1', N'1', N'222');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'540', N'0', N'0', N'222');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'541', N'10', N'0', N'222');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'542', N'11', N'0', N'222');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'543', N'інвертор', N'0', N'223');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'544', N'конюнктор', N'0', N'223');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'545', N'дизюнктор', N'1', N'223');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'546', N'імплікатор', N'0', N'223');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'547', N'кількість сигналів на вході схеми', N'0', N'224');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'548', N'кількість сигналів на виході схеми', N'0', N'224');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'549', N'кількість базових логічних операцій', N'1', N'224');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'550', N'кількість вентилів', N'0', N'224');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'551', N'кількість сигналів на вході схеми', N'0', N'225');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'552', N'кількість сигналів на виході схеми', N'0', N'225');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'553', N'кількість базових логічних операцій', N'0', N'225');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'554', N'кількість вентилів', N'1', N'225');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'555', N'так', N'0', N'226');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'556', N'ні', N'1', N'226');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'557', N'F=(A&B)vA', N'0', N'227');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'558', N'F=(AvB)&B', N'1', N'227');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'559', N'F=B&A&A', N'0', N'227');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'560', N'F=AvBvB', N'0', N'227');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'561', N'П. Енерфест', N'0', N'228');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'562', N'І. Ньютон', N'1', N'228');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'563', N'М. Ломоносов', N'0', N'228');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'564', N'М. Гаврилів', N'0', N'228');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'565', N'регістр', N'0', N'229');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'566', N'комірка', N'0', N'229');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'567', N'вентиль', N'1', N'229');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'568', N'схема', N'1', N'230');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'569', N'рисунок', N'0', N'230');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'570', N'креслення', N'0', N'230');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'571', N'графік', N'0', N'230');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'572', N'конюнктор', N'0', N'231');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'573', N'дизюнктор', N'1', N'231');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'574', N'інвертор', N'0', N'231');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'575', N'1', N'1', N'232');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'576', N'0', N'0', N'232');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'577', N'10', N'0', N'232');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'578', N'11', N'0', N'232');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'579', N'інвертор', N'0', N'233');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'580', N'конюнктор', N'0', N'233');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'581', N'дизюнктор', N'1', N'233');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'582', N'імплікатор', N'0', N'233');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'583', N'кількість сигналів на вході схеми', N'0', N'234');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'584', N'кількість сигналів на виході схеми', N'0', N'234');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'585', N'кількість базових логічних операцій', N'1', N'234');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'586', N'кількість вентилів', N'0', N'234');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'587', N'кількість сигналів на вході схеми', N'0', N'235');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'588', N'кількість сигналів на виході схеми', N'0', N'235');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'589', N'кількість базових логічних операцій', N'0', N'235');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'590', N'кількість вентилів', N'1', N'235');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'591', N'так', N'1', N'236');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'592', N'ні', N'0', N'236');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'593', N'F=(A&B)vA', N'0', N'237');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'594', N'F=(AvB)&B', N'0', N'237');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'595', N'F=B&A&A', N'0', N'237');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'596', N'F=AvBvB', N'1', N'237');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'613', N'алгебра', N'0', N'242');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'614', N'геометрія', N'0', N'242');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'615', N'філософія', N'0', N'242');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'616', N'логіка', N'1', N'242');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'617', N'вираз', N'1', N'243');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'618', N'запитання', N'0', N'243');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'619', N'висловлення', N'0', N'243');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'620', N'підсумок', N'0', N'243');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'621', N'брехня', N'0', N'244');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'622', N'істина', N'1', N'244');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'623', N'правда', N'0', N'244');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'624', N'неправда', N'0', N'244');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'625', N'Париж - столиця Англії', N'0', N'245');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'626', N'3+5=2+4', N'0', N'245');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'627', N'II+IV=VI', N'1', N'245');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'628', N'томатний сік шкідливий', N'0', N'245');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'629', N'інверсія', N'1', N'246');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'630', N'конюнкцція', N'0', N'246');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'631', N'дизюнкція', N'0', N'246');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'632', N'імплікація', N'0', N'246');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'633', N'1', N'1', N'247');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'634', N'0', N'0', N'247');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'635', N'10', N'0', N'247');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'636', N'2', N'0', N'247');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'637', N'конюнкція', N'1', N'248');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'638', N'дизюнкція', N'0', N'248');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'639', N'інверсія', N'0', N'248');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'640', N'еквівалентність', N'0', N'248');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'641', N'де Моргана', N'1', N'249');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'642', N'непротиворіччя', N'0', N'249');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'643', N'комутативності', N'0', N'249');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'644', N'асоціативності', N'0', N'249');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'645', N'0', N'0', N'250');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'646', N'1', N'0', N'250');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'647', N'самій змінній', N'1', N'250');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'648', N'протилежне до даної змінної', N'0', N'250');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'649', N'таблиця неправильності', N'0', N'251');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'650', N'таблиця істинності', N'1', N'251');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'651', N'таблиця значень', N'0', N'251');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'652', N'таблиця відповідей', N'0', N'251');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'717', N'наука про твердження та роздуми', N'0', N'268');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'718', N'наука, що вивчає закони і методи накопичення, обробки та збереження інформації за допомогою ЕОМ', N'0', N'268');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'719', N'наука про форми та закони людського мислення', N'1', N'268');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'720', N'наука, що займається вивченням логічних основ роботи компютера', N'0', N'268');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'721', N'простий вираз', N'1', N'269');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'722', N'складний вираз', N'0', N'269');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'723', N'запитальне речення', N'0', N'269');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'724', N'логічна операція', N'0', N'269');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'725', N'0', N'1', N'270');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'726', N'1', N'0', N'270');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'727', N'2', N'0', N'270');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'728', N'неправда', N'0', N'270');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'729', N'Париж - столиця Англії', N'0', N'271');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'730', N'3+5=2+4', N'0', N'271');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'731', N'II+IV=VI', N'1', N'271');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'732', N'томатний сік шкідливий', N'0', N'271');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'733', N'логічне ділення', N'1', N'272');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'734', N'логічне додавання', N'0', N'272');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'735', N'логічне множення', N'0', N'272');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'736', N'логічне заперечення', N'0', N'272');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'737', N'1', N'1', N'273');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'738', N'0', N'0', N'273');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'739', N'10', N'0', N'273');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'740', N'2', N'0', N'273');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'741', N'неА & неВ', N'1', N'274');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'742', N'А & неВ', N'0', N'274');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'743', N'не(А&В)', N'0', N'274');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'744', N'неА v неВ', N'0', N'274');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'745', N'інверсія', N'1', N'275');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'746', N'конюнкція', N'0', N'275');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'747', N'дизюнкція', N'0', N'275');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'748', N'імплікація', N'0', N'275');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'749', N'таблиця брехні', N'0', N'276');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'750', N'таблиця істинності', N'1', N'276');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'751', N'таблиця значень', N'0', N'276');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'752', N'таблиця відповідей', N'0', N'276');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'753', N'інверсія', N'1', N'277');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'754', N'конюнкція', N'0', N'277');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'755', N'дизюнкція', N'0', N'277');
GO
INSERT INTO [dbo].[CL_TestAnswers] ([ChoiceID], [ChoiceText], [IsCorrect], [QuestionID]) VALUES (N'756', N'імплікація', N'0', N'277');
GO
SET IDENTITY_INSERT [dbo].[CL_TestAnswers] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[CL_TestQuestions]
-- ----------------------------
DROP TABLE [dbo].[CL_TestQuestions]
GO
CREATE TABLE [dbo].[CL_TestQuestions] (
[QuestionID] int NOT NULL IDENTITY(1,1) ,
[QuestionText] nvarchar(MAX) NULL ,
[TestID] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[CL_TestQuestions]', RESEED, 277)
GO

-- ----------------------------
-- Records of CL_TestQuestions
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CL_TestQuestions] ON
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'104', N'Логарифми, які ввійшли в основу логарифмічної лінійки у 1614 році винайшов:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'105', N'Перші обчислювальні пристрої базувалися на:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'106', N'Винахід Аналітичної машини належить:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'107', N'Винахідником першої ЕОМ в Україні був:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'108', N'Німецький студент Конрад Цузе, працюючи над дипломним проектом, вперше при розробці обчислювальної машини використав:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'109', N'ЕОМ ENIAK було розроблено:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'110', N'Перший у свiтi ескiзний малюнок тринадцятирозрядного десяткового пiдсумовуючого пристрою належить:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'111', N'ЕОМ першого покоління характеризуються:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'112', N'Першу обчислювальну машину з запам''ятовуючим пристроєм створив:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'113', N'Вперше запропонував ідею використання електронних ламп як носіїв інформації в ЕОМ:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'114', N'Він здійснив "програмне" за допомогою перфокарт керування ткацьким верстатом', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'115', N'Найдавніший пристрій для обчислень - це:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'116', N'Мікропроцесор - це пристрій для:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'117', N'Вперше в обчислюваній машині використав двійкову систему числення:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'118', N'Англійський математик Джевонс сконструював першу у світі:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'119', N'Першу в світі програму було написано:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'120', N'ЕОМ другого покоління характеризуються:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'121', N'Перша діюча ЕОМ була створена у:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'122', N'У 1969 році Едвард Гофф, працюючи над створенням інтегрованого пристрою для мікрокалькулятора винайшов:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'123', N'Що означає що електронно-обчислювальні машини є ІВМ-сумісними:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'124', N'Алан Тьюринг розробив обчислювальну машину, яка призначалася для розшифрування радіограм, під назвою', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'125', N'Основою перших електронно-обчислювальних пристроїв була', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'126', N'ЕОМ третього покоління характеризуються:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'127', N'Вперше у свiтi застосував електроннi лампи до розробки спецiалiзованого комп''ютера (300 ламп):', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'128', N'Персональна машина Macintosh є винаходом фірми:', N'65');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'151', N'З чиїм імям повязана професія програміст', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'152', N'Обчислювальні пристрої історично поділяють на:', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'153', N'Перша діюча ЕОМ в Україні була створена у:', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'154', N'В перекладі з англійської слово компютер означає:', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'155', N'Перша українська ЕОМ називалася:', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'156', N'ЕОМ четвертого покоління характеризуються:', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'157', N'Складовими аналітичної машини Чарльза Бебіджа були', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'158', N'В основі винаходу персонального компютера якої фірми був виходець із Тернопілля Стефан Возняк', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'159', N'Перша діюча ЕОМ в Україні була створена у:', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'160', N'Поява інтегральних схем започаткувала появу обчислювальних машин', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'161', N'Основними одиницями вимірювання інформації є', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'162', N'Вся інформація в пам''яті сучасного компютера зберігається в', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'163', N'Дошка для обрахунків, на якій числа зображувались певною кількістю камінців, а дії над числами виконувались пересуванням камінців, має назву', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'164', N'ЕОМ п''ятого покоління характеризуються', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'165', N'Основним робочим елементом перших ЕОМ був', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'166', N'В Україні розробкою логічних машин займалися', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'167', N'Основою практично усiх винайдених за перших 5 столiть розвитку обчислювальних пристроїв є', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'168', N'Стефан Возняк, був винахідником', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'169', N'Обчислювальна машина "Колоссус", яка призначалася для розшифровування радiограм було створено', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'170', N'Першу універсальну електронну обчислювальну машину (ЕОМ «ЕНІАК») було створено', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'171', N'Під чиїм керівництвом була створена перша ЕОМ в континентальній Європі', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'172', N'На сьогоднішній день розрізняють', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'173', N'Кого називають  «батьком компютера»', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'174', N'Першу в світі програму було написано', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'175', N'Перша діюча ЕОМ була створена у', N'72');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'193', N'Синонімом назви логічної операції АБО є слово', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'194', N'Який із висловів хибний', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'195', N'Логічні величини А, В, С приймають наступні значення: А = 1, В = 0, С=0. Визначити, який із логічних виразів істинний', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'196', N'Розповідне речення, в якому щось стверджується або заперечується', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'197', N'Синонімом назви логічної операції Тотожність є слово', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'198', N'Логічна операція кон''юнкція є позначенням наступної дії', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'199', N'Логічна операція диз’юнкція є позначенням наступної дії', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'200', N'Наука про вислови і логічні операції над ними', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'201', N'Логічна операція кон’юнкція позначається наступним символом', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'202', N'Логічна операція диз’юнкція позначається наступним символом', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'203', N'Подвійне заперечення логічної змінної дорівнює', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'204', N'Логічна операція тотожність позначається наступним символом', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'205', N'Синонімом назви логічної операції Логічне слідування є слово', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'206', N'Значення логічного виразу <span style="border-top: 1px solid">AvB</span> згідно закону де Моргана дорівнює', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'207', N'Хто був основоположником науки Логіка', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'208', N'Яким символом кодується логічна змінна, яка приймає значення «Хибне»', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'209', N'Логічна формула є тотожно-істинною, якщо вона приймає при всіх наборах змінних значення', N'74');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'218', N'Хто із вчених довів, що теорія релейно-контактних схем не утопія', N'77');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'219', N'Пристрій, що реалізує базову логічну операцію називається', N'77');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'220', N'Графічне зображення логічного виразу називається', N'77');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'221', N'На малюнку зображено логічний елемент <br /><img src="../Source/img/img_062.png"></img>', N'77');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'222', N'Визначити сигнал на виході із схеми: <br /><img src="../Source/img/img_063.png"></img>', N'77');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'223', N'Визначити базові логічні елементи схеми:<br><img src="../Source/img/img_064.png"></img>', N'77');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'224', N'Кількість логічних змінних у логічному виразі визначає', N'77');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'225', N'Кількість базових логічних операцій в логічному виразі визначає', N'77');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'226', N'Чи відповідає логічній схемі логічний вираз F=(F&B&C)?<br><img src="../Source/img/img_065.png"></img>', N'77');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'227', N'Який із логічних виразів відповідає логічній схемі?<br><img src="../Source/img/img_066.png"></img>', N'77');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'228', N'Хто із вчених стверджував, що теорія релейно-контактних схем утопія', N'78');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'229', N'Пристрій, який реалізує базову логічну операцію називається', N'78');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'230', N'Графічне зображення логічного елементу називається', N'78');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'231', N'На малюнку зображено логічний елемент<br><img src="../Source/img/img_067.png"></img>', N'78');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'232', N'Визначити сигнал на виході із схеми:<br><img src="../Source/img/img_068.png"></img>', N'78');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'233', N'Визначте вентиль схеми:<br><img src="../Source/img/img_069.png"></img>', N'78');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'234', N'Кількість логічних змінних у логічному виразі визначає', N'78');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'235', N'Кількість базових логічних операцій в логічному виразі визначає', N'78');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'236', N'Чи відповідає логічній схемі логічний вираз F=(F&BvC)?<br><img src="../Source/img/img_070.png"></img>', N'78');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'237', N'Який із логічних виразів відповідає наведеній логічній схемі?<br><img src="../Source/img/img_071.png"></img>', N'78');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'242', N'Наука, що вивчає форми та закони мислення, називається', N'80');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'243', N'Розповідне речення, в якому якому щось стверджується чи заперечується називається', N'80');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'244', N'Константа, що позначається "1" в алгебрі-логіці називається', N'80');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'245', N'Яке із наступних тверджень є істинним', N'80');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'246', N'Об''єднання двох виразів в один за допомогою "І"', N'80');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'247', N'Чому дорівнює логічний вираз (1v1)&(0v0)>', N'80');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'248', N'Яка із логічних операцій не є базовою', N'80');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'249', N'Який логічний закон записано? A&<span style="border-top: 1px solid">A', N'80');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'250', N'Подвійне заперечення логічної змінної дорівнює', N'80');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'251', N'Таблиця, що містить всі можливі значення логічного виразу, називається', N'80');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'268', N'Що таке логіка', N'83');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'269', N'Логічна функція - це', N'83');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'270', N'Як кодується логічна змінна, що приймає значення "Неправда"', N'83');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'271', N'Яке із наступних тверджень є істинним', N'83');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'272', N'Логічною операцією не є', N'83');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'273', N'Чому дорівнює логічний вираз (1v1)&(0v0)>', N'83');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'274', N'Значення логічного виразу <span style="border-top: 1px solid">(AvB)</span> за законом Моргана дорівнює', N'83');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'275', N'Об''єднання двох виразів в один за допомогою звороту "якщо... то..." називається', N'83');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'276', N'Таблиця, що містить всі можливі значення логічного виразу, називається', N'83');
GO
INSERT INTO [dbo].[CL_TestQuestions] ([QuestionID], [QuestionText], [TestID]) VALUES (N'277', N'Об''єднання двох виразів в один за допомогою "АБО" називається', N'83');
GO
SET IDENTITY_INSERT [dbo].[CL_TestQuestions] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[CL_Tests]
-- ----------------------------
DROP TABLE [dbo].[CL_Tests]
GO
CREATE TABLE [dbo].[CL_Tests] (
[TestID] int NOT NULL IDENTITY(1,1) ,
[Title] nvarchar(MAX) NULL ,
[IsFreeTest] bit NULL DEFAULT ((0)) ,
[QuestionsLimit] int NOT NULL DEFAULT ((0)) ,
[ChancesLimit] int NOT NULL DEFAULT ((0)) ,
[TimeLimit] int NOT NULL DEFAULT ((0)) 
)


GO
DBCC CHECKIDENT(N'[dbo].[CL_Tests]', RESEED, 83)
GO

-- ----------------------------
-- Records of CL_Tests
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CL_Tests] ON
GO
INSERT INTO [dbo].[CL_Tests] ([TestID], [Title], [IsFreeTest], [QuestionsLimit], [ChancesLimit], [TimeLimit]) VALUES (N'65', N'Історія розвитку ЕОМ. Варіант 1', N'0', N'15', N'5', N'15');
GO
INSERT INTO [dbo].[CL_Tests] ([TestID], [Title], [IsFreeTest], [QuestionsLimit], [ChancesLimit], [TimeLimit]) VALUES (N'72', N'Історія розвитку ЕОМ. Варіант 2', N'0', N'15', N'5', N'15');
GO
INSERT INTO [dbo].[CL_Tests] ([TestID], [Title], [IsFreeTest], [QuestionsLimit], [ChancesLimit], [TimeLimit]) VALUES (N'74', N'Основи алгебри логіки', N'1', N'10', N'0', N'0');
GO
INSERT INTO [dbo].[CL_Tests] ([TestID], [Title], [IsFreeTest], [QuestionsLimit], [ChancesLimit], [TimeLimit]) VALUES (N'77', N'Базові логічні елементи. Варіант 1', N'0', N'10', N'1', N'0');
GO
INSERT INTO [dbo].[CL_Tests] ([TestID], [Title], [IsFreeTest], [QuestionsLimit], [ChancesLimit], [TimeLimit]) VALUES (N'78', N'Базові логічні елементи. Варіант 2', N'0', N'10', N'1', N'0');
GO
INSERT INTO [dbo].[CL_Tests] ([TestID], [Title], [IsFreeTest], [QuestionsLimit], [ChancesLimit], [TimeLimit]) VALUES (N'80', N'Основи логіки. Варіант 1', N'0', N'10', N'2', N'10');
GO
INSERT INTO [dbo].[CL_Tests] ([TestID], [Title], [IsFreeTest], [QuestionsLimit], [ChancesLimit], [TimeLimit]) VALUES (N'83', N'Основи логіки, Варіант 2', N'0', N'10', N'2', N'10');
GO
SET IDENTITY_INSERT [dbo].[CL_Tests] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[CL_Users]
-- ----------------------------
DROP TABLE [dbo].[CL_Users]
GO
CREATE TABLE [dbo].[CL_Users] (
[Username] varchar(24) NOT NULL ,
[Email] varchar(MAX) NULL ,
[Password_hash] varchar(MAX) NULL ,
[LastLogin] varchar(16) NULL ,
[Surname] nvarchar(MAX) NULL ,
[Name] nvarchar(MAX) NULL ,
[GroupID] int NOT NULL DEFAULT ((0)) ,
[Activation] varchar(24) NULL ,
[AccessLevel] tinyint NULL DEFAULT ((0)) ,
[PRecover] varchar(24) NULL ,
[ShowEmailTo] tinyint NULL DEFAULT ((0)) ,
[Password_salt] varchar(MAX) NULL ,
[Gender] tinyint NOT NULL DEFAULT ((0)) 
)


GO

-- ----------------------------
-- Records of CL_Users
-- ----------------------------
INSERT INTO [dbo].[CL_Users] ([Username], [Email], [Password_hash], [LastLogin], [Surname], [Name], [GroupID], [Activation], [AccessLevel], [PRecover], [ShowEmailTo], [Password_salt], [Gender]) VALUES (N'Azelen', N'azelen@meta.ua', N'c09fbb4a0e33e516fe730dc621c53213', N'04.05.2013 17:55', N'Пилипчук', N'Андрій', N'32', null, N'2', null, N'2', N'uWpH0+CW7O8=', N'1');
GO
INSERT INTO [dbo].[CL_Users] ([Username], [Email], [Password_hash], [LastLogin], [Surname], [Name], [GroupID], [Activation], [AccessLevel], [PRecover], [ShowEmailTo], [Password_salt], [Gender]) VALUES (N'Izgilian', N'azelen@meta.ua', N'06fbf057a9a660c1f9458b4b695317f0', N'29.04.2013 23:36', N'Майловський', N'Андрій', N'34', null, N'1', null, N'0', N'wKuGrGHcGlg=', N'1');
GO
INSERT INTO [dbo].[CL_Users] ([Username], [Email], [Password_hash], [LastLogin], [Surname], [Name], [GroupID], [Activation], [AccessLevel], [PRecover], [ShowEmailTo], [Password_salt], [Gender]) VALUES (N'Raiden', N'azelen@meta.ua', N'9cde15a81f27e52e3b522998ce119279', null, N'Поважний', N'Ярослав', N'34', N'ceb5dc3675956ca6c784aa64', N'1', null, N'1', N'XpS5LfATZ7U=', N'1');
GO

-- ----------------------------
-- Table structure for [dbo].[Gallery]
-- ----------------------------
DROP TABLE [dbo].[Gallery]
GO
CREATE TABLE [dbo].[Gallery] (
[entry] int NOT NULL IDENTITY(1,1) ,
[title] char(255) NULL ,
[desc] nvarchar(MAX) NULL ,
[image] image NULL 
)


GO

-- ----------------------------
-- Records of Gallery
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Gallery] ON
GO
SET IDENTITY_INSERT [dbo].[Gallery] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[Game_Users]
-- ----------------------------
DROP TABLE [dbo].[Game_Users]
GO
CREATE TABLE [dbo].[Game_Users] (
[UserID] bigint NOT NULL IDENTITY(1,1) ,
[Username] nvarchar(50) NOT NULL ,
[Email] varchar(30) NULL ,
[Password] varchar(MAX) NULL ,
[ActivatedState] smallint NULL DEFAULT ((0)) ,
[AccessLevel] smallint NULL DEFAULT ((0)) ,
[SecretQ] varchar(MAX) NULL ,
[SecretA] varchar(MAX) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Game_Users]', RESEED, 16)
GO

-- ----------------------------
-- Records of Game_Users
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Game_Users] ON
GO
INSERT INTO [dbo].[Game_Users] ([UserID], [Username], [Email], [Password], [ActivatedState], [AccessLevel], [SecretQ], [SecretA]) VALUES (N'15', N'Azelen', N'azelen@meta.ua', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'2', N'2', N'wtf?', N'ftw');
GO
INSERT INTO [dbo].[Game_Users] ([UserID], [Username], [Email], [Password], [ActivatedState], [AccessLevel], [SecretQ], [SecretA]) VALUES (N'16', N'luxus', N'psholhan@nah.com', N'D54B76B2BAD9D9946011EBC62A1D272F4122C7B5', N'0', N'2', N'poh', N'nah');
GO
SET IDENTITY_INSERT [dbo].[Game_Users] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[Game_Users_Info]
-- ----------------------------
DROP TABLE [dbo].[Game_Users_Info]
GO
CREATE TABLE [dbo].[Game_Users_Info] (
[UserID] bigint NOT NULL ,
[Name] varchar(15) NULL ,
[BirthDate] date NULL ,
[Gender] smallint NULL DEFAULT ((0)) ,
[Skype] varchar(MAX) NULL ,
[SocialNetworks] varchar(MAX) NULL ,
[AboutMe] varchar(MAX) NULL ,
[FavGames] varchar(MAX) NULL ,
[Messenger] varchar(MAX) NULL 
)


GO

-- ----------------------------
-- Records of Game_Users_Info
-- ----------------------------
INSERT INTO [dbo].[Game_Users_Info] ([UserID], [Name], [BirthDate], [Gender], [Skype], [SocialNetworks], [AboutMe], [FavGames], [Messenger]) VALUES (N'15', N'Андрій', N'1992-07-16', N'1', N'', N'', N'', N'', N'');
GO

-- ----------------------------
-- Table structure for [dbo].[Users]
-- ----------------------------
DROP TABLE [dbo].[Users]
GO
CREATE TABLE [dbo].[Users] (
[entry] int NOT NULL IDENTITY(1,1) ,
[login] char(255) NOT NULL ,
[password_hash] varchar(MAX) NULL ,
[password_salt] varchar(12) NULL ,
[email] char(255) NULL ,
[activation] bit NOT NULL DEFAULT ((0)) ,
[pasword_recovery] varchar(12) NULL ,
[date_joined] date NULL ,
[last_login] date NULL 
)


GO

-- ----------------------------
-- Records of Users
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Users] ON
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[Users2]
-- ----------------------------
DROP TABLE [dbo].[Users2]
GO
CREATE TABLE [dbo].[Users2] (
[UserID] bigint NOT NULL IDENTITY(1,1) ,
[Username] nvarchar(50) NOT NULL ,
[Email] varchar(30) NULL ,
[Password] varchar(MAX) NULL ,
[BirthDate] date NULL ,
[IsActivated] bit NULL DEFAULT ((0)) ,
[AccessLevel] smallint NULL DEFAULT ((0)) ,
[Gender] smallint NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Users2]', RESEED, 31)
GO

-- ----------------------------
-- Records of Users2
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Users2] ON
GO
INSERT INTO [dbo].[Users2] ([UserID], [Username], [Email], [Password], [BirthDate], [IsActivated], [AccessLevel], [Gender]) VALUES (N'30', N'azalia', N'azalia@mail.ru', N'343A2159A9C57956B66E0C3E7317E26106A6F72B', N'1992-09-24', N'0', N'0', N'2');
GO
INSERT INTO [dbo].[Users2] ([UserID], [Username], [Email], [Password], [BirthDate], [IsActivated], [AccessLevel], [Gender]) VALUES (N'29', N'azelen', N'azelen@meta.ua', N'9D07398BAC6AECC6C3D621F101A9FF751E781F6F', N'1992-07-16', N'0', N'0', N'1');
GO
SET IDENTITY_INSERT [dbo].[Users2] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[Users2Data]
-- ----------------------------
DROP TABLE [dbo].[Users2Data]
GO
CREATE TABLE [dbo].[Users2Data] (
[Username] nvarchar(50) NOT NULL ,
[Surname] nvarchar(16) NULL ,
[Name] nvarchar(16) NULL ,
[DateOfBirth] date NULL ,
[Gender] bit NOT NULL DEFAULT ((0)) 
)


GO

-- ----------------------------
-- Records of Users2Data
-- ----------------------------

-- ----------------------------
-- Table structure for [dbo].[UsersData]
-- ----------------------------
DROP TABLE [dbo].[UsersData]
GO
CREATE TABLE [dbo].[UsersData] (
[entry] int NOT NULL ,
[name] char(20) NULL ,
[surname] char(25) NULL ,
[dob] date NULL ,
[gender] bit NOT NULL ,
[aboutme] nvarchar(MAX) NULL 
)


GO

-- ----------------------------
-- Records of UsersData
-- ----------------------------

-- ----------------------------
-- Indexes structure for table Articles
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[Articles]
-- ----------------------------
ALTER TABLE [dbo].[Articles] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table ArticlesList
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[ArticlesList]
-- ----------------------------
ALTER TABLE [dbo].[ArticlesList] ADD PRIMARY KEY ([list_id], [position])
GO

-- ----------------------------
-- Indexes structure for table BlogsTest
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[BlogsTest]
-- ----------------------------
ALTER TABLE [dbo].[BlogsTest] ADD PRIMARY KEY ([MessageID])
GO

-- ----------------------------
-- Indexes structure for table CL_Groups
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[CL_Groups]
-- ----------------------------
ALTER TABLE [dbo].[CL_Groups] ADD PRIMARY KEY ([GroupID])
GO

-- ----------------------------
-- Indexes structure for table CL_Individuals
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[CL_Individuals]
-- ----------------------------
ALTER TABLE [dbo].[CL_Individuals] ADD PRIMARY KEY ([IndividualIndex], [Page])
GO

-- ----------------------------
-- Indexes structure for table CL_Labs
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[CL_Labs]
-- ----------------------------
ALTER TABLE [dbo].[CL_Labs] ADD PRIMARY KEY ([LabIndex], [Page])
GO

-- ----------------------------
-- Indexes structure for table CL_Lessons
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[CL_Lessons]
-- ----------------------------
ALTER TABLE [dbo].[CL_Lessons] ADD PRIMARY KEY ([LessonIndex], [Page])
GO

-- ----------------------------
-- Indexes structure for table CL_TestAnswers
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[CL_TestAnswers]
-- ----------------------------
ALTER TABLE [dbo].[CL_TestAnswers] ADD PRIMARY KEY ([ChoiceID])
GO

-- ----------------------------
-- Indexes structure for table CL_TestQuestions
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[CL_TestQuestions]
-- ----------------------------
ALTER TABLE [dbo].[CL_TestQuestions] ADD PRIMARY KEY ([QuestionID])
GO

-- ----------------------------
-- Indexes structure for table CL_Tests
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[CL_Tests]
-- ----------------------------
ALTER TABLE [dbo].[CL_Tests] ADD PRIMARY KEY ([TestID])
GO

-- ----------------------------
-- Indexes structure for table CL_Users
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[CL_Users]
-- ----------------------------
ALTER TABLE [dbo].[CL_Users] ADD PRIMARY KEY ([Username])
GO

-- ----------------------------
-- Indexes structure for table Gallery
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[Gallery]
-- ----------------------------
ALTER TABLE [dbo].[Gallery] ADD PRIMARY KEY ([entry])
GO

-- ----------------------------
-- Indexes structure for table Game_Users
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[Game_Users]
-- ----------------------------
ALTER TABLE [dbo].[Game_Users] ADD PRIMARY KEY ([UserID], [Username])
GO

-- ----------------------------
-- Indexes structure for table Game_Users_Info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[Game_Users_Info]
-- ----------------------------
ALTER TABLE [dbo].[Game_Users_Info] ADD PRIMARY KEY ([UserID])
GO

-- ----------------------------
-- Indexes structure for table Users
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[Users]
-- ----------------------------
ALTER TABLE [dbo].[Users] ADD PRIMARY KEY ([entry])
GO

-- ----------------------------
-- Indexes structure for table Users2
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[Users2]
-- ----------------------------
ALTER TABLE [dbo].[Users2] ADD PRIMARY KEY ([Username])
GO

-- ----------------------------
-- Indexes structure for table Users2Data
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[Users2Data]
-- ----------------------------
ALTER TABLE [dbo].[Users2Data] ADD PRIMARY KEY ([Username])
GO

-- ----------------------------
-- Indexes structure for table UsersData
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[UsersData]
-- ----------------------------
ALTER TABLE [dbo].[UsersData] ADD PRIMARY KEY ([entry])
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[CL_Marks]
-- ----------------------------
ALTER TABLE [dbo].[CL_Marks] ADD FOREIGN KEY ([TestID]) REFERENCES [dbo].[CL_Tests] ([TestID]) ON DELETE CASCADE ON UPDATE CASCADE
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[CL_TestAnswers]
-- ----------------------------
ALTER TABLE [dbo].[CL_TestAnswers] ADD FOREIGN KEY ([QuestionID]) REFERENCES [dbo].[CL_TestQuestions] ([QuestionID]) ON DELETE CASCADE ON UPDATE CASCADE
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[CL_TestQuestions]
-- ----------------------------
ALTER TABLE [dbo].[CL_TestQuestions] ADD FOREIGN KEY ([TestID]) REFERENCES [dbo].[CL_Tests] ([TestID]) ON DELETE CASCADE ON UPDATE CASCADE
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[CL_Users]
-- ----------------------------
ALTER TABLE [dbo].[CL_Users] ADD FOREIGN KEY ([GroupID]) REFERENCES [dbo].[CL_Groups] ([GroupID]) ON DELETE SET DEFAULT ON UPDATE CASCADE
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Users2Data]
-- ----------------------------
ALTER TABLE [dbo].[Users2Data] ADD FOREIGN KEY ([Username]) REFERENCES [dbo].[Users2] ([Username]) ON DELETE CASCADE ON UPDATE CASCADE
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[UsersData]
-- ----------------------------
ALTER TABLE [dbo].[UsersData] ADD FOREIGN KEY ([entry]) REFERENCES [dbo].[Users] ([entry]) ON DELETE CASCADE ON UPDATE CASCADE
GO
