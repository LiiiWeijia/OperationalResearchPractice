
#######################################R简介部分##################################

#先设置工作目录
setwd("E:/bai")

##查看文件夹中的文件
list.files()

#安装和加载扩展包
install.packages("lpSolve")  #安装lpSolve
library(lpSolve)  #加载lpSolve

#查看已加载程序包
installed.packages()

#R的帮助

?mean
help(mean)

help("mean")  #仅搜索已加载的包？

help("bs", try.all.packages = TRUE) #可搜索未加载的包

#多少种颜色？
colors()
###数据类型及构建数据

# 数据类别的识别 -----------------------------------------------------------------

#可以用mode（变量名称）函数来查询该变量的数据类型，括号中为变量的名称。

x<-c(1,2,3,4,5,6)
x

mode(x)

  x<-c(TRUE,FALSE,FALSE,TRUE)
x

mode(x)
a<-1
  x<-c(a,"b","c","d")
x

mode(x)

  m<-2+3i
m

mode(m)
a=3
  a
a<-3 #将数据3赋值给变量a
mode(a) #查询a的数据类型,numeric的结果表示a的数据类型为数值型变量。


b<-"aaa" #将字符串数据”aaa” 赋值给变量b
mode(b) #查询b的数据类型,的结果表示b的数据类型是character字符型数据。

#逻辑型（Logical）：逻辑型数据取值为T（true）和F（false）两种值
f<-TRUE
f<-T #或者
mode(f)

g<-F##FALSE
mode(g)

#logical的结果表示f和g的数据类型是逻辑（Logical）型数据。

#数据类型的判断
#判断一个数据是否为字符串类型时，可is.character（）进行判断。

is.character(a)


is.character(b)

  
#   


 #2.创建向量 ------------------------------------------------------------------

# 2.1连接函数c()创建向量
#创造一个数值型向量
x <-c(1,2,3,4)      #向量的参数值分大小写
x

#用c()创建一个逻辑型向量
x<-c(TRUE,FALSE,FALSE,TRUE)
x


#用c()创建一个字符向量
x<-c("one","two","three")   #注意字符型向量的元素需要加双引号
x


##创建一个数值型向量
x <-2:9
x


#2.2 用rep()函数创建一个元素相同的数值型向量
rep(0,times=4)


#用rep()函数创建一个向量整体重复的数值型向量
rep(0:2,times=2)

#用rep()函数创建一个向量内部元素重复的数值型向量

rep(0:2,each=3)#用seq()函数创建一个起始值为0终值为9差值为1的数值型向量

# 2.3 用seq创建向量
seq(from=0,to=9,by=1)
0:9
#用seq()函数创建一个起始值为0，差值为2，长度为5的数值型向量

seq(from=0,by=2,length.out=5)

#用seq()函数创建一个起始值为0，差值为2，长度与向量c(1,2,3,4)一样的数值型向量
seq(from=0,by=2,along.with=c(1,2,3,4))   

#注意：有的时候我们也可以省去参数值，例如
#用seq()创建一个起始值为0，终值为10，长度为5的数值型向量
seq(0,10,length.out=5)

#用seq()创建一个起始值为0，终值为8，差值为1的数值型向量
seq(0,8)         #注意这里省去了参数差值，即默认差值为1
seq(,0,8,5) 

#2.4 用paste()创建一个字符型向量
#函数paste()可以接受任意个参数，并从它们中逐个取出字符连成字符串，形成的字符串的个数与参数中最长字符串的长度相同。如果参数中包含数字的话，会被强制转化成字符串。
#用paste()创建一个字符型向量
x<-paste(c("X","Y"),1:10,sep="")  #/sep是用来指定字符的分隔符号/
  x


# 3.创建矩阵 --------------------------------------------------------------------


#两种创建矩阵的方法：直接创建矩阵，元素分布赋值创建矩阵[6]。
# 3.1直接创建矩阵
#直接用matrix()函数创建一个简单的矩阵。
matrix1<-matrix(c(1,2,3,4,5,6),nrow=2)
matrix1

#将向量c(1,2,3,4,5,6)中的元素在矩阵中按行排列。
matrix2<-matrix(c(1,2,3,4,5,6),nrow=2,byrow=TRUE)
matrix2

#还可以尝试创建一个字符型矩阵。
matrix3<-matrix(c("a","b","c","d"),nrow=2)
matrix3

#元素赋值创建矩阵:先创建一个空矩阵，然后为矩阵每一个元素赋值。
#生成了一个2*2的空矩阵，矩阵元素都是NA。在R语言中，“[]”用来对数据结构的子元素进行索引。如果想找到矩阵matrix4的第1行1列的元素，可以使用matrix4[1,1]来定位，然后我们令矩阵的的第1行第1列的元素为3。
matrix4<-matrix(nrow=2,ncol=2)
matrix4
matrix4[1,1]<-3#矩阵的a11
matrix4[2,1]<-5#a21
matrix4[1,2]<-10#a12
matrix4[2,2]<-14#a22
matrix4


# 4.创建数组 array() -----------------------------------------------------------------



# 5.创建及访问列表list ------------------------------------------------------------------


#5.1 创建一个列表，包含小明的性别和年龄
student1<-list(name="xiaoming",age=25)
#查询列表中的成分
student1


#首先，创建一个数据框studentdata（数据框的具体应用将在后文中阐述）。
studentID<-c(1,2,3,4)
age<-c(20,22,20,21)
gender<-c("F","M","M","F")
hometown<-c("shanghai","anhui","jiangsu","hubei")
studentdata<-data.frame("studentID","age","gender","hometown")#创建一个数据框

#创建一个多种数据结构构成的列表。
g<-"my list"
h<-c(1,2,3,4)
y<-matrix(1:10,nrow=5)
z<-c("low","medium","high")
mylist<-list(g=g,h=h,y=y,z=z,data=studentdata)#创建由多种数据结构构成的列表


#5.2 访问列表
#（1）方法一访问列表第一个元素
mylist[[1]]



#（2）用方法二访问列表第四个元素
mylist[['y']]

#注意：要用方法二访问表中数据，必须要给相应元素命名，且在代码书写时，引号不能遗漏，否则报错。
mylist1<-list(a=g,b=h,c=y,d=z,e=studentdata)

mylist1[['c']][2,]

mylist1[[3]][3,2]

#（3）用方法三访问第二个元素
mylist[[2]][3]


# 5.3 列表元素和值

# 可用names()函数获取列表中元素的标签
names(mylist1)  #获取列表mylist1中元素的标签


#5.4去除元素标签可用NULL赋值或者unname()函数

#(1)用NULL赋值,可完全去除列表中元素标签
z<-list(a=123,b="ef",c="2016ch")
names(z)<-NULL   #去除列表z中元素标签
z   #查看去除元素标签后z的结构



#（2）用unname()函数只可暂时取得不含列表元素标签的列表结构
z<-list(a=123,b="ef",c="2016ch")
unname(z)#去除列表z中元素标签
z


# 5.5 递归型列表
# 列表中元素也可以是列表，所以列表是可递归的。这里会用到函数c()，用于将列表对象和其他对象重新拼接成一个新的大列表。

x<-c(list(a=1,b="zzz",c=list(d=55,e=6666)))
x


# 注意， c()函数中有一个参数recursive,如果参数未设置，默认为FALSE，运行结果得到一个递归型列表，
# 如果参数设置为TRUE，得到的结果是一个向量，这时就是一个非递归列表了。
x<-c(list(a=1,b="zzz",c=list(d=55,e=6666)),recursive=T)
x


# 5.6 获取列表长度——利用length()函数
z<-list(a=123,b="ef",c="2016ch")
length(z)


#5.7.增加或删除列表元素
#可以通过索引，来增加和删除列表中的元素。
#（1）增加:利用索引在列表特定位置添加一个新的对象

z<-list(a=123,b="ef")
z$c<-"ADD"   #在列表z的第三个位置添加字符串ADD
z  #查看列表z的结构


#（2）删除:要删除列表中元素，直接将其值设为NULL
z$b<-NULL   #删除列表z的第二个元素
z





# 6.创建数据框data frame ---------------------------------------------------------


#  下面是常用的创建数据框的语句：
# data<-data.frame(object1,object2,…)


a<-c(1,2,3,4,5)
b<-c(1,2,3,4)
data.frame(a,b)
##Error in data.frame(a, b) 
# 报错,两个向量分别有着不同的行数: 5, 4。,数据框每一列长度相等

# （2）
size<-c(20,31,26,29)

color<-c('red','black','white','blue')
clothes<-data.frame(size,color,stringsAsFactors=FALSE)
clothes

# 6.2.  访问数据框
# （1）如果只访问数据框的某一列，可以通过元素名或元素的索引值来访问数据框：


data<-read.csv("cencus.csv",stringsAsFactors = F) # 读取数据到数据框
summary(data)

# str()函数可以帮助我们来显示对象的内部结构：
str(data)

data$SEX #显示“SEX”这一列


data[2]

data['LOVE']

data$LOVE
#注意两者的输出格式不同

##（2）像矩阵一样使用[行Index,列Index]的格式来访问具体的元素：

data[7,4]


data[2,1:5]



# （3）对于比较大的数据框，我们还可以借助names()，head()，tail()函数来访问数据框：
names(data)  #读取列名


head(data[,2:5])  #读取前六行


tail(data[,2:5])  #读取后六行




# 6.3.  提取子数据框
# （1）运用[行Index,列Index]的格式来提取子数据框：
data[1:3,]  #提取1到3行

data[1:3,5] #提取第5列的1到3行数据

 data[1:3,5,drop=F] # 参数drop=F，可以得到一个一列的数据框。

#（2）使用which()函数筛选子数据框：
data[which(data$SEX=='M'),3:5]#读取性别是男的、3到5列数据


#6.4.  数据框命名
# 在数据较多的时候，我们通常要对数据变量进行命名，以方便我们对数据进行筛选和提取。这里
a=c(1,2,3)
b=c(2,3,4)
ab=data.frame(a,b)
ab

#可以运用colnames()对数据框的列命名，rownames()对数据框的行命名，也可以直接用dimnames()对数据框的行与列同时命名。
colnames(ab)<-c('x1','x2')
rownames(ab)<-c('x1','x2','x3')

#或
rows<-c('x1','x2','x3')
columns<-c('x1','x2')
dimnames(ab)<-list(rows,columns)
ab

#6.5.  缺失值的处理
#（1）如果数据框中有缺失值，在R中是这样录入的：
w=c(2,3,4,5)
e=c(1,2,3,NA)
r=c(1,NA,3,4)
na=data.frame(w,e,r)
na

#is.na()函数来查看数据框的缺失值情况：is.na(na)


# 7.创建因子（factor） ----------------------------------------------------------


# 7.1 因子和有序因子的创建
# （1）	普通的因子创建
score<-c('B','A','A','B','C','A','B','A','A','C','B','A','C','B','A')  
score1<-factor(score)      #将score向量作为因子赋给score1



# （2）对因子的水平进行标签
score2<-factor(score,levels=c('B','A','C'))  
#规定因子水平B、A、C
score3<-factor(score,levels=c('B','A','C'),labels=c('Pass','Good','Fail'))
#对因子水平B、A、C进行标签Pass、Good、Fail


# （3）有序因子的创建和标签
score<-c('A','A','C','A','B','A','C','C','B','A','C','B')
score1<-ordered(score,levels=c('C','B','A'))
score2<-ordered(score,levels=c('C','B','A'),labels=c('Fail','Pass','Good'))



# （4）利用cut函数生成因子（仅限数值数据）
score<-c(43,22,67,47)
score1<-cut(score,breaks=c(0,59,69,79,89,100))                                        #该语句利用cut（）将因子分为breaks规定的几个区间
score1<-cut(score,breaks=4)#该语句利用cut（）将因子分为breaks规定的4个等长个区间

# 正态分布产生了10个随机数，然后用cut函数查看他们分别落在三倍方差的哪个区间。
x<-rnorm(10,0,1)
b<-c(-3,-2,-1,0,1,2,3)
cut(x,b,labels = F)



# 7.2因子的类型判断
is.factor(score1)           #该语句用来判断score1是否为因子类型
x1<-as.factor(score)        #该语句将score作为因子类型赋给x1


# 7.3生成因子的其它细节
# （a）若没有规定和标签所有元素的水平，则命令只输出被规定和标签项，剩下元素<NA>
  score<-c('A','A','C','A','B','A','C','C','B','A','C','B') 
score1<-ordered(score,levels=c('C','B'),labels=c('Fail','Pass'))

# （b）用exclued排除因子中的某些水平
score2<-ordered(score,levels=c('C','B','A'),labels=c('Fail','Good'),exclude=c('B'))
#exclude排除了元素中的水平B，B水平的元素都变为了<NA>


