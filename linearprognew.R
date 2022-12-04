setwd("D:\\教学资料\\经济最优化\\optimR")


# 问题一，根据方程组建立单纯性表,使用lpsimplex求解

# 企业（厂商）生产计划问题�?
# 某企业利用三种原料B1、B2、B3 生产A1、A2 两种商品。三种原料的月供应量（吨），
# 生产一吨产品A1，A2 所需要各种原料的数量以及单位产品的价格（万元/吨）如表所示�?
# 那么该企业应如何安排生产计划，使总收益最大？
# 
# 因此若将生产一吨产品A1的这些原料卖出所得的收益为y1+2*y2+3*y3(万元)，它必须不少于生产一吨产品A1所得的收益，对于该企业才是合算的。所以应�?  y1+2*y2+3*y3   
# 对于产品A2，可类似得到y1+3*y2+2*y3  
# 同时，若买方欲购买该工厂的全部原料，则应付出150*y1+240*y2+300*y3万元

# 自编函数：lpsimplex(A,N)�? 
#A为根据各系数建立的单纯形表（添加了松弛变量后的方程）�?
#实际上形式为（A,b),包括非负的约束条件常数项，最后一行是检验数�?
# N为初始基变量下标�?


lpsimplex <-
  function(A,N){
    mA = nrow(A)
    print('约束条件个数�?')
    #print(mA-1)
   nA = ncol(A)
   print('决策变量个数�?')
   print(nA-mA-1)
    kk = 0 #迭代次数
    flag = 1
    while(flag)
    {
      kk=kk+1;
      print('迭代次数�?')
      print(kk)
      #
         if (max(A[mA,])<=0)##此时该解为最优解
      {
        flag = 0
        sol = array(0,dim=c(1,nA-1))
        for(i in 1:(mA-1))
          sol[N[i]] = A[i,nA]
        val = -A[mA,nA]
        print('最优解�?')
        print(sol)
        }
      else
      {
        for(i in 1:(nA-1))
        {
          #无穷�?
          if (A[mA,i]>0 & max(A[1:mA-1,i])<=0)
          {
            print("have infinite solution!")
            flag = 0
            break
          }
        }
        if(flag)
        {
          #确定进基变量
          inb = which.max(A[mA,])
          print('进基变量为X')
          print(inb)
          sita = array(0,dim=c(1,mA-1))
           for(i in 1:(mA-1))
          {
            if(A[i,inb]>0)
              sita[i]=A[i,nA]/A[i,inb]
            sita[i]
          }
          temp = Inf
          for(i in 1:(mA-1))
          {
            if(sita[i]>0 & sita[i]<temp)
            {
              temp = sita[i]
              outb = i
            }
          }
          for(i in 1:(mA-1))
          {
            if(i == outb)
              N[i] = inb
          }
          A[outb,] = A[outb,]/A[outb,inb]
          for(i in 1:mA)
          {
            #判断出基变量
            if(i != outb)
              A[i,] = A[i,]-A[outb,]*A[i,inb]
                      }
        print(A)}
      }
    }
    print("Linear Programming Results")
    print("Maximization Problem with Objective Function Coefficients")
    print(sol)
    print("The optimal value of the objective function is")
    print(val)
    print("The iteration number is")
    print(kk)
  }

B=matrix(c(0,6,1,2,5,2,1,1,1,0,0,0,0,1,0,0,0,0,1,0,15,24,5,0),nrow=4,ncol=6)
N=c(3,4,5)
lpsimplex(B,N)




install.packages ( "lpSolve" )
library (lpSolve)
# 设定线性规划问题：
# Set up problem: maximize
# 2*x1 +  x2 
# subject to
# 5* x2  <= 15
# 6 * x1 +  2*x2 <= 24
#  x1 +  x2 <= 5
C<-c(2,1)
b<-c(15,25,5)
A<-matrix(c(0,5,6,2,1,1),nrow=3,byrow=T)

lp.result<-lp("max",C,A,rep("<=",times=3),b, compute.sens=1)

lp.result$objval
lp.result$solution
lp.result$sens.coef.from

lp.result$sens.coef.to

lp.result$duals
lp.result$duals.from
lp.result$duals.to

f.obj <- c (2,1)
f.con <- matrix ( c (0,5,6,2,1,1), nrow = 3, byrow = TRUE )
f.dir <- c ( "<=" , "<=", "<=" )
f.rhs <- c (15,24,5)
# 使用lp()函数求解�?
lp.result <- lp ( "max" , f.obj, f.con, f.dir, f.rhs)


# 得到的lp.result是一个类别为lp的对象，如果成功找到解的话，直接输出可以的到目标函数的值：
lp.result

# 输出为：Success: the objective function is 40.5
# 而解则为
lp.result$solution


####目标系数的范�?
lp ("max", f.obj, f.con, f.dir, f.rhs, compute.sens=TRUE)$sens.coef.from

lp ("max", f.obj, f.con, f.dir, f.rhs, compute.sens=TRUE)$sens.coef.to

##对偶问题
lp ("max", f.obj, f.con, f.dir, f.rhs, compute.sens=TRUE)$duals
## Not run: [1] 4.5 0.0 -3.5 0.0 -10.5
#
# ...the duals of the constraints are 4.5 and 0, and of the variables,
# -3.5, 0.0, -10.5. Here are the lower and upper limits on these:
#
lp ("max", f.obj, f.con, f.dir, f.rhs, compute.sens=TRUE)$duals.from
## Not run: [1] 0e+00 -1e+30 -1e+30 -1e+30 -6e+00
lp ("max", f.obj, f.con, f.dir, f.rhs, compute.sens=TRUE)$duals.to
## Not run: [1] 1.5e+01 1.0e+30 3.0e+00 1.0e+30 3.0e+00


##敏感性分�?
lp.result.sensi<- lp ( "max" , f.obj, f.con, f.dir, f.rhs,compute.sens=1)

lp.result.sensi$objective
lp.result.sensi$objval
lp.result.sensi$sens.coef.from
lp.result.sensi$sens.coef.to
lp.result.sensi$duals
lp.result.sensi$scale
lp.result.sensi$duals.from
lp.result.sensi$duals.to



# 对偶问题求解 ------------------------------------------------------------------

f.rhs <- c (2,1)
f.con <-t( matrix ( c (0,5,6,2,1,1), nrow = 3, byrow = TRUE ))
f.dir <- c ( ">=" , ">=" )
f.obj <- c (15,24,5)
# 使用lp()函数求解�?
lpdual.result <- lp ( "min" , f.obj, f.con, f.dir, f.rhs,compute.sens=1)

lpdual.result$objective

lpdual.result$solution

lpdual.result$sens.coef.from
lpdual.result$sens.coef.to
#以上应为C的范�?
lp.result.sensi$duals.from
lp.result.sensi$duals.to
#以上应为b的范�?
lpdual.result$duals
lpdual.result$duals.from
lpdual.result$duals.to
#与以下做对比
lp.result.sensi$sens.coef.from
lp.result.sensi$sens.coef.to


#将对偶问题变�?
f.obj <- c (-15,-24,-5)
lpdualtrans.result <- lp ( "max" , f.obj, f.con, f.dir, f.rhs)
#注意以下
lpdualtrans.result$solution


# 验证影子价格的含�?  --------------------------------------------------------------
#将b2�?24变为23，注意影子价格为0.25
f.obj <- c (2,1)
f.con <- matrix ( c (0,5,6,2,1,1), nrow = 3, byrow = TRUE )
f.dir <- c ( "<=" , "<=", "<=" )
f.rhs <- c (15,23,5)
# 使用lp()函数求解�?
lp.result <- lp ( "max" , f.obj, f.con, f.dir, f.rhs)

lp.result$objval

#########线性规划另一种解法：
library(slam)
library(Rglpk)
##??
obj <- c(2, 4, 3)
mat <- matrix(c(3, 2, 1, 4, 1, 3, 2, 2, 2), nrow = 3)
#       [,1] [,2] [,3]
# [1,]    3    4    2
# [2,]    2    1    2
# [3,]    1    3    2
dir <- c("<=", "<=", "<=")
rhs <- c(60, 40, 80)
max <- TRUE

lp.rglpk<-Rglpk_solve_LP(obj, mat, dir, rhs, max = max)
lp.rglpk$optimum

lp.rglpk.converse<-Rglpk_solve_LP(-obj, mat, dir, rhs, max = F)

lp.rglpk.converse





###?员嗪????? dualsimplex(c,A,b)  A�????�??�?????锟斤�??�?????伪锟斤拷锟絚为f??�?????b�???????�?????

dualsimplex<-function(c,A,b)
{
  rows=nrow(A);
  cols=ncol(A);
  Atemp=cbind(A,diag(rows));
  ctemp=c(-c,rep(0,rows));
  btemp=b;
  x1=c(rep(0,cols),t(btemp));
  lk=c((cols+1):(rows+cols));
  while(1)
  {
    x=x1[1:cols];
    s1=cbind(cbind(t(t(lk)),btemp),Atemp);
    print(s1);
    print(ctemp);
    print(x1);
    #????�????谋浠?????
    cctemp=1;citemp=1;
    for(i in 1:rows)
    {
      if(btemp[i]<0)
      {
        cctemp=c(cctemp,btemp[i]);
        citemp=c(citemp,i);
      }
    }
    cc=cctemp[-1];ci=citemp[-1];
    nc=length(cc);
    if(nc==0)
    {
      print("The optimal value is reached!");
      break;
      #???�?????沤猓??�??�???
    }
    cliu=cc[1];
    cl=ci[1];
    for(j in 1:nc)
    {
      if(abs(cc[j])>abs(cliu))
      {
        cliu=cc[j];
        cl=j;
      }
    }
    cc1temp=1;ci1temp=1;
    for(i in 1:(rows+cols))
    {
      if(Atemp[cl,i]<0)
      {
        cc1temp=c(cc1temp,Atemp[cl,i]);
        ci1temp=c(ci1temp,i);
      }
    }
    cc1=cc1temp[-1];ci1=ci1temp[-1];
    nc1=length(cc1);
    if(nc1==0)
    {
      print("There is no solution!");
      break;
      #�??????沤猓??�??�???
    }
    cliu=ctemp[ci1[1]]/cc1[1];
    cl1=ci1[1];
    for(j in 1:nc1)
    {
      if((ctemp[ci1[j]]/cc1[j])<cliu)
      {
        cliu=ctemp[ci1[j]]/cc1[j];
        cl1=ci1[j];
      }
    }
    btemp[cl]=btemp[cl]/Atemp[cl,cl1];
    Atemp[cl,]=Atemp[cl,]/Atemp[cl,cl1];
    for(k in 1:rows)
    {
      if(k!=cl)
      {
        btemp[k]=btemp[k]-btemp[cl]*Atemp[k,cl1];
        Atemp[k,]=Atemp[k,]-Atemp[cl,]*Atemp[k,cl1];
      }
    }
    ctemp=ctemp-ctemp[cl1]*Atemp[cl,];
    x1[lk[cl]]=0;
    lk[cl]=cl1;
    for(kk in 1:rows)
    {
      x1[lk[kk]]=btemp[kk];
    }
  }
  x=x1[1:cols];
  value=0;
  for(i in 1:cols)
  {
    value=value+x1[i]*c[i];
  }
  print("The optimal solution is ");
  print(x);
  print("The optimal value is ");
  print(value);
  #???????�??
}

A=rbind(c(-1,-2,-3),c(-1,-3,-2))
b=c(-2.4,-1.8)
c=c(150,240,300)
dualsimplex(c,A,b)

##?�???????�?????�??????????一?????�??为x1=84,x2=24,?沙诒?锟斤拷x3=42??
# ????�???B1????42??�???�??�??????值为f=244.8??????????�?3?�??



####lp.transport Examples
#
## Set up cost matrix
costs <- matrix (10000, 8, 5);
costs[4,1] <- costs[-4,5] <- 0
costs[1,2] <- costs[2,3] <- costs[3,4] <- 7; 
costs[1,3] <- costs[2,4] <- 7.7
costs[5,1] <- costs[7,3] <- 8;
costs[1,4] <- 8.4;
costs[6,2] <- 9
costs[8,4] <- 10; 
costs[4,2:4] <- c(.7, 1.4, 2.1)
#
# Set up constraint signs and right-hand sides.
row.signs <- rep ("<=", 8)
row.rhs <- c(200, 300, 350, 200, 100, 50, 100, 150)
col.signs <- rep (">=", 5)
col.rhs <- c(250, 100, 400, 500, 200)
#
# Run
#
transportlp<-lp.transport (costs, "min", row.signs, row.rhs, col.signs, col.rhs)
## Not run: Success: the objective function is 7790
lp.transport (costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution
print(transportlp)##�???�?????�?




#??????锟斤拷全??????�??墓婊?????
lp ("max", f.obj, f.con, f.dir, f.rhs, int.vec=1:3)
## Not run: Success: the objective function is 37
lp ("max", f.obj, f.con, f.dir, f.rhs, int.vec=1:3)$solution
## Not run: [1] 1 4 0

lp ("max", f.obj, f.con, f.dir, f.rhs, int.vec=1:3, compute.sens=TRUE)$duals
## Not run: [1] 1 0 0 7 0


##0-1??锟斤�??�?????????? an example in which we want more than one solution to a problem
# in which all variables are binary: the 8-queens problem,with dense constraints.
##???????????嘶屎?????


chess.obj <- rep (1, 64)
q8 <- make.q8 ()
chess.dir <- rep (c("=", "<"), c(16, 26))
chess.rhs <- rep (1, 42)
chesslp<-lp ('max', chess.obj, , chess.dir, chess.rhs, dense.const = q8,all.bin=TRUE, num.bin.solns=3)
chesslp$solution


###�???????

assign.costs <- matrix (c(2, 7, 7, 2, 7, 7, 3, 2, 7, 2, 8, 10, 1, 9, 8, 2), 4, 4)

## End(Not run)
lp.assign (assign.costs)
## Not run: Success: the objective function is 8
lp.assign (assign.costs)$solution




###Example2	?????????怨婊?
obj <- c(3, 1, 3)
mat <- matrix(c(-1, 0, 1, 2, 4, -3, 1, -3, 2), nrow = 3)
#       [,1] [,2] [,3]
# [1,]   -1    2    1
# [2,]    0    4   -3
# [3,]    1   -3    2
dir <- c("<=", "<=", "<=")
rhs <- c(4, 2, 3)
types <- c("I", "C", "I")
max <- TRUE

Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)


####�????�????1
 library(goalprog)
 coefficients=matrix(c(5,1,4,6,10,-2,4,8),4)
 targets=c(60,0,36,48)
 achievements=data.frame(objective=1:4,priority=c(1,2,3,4),p=c(10,0,1,0),n=c(0,1,0,1))
 soln=llgp(coefficients,targets,achievements)
 soln$converged
soln$out

####�????�????2
conmat<-matrix(c(1,1,5,1,1,0,3,1),4)
targets<-c(10,4,56,12)
priority<-c(1,2,3,4)
archievements<-data.frame(objective=1:4,priority=c(1,1,2,3),p=c(2,3,0,1),n=c(0,0,1,0))
soln=llgp(conmat,targets,achievements)
soln$converged
soln$out


lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3))

solve(lps.model)
