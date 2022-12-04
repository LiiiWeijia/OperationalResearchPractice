x<-c(1,2,3,4)
y=x+2
y
x<-c(1,2,3,4)
y=x%%2       #取余运算
y
y=x%/%2     #取商运算
y
y=x/2   #除法运算
y
x<-c(1,2,3,4)
y<-x>2
y
x<-c(0,1,0,1)
y<-c(0,0,1,1)

#  向量的集合运算 union()、append()、intersect() -----------------------------------

union(x=1:3,y=2:5)  #求两个向量的并集
append(1:5,0:1,after=3) 
intersect(x=1:5,y=3:6) 
x<-c(2,4,6,8)
y<-max(x)
y
y<-mean(x)   #均值
y
y<-weighted.mean(x,c(1,1,2,2))  #加权平均
y
diff(x) 

median(x)   #中位数
quantile(x)  #分位数
any(x>0)  #任意
all(x<0)   #全体

# 矩阵的运算 -------------------------------------------------------------------
x<-c(1:3)
y<-c(1:3)

x*y
x%*%y
t(x)%*%y
x%*%t(y)

matrix1<-matrix(c(1,2,3,4,5,7,9,6,8),nrow=3,ncol=3)
matrix1
det(matrix1)
A<-solve(matrix1)
t(matrix1)##矩阵的z转置
A%*%matrix1#说明？

B<-eigen(matrix1)

B$values*B$vectors

matrix1%*%B$vectors#说明？

y<-1:3
y*matrix1
y%*%matrix1
# 向量的比较运算 setdiff()、identical()、all.equal()、setequal() --------------------
setdiff(x=1:5,y=3:6)  
identical(x=1:5,y=2:6)
x<-1:3 
y<-c(1,2,3)
all.equal(x,y)    #比较两个向量是否完全相等，返回逻辑型数值
det(matrix1)
install.packages(Matrix)
library(Matrix)
rankMatrix(matrix1)
# 4.7 向量的合并运算 rbind()、cbind() ---------------------------------------------

rbind(x=1:3,y=2:4)   #将两组向量横向组成矩阵
cbind(x=1:3,y=2:4)  #将两组向量纵向组成矩阵
x<-1:3
sum(x)     #向量的每个元素相加
cumsum(x)  #新向量的第n个元素等于原向量前n个元素相加的和

# 4.9 计量向量的长度、范围、四舍五入、取整 length()、range()、round()、ceiling()、floor( --------
x<-1:10
length(x)      #计量向量的长度
range(x)       #计量向量的范围
x<-c(1.322,3.456,8.146)
round(x)      #四舍五入小数

round(x,2)    #保留两位小数四舍五入

x<-c(123.45,236.78,268.76)
signif(x,2)   #四舍五入保留前两位整数
ceiling(x)     #向上取整
floor(x)       #向下取整

# 5.向量化运算符 ----------------------------------------------------------------

x<-c(3,6,7)
y<-c(2,1,9)
x>y       #在这里，>函数分别运用在x[1] 和y[1]，得到结果TRUE，然后是x[2] 和 y[2]，得到结果TRUE，以此类推

# 6.筛选 --------------------------------------------------------------------


# 6.1 which()函数——返回一个包含x符合条件（当比较运算结果为真（TRUE））的下标的向量 -----------------------

x<-c(1,2,4,3)
which(x==3)  #返回向量x中恒等于3的元素的下标
which.max(x)   #返回向量x中最大元素的下标
x<-c(1:10,3:7)
y<-c(4:13,2:8)
which(x %in% y)        #返回向量x和y中相同元素的下标
which(is.element(x,y)) #返回向量x和y中相同元素的下标

# 6.2 subset()函数——从某一个数据框中选择出符合某条件的数据或是相关的列 -------------------------------

#创建四个变量name、English、Math、Art
name<-c("Jane","Bob","Elena","Lilly","Max")  
English<-c(84,86,78,90,88)
Math<-c(80,85,90,87,85)
Art<-c(78,80,80,85,86)
Score<-data.frame(name,English,Math,Art)   #创建Score数据框
Score

selectresult=subset(Score,name=="Jane")  #查询Score数据框里name=Jane的数据
selectresult

#限定看Jane的数学成绩
selectresult=subset(Score,name=="Jane",select=c(name,Math))
selectresult
selectresult=subset(Score,name=="Jane"& Math=="80",select=c(English,Art))
selectresult







































