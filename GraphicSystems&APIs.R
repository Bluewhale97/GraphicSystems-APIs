#1. diversified graphic systems:
#grid graphic system provides lowl evel access to graphic primitives, giving programmers a great deal of flexibility in the creation of graphic output
#lattice package provides an intuitive appraoch for examining multivariate relationships through conditional one-, two, or three-dimensional graphs called trellis graphs
#ggplot2 package provides a method of creating innovative graphs based on a comprehensive graphical grammar

#2. four graphics systems in R

#as stated earlier, there are currently four graphical systems available in R. The base graphics system is written by Ross Ihaka, most of graphis produced in previous rely on base graphics functions

#the grid graphics system, written by Paul Murrell(2011). offering a lower level alternative to the standard graphics system
#users can create arbitrary rectangular regions on graphisc devices, define coordinate systems for each region, and use a rich set of drawing primitives to control the arrangement and appearance of graphic elements
#but the grid package doesnt provide functions for producing statistical graphics or complete plots
#by this, the package is rarely used directly by data analysts and wont be discuss further.
#visit Dr.Murrell's Grid website(http://mng.bz/C86p)for details

#the lattice package written by Deepayan Sarkar(2008) implements trellis graphs, as outlined by Cleveland(1985,1993)
#display the distribution of a variable or the relationship between variables, separately for each level of one or more other variables
#not only beyond Cleveland's orgiginal approach to visualizing multivariate data and now provides a comprehensive alternative system for creating statistical graphisc in R
#a number of packages included(effects, flexclust, Hmisc, mice and odfWeave) using functions in the lattive package to produce graphs

#ggplot2 written by Hadley Wickham(2009a) provides a system for creating graphs based on the grammar of graphics described by Wilkinson(2005) and expanded by Wickham(2009b)
#the intention of the ggplot2 package is to provide a comprehensive, grammar-based system for generating graphs in a unified and coherent manner, allowing users to create new and innovative data visualizations
#the power of this approach has led ggplot2 to become an important tool for visualizing data using R

#3. access to graphic systems 

#System Included          in base installation?       Must be explicitly loaded?
#base                            Yes                       No
#grid                            Yes                       Yes
#lattice                          Yes                      Yes
#ggplot2                         No                       Yes

#4. learn more about lattice package
#www,statmethods.net/RiA/lattice.pdf
#or from the publisher's website at www.manning.com/RinActionSecondEdition

#5. introduction to the ggplot2 package

#comprehensive and coherent grammar
#provides a consistency to graph creation that is ofetn lacking inR and allows to create graph types that are innovative and novel

install.packages("ggplot2")
library(ggplot2)
ggplot(data=mtcars, aes(x=wt, y=mpg))+ geom_point()+
  labs(title="Automobile Data", x="Weight", y="Miles Per Gallon")

#the ggplot() function initializes the plot and specifies the data source and variables(wt, mog)
#the options in the aes() function specify what role each variable will play(aes stands for aesthetics, or how information is represented visualy)
#wt values are mapped to distances along the x-axis, and mpg values are mapped to distances along the y-axis

#geom_point() function draws points on the graph, creating s catter plot
#labs() is optional and adds annotations(axis labels and a title)

ggplot(data=mtcars, aes(x=wt, y=mpg))+geom_point(pch=17, color="blue",size=2)+
  geom_smooth(method="lm", color="red",linetype=2)+
  labs(title="Automobile Data", x="Weight",y="Miles Per Gallon")
#pch=17 sets point shape to triangles, doubled the points size(size=2) 
#geom_smooth() adds a smoothed line, here a linear fit is requiested(method="lm)
#linetype=2 means dashed line 
#by default, the line includes 95% CV



#grouping and faceting
#grouping displays two or more groups of observations in a single plot
#faceting displays groups of observations in separate, side-by-side plots
#ggplot2 package uses factors when defining groups or facets

mtcars$am<-factor(mtcars$am, levels=c(0,1),
                  labels=c("Automatic","Manual"))
mtcars$vs<-factor(mtcars$vs, levels=c(0,1),
                  labels=c("V-Engine","Straight Engine"))
mtcars$cyl<-factor(mtcars$cyl)


library(ggplot2)


ggplot(data=mtcars, aes(x=hp, y=mpg, shape=cyl, color=cyl)) +geom_point(size=3)+
  facet_grid(am~vs)+
  labs(title="Automobile Data by Engine Type", x="Horsepower", y="Miles Per Galon")
#facet_grid() fuction separate scaterpots for each combination of transmission type(automatic vs. manual) and engine arrangement(V-engine vs. straight engine)
#in this case, am and vs are the faceting variables and cyl is the grouping variable


#6. specifying the plot type with geoms()

#geom_bar() : bar chiart, options include color, fill and alpha
#geom_boxplot(): box plot options include color, fill, alpha, notch, width
#geom_density(): density plot, options include fill, alpha, linetype
#geom_histogram(): histogram, options include cplor, fill, alpha, linetype, binwidth
#geom_hline(): horizontal lines, options include color, alpha, linetype, size
#geom_jitter(): Jittered points, options include color, size, alpha and shape
#geom_line(): line graph, options include colorvalpha, shape and size
#geom_point(): scatterplot, options include color, alpha, shape, size
#geom_rug(): rug plot, options include color and side
#geom_smooth(): fitted line, options include method, formula, color, fill, linetype and size
#geom_text(): text annotations, options include many; see the help for this function
#geom_violin(): violin plot, options include color, fill, alpha, and linetype.
#geom_vline(): vertical lines, options include color, alpha, linetype and size

#produces the histogram 
data(singer, package="lattice")
ggplot(singer, aes(x=height))+geom_histogram()

#produces the boxplot
ggplot(singer, aes(x=voice.part,y=height))+geom_boxplot()

#note that only the x variable was specified when creating a histogram, but both an x and a y variable were specified for the box plots

#the geom_histogram() function defaults to counts on the y axis when no y variable is specified


#7. common options for geom functions

#color:color of points, lines and borders around filled regions
#fill: color of fiied areas such as bars and density regions
#alpha: transparency of colors, ranging from 0(fully transparent) to 1(opaque)
#linetype: pattern for lines(1=solid, 2=dashed, 3=dotted, 4=dotdash,5=longdash, 6=twodash)
#size: point size and line width
#shape: point shapes(same as pch, with 0=open square, 1= open circle, 2=open triangle, and so on)
#position: position of plotted objects such as bars and point. For bars, "dodge" places grouped bar charts side by side, "stacked" vertically stacks grouped bar charts and "fill" vertically stacks grouped bar charts and standardizes their heights to be equal. For points, "jitter" reduces point overlap
#binwidth: bin width for histograms
#notch: indicates whether box plots should be notched(T/F)
#sides: placement of rug plots on the graph("b"=bottom,"l"=left,"t"=top,"r"=right,"bl"=both bottom and left and so on)
#width: width of box plots

install.packages("car")
library(car)
library(ggplot2)

data(Salaries, package="car")
ggplot(Salaries, aes(x=rank, y=salary))+
  geom_boxplot(fill="cornflowerblue", color="black", notch=T)+
  geom_point(position="jitter",color="blue",alpha=.5)+
  geom_rug(sides="l", color="black")

#the real power of the ggplot2 package is realized whe ngeoms are combined to form new types of plots
library(ggplot2)
data(singer, package="lattice")
ggplot(singer, aes(x=voice.part, y=height))+ 
  geom_violin(fill="lightblue")+
  geom_boxplot(fill="lightgreen", width=.2)
#a combined violin and box plot graph of singer heights by voice part

#8. grouping: plot two or more groups of observations on the same graph

#the ases() in the ggplot() statement assigns variables to roles(visual charactersitics of the plot), so this is a natural place to assign grouping variables

#ask how salaries vary by academic rank, plots three density curves in the same graph
data(Salaries, package="car")
library(ggplot2)
ggplot(data=Salaries, aes(x=salary, fill=rank))+
  geom_density(alpha=.3)

#plot the relationship between years since Ph.D. and salary, grouoping by sex and rank
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank, shape=sex))+ geom_point()

#scatterplot of years since graduation and salary. Academic rank is represented by color and sex is represented by shape

ggplot(Salaries, aes(x=rank, fill=sex))+
  geom_bar(position="stack")+labs(title='position="stack"')

ggplot(Salaries, aes(x=rank, fill=sex))+geom_bar(position="dodge")+labs(title='position="dodge"')

ggplot(Salaries, aes(x=rank, fill=sex))+geom_bar(position="fill")+labs(title='position="dodge"')

#note that the label on the y axis for the thrid graph isnt correct. it should say Proportion rather than count
#we can correct this by adding y="Proportion" to the labs() function


#options can be used in different ways, depending on whether they occur inside or outside the aes() function

ggplot(Salaries, aes(x=rank, fill=sex))+geom_bar()

ggplot(Salaries, aes(x=rank))+geom_bar(fill="red")

ggplot(Salaries, aes(x=rank, fill="red"))+geom_bar()


#9. faceting 

#sometimes relationships are clearer if groups appear in side-by-side graphs rather than overlapping in a single graph
#we can create trellis graphs (called faceted graphs in ggplots) using the facet_wrap() and facet_grid() functions


#ggplot2 facet functions

#facet_wrap(~var, ncol=n): separate plots for each level of var arranged into n columns
#facet_wrap(~var, nrow=n): separate plots for each level of var arranged into n rows
#facet_grid(rowvar~colvar): separate plots for each combination of rowvar and colvar where rowvar represents rows and colvar represents columns
#facet_grid(rowvar~.):separate plots for each level of rowvar, arranged as a single column
#facet_grid(.~colvar): separate plots for each level of colvar, arranged as a single row

data(singer, package="lattice")
library(ggplot2)
ggplot(data=singer, aes(x=height))+ geom_histogram()+facet_wrap(~voice.part, nrow=4)

library(ggplot2)
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank, shape=rank))+geom_point() +facet_grid(.~sex)
#scatterplot of years since graduation and salary, academic rank is represented by color and shape, and sex is faceted

data(singer, package="lattice")
library(ggplot2)
ggplot(data=singer, aes(x=height, fill=voice.part))+ geom_density()+ facet_grid(voice.part~.)


#10. adding smoothed lines
#geom_smooth() options
#method=     smoothing function to use, allowable values include lm, glm, smooth, rlm and gam for linear, generalized linear, loess, robust linear and generalized additive modeling. smooth is the default
#formula=    formula to use in the smoothing function. Examples include y~x(the default), y~log(x),y~poly(x,n) for an nth degree polynomial fit and y~ns(x.n) for a spline fit with n degrees of freedom
#se=         Plots confidence intervals(TRUE/FALSE). TRUE is the default 
#level=     level of confidence interval to use(95% by default)
#fullrange= specifies whether the fit should span the full range of the plot(TRUE) or just the data(FALSE). FALSE is the default

data(Salaries, package="car")
library(ggplot2)
ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary))+geom_smooth()+geom_point()
#scatterplot of years since doctorate and current faculty salary
#a fitted loess smoothed line with 95% confidence limits has been added

ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary, linetype=sex, shape=sex, color=sex))+
  geom_smooth(method=lm, formula=y~poly(x,2),
              se=F, size=1)+
  geom_point(size=2)

#the confidence limits are suppressed to simplify the graph(se=F)
#genders are differentiated by color, symbol shape and line type 

#typically, geom functions call the stat functions implicitly, and we wont need to deal with them directly.
#but it is useful to know how they exist, each stat function has help pages that can aid us in understandng how the geoms work

#for example, te geom_smooth() function relies on the stat_smooth() to calculate the quantities needed to plot a fitted line and its confidence limits
#the help page for geom_smooth() is sparse, but the help page for stat_smooth() contains a wealth of useful information

#11. modifying the appearance of ggplot2 graphs

#changing base graphics parameters has no effect on ggplot2 graphs
#instead, the ggplot2 package offers specific functions for changing the appearce of its graphs
#cutomize the appearance of like axes(limnits, tick marks and tick mark labels), the placement and content of legends and the colors used to represent variable values
#also learn how to create custom themes allowing to add a consistent look and feel to graphs and arrange several plots into a single graph

#12. modification of the appearance:Axes

#functions that control the appearance of axes and tick marks
scale_x_continuous(), #breaks=specifies tick marks, labels=specifies labels for tick marks and limits=controls the range of values displayed
scale_y_continuous()#breaks=specifies tick marks, labels=specifies labels for tick marks and limits=controls the range of values displayed
scale_x_discrete(), #breaks=specifies tick marks, labels=specifies labels for tick marks and limits=controls the range of values displayed
scale_y_discrete()#breaks=specifies tick marks, labels=specifies labels for tick marks and limits=controls the range of values displayed
coord_flip()#reverses the x and y axes

data(Salaries, package="car")
ggplot(data=Salaries, aes(x=rank, y=salary, fill=sex))+
  geom_boxplot()+
  scale_x_discrete(breaks=c("AsstProf","AssocProf","Prof"),
                   labels=c("Assistant\nProfessor","Associate\nProfessor","Full\nProfessor"))+
  scale_y_continuous(breaks=c(50000,100000,150000,200000),
                     labels=c("$50K","$100K","$150K","$200K"))+
  labs(title="Faculty Salary by Rank and Sex", x=" ",y=" ")

#13. mofification of the appearance: legends
#legends are guides that indicate how visual characteristics like color, shape and size represent qualities of the data
#the title and placement are the most commonly customized characteristics
#when modifying a legend title, we have to take into account whether the legend is based on color, fill, size, shape, or a combination
#if the legend represents the fill aesthetic, we can change the title by adding fill="mytitle" to the labs() function
#the placement of the legend is controlled by the legend.position option in the tehme() function, possible values include "left","top","right"(the default) and "bottom"


#specify a two element vector that gives the position within the graoh
#the position of legend appears in the upper left corner and the title is changed from sex to gender

data(Salaries, package="car")
ggplot(data=Salaries, aes(x=rank, y=salary, fill=sex))+
  geom_boxplot()+
  scale_x_discrete(breaks=c("AsstProf","AssocProf","Prof"),
                   labels=c("Assistant\nProfessor","Associate\nProfessor","Full\nProfessor"))+
  scale_y_continuous(breaks=c(50000,100000,150000,200000),
                     labels=c("$50K","$100K","$150K","$200K"))+
  labs(title="Faculty Salary by Rank and Sex", x=" ",y=" ", fill="Gender")+
  theme(legend.position=c(.1,.8))
#in this example, the upper-left corner of the legend was placed 10% from the left edge and 80% from the bottom edge of the graph

#if we want to omit the legend, use legend.position="none"
#the theme() function can change many aspects of a ggplot2 graph's appearance

#14. scales
#ggplot2 package uses scales to map observations from the data space to the visual space
#scales apply to both continuous and discrete variables


ggplot(mtcars, aes(x=wt, y=mpg, size=disp))+
  geom_point(shape=21, color="black", fill="cornsilk")+
  labs(x="Weight", y="Miles Per Gallon",
       title="Bubble Chart", size="Engine\nDisplacement")
#the aes() parameter size=disp generates a scale for the continuous variable disp(engine displacement) and use it to control the size of the points

#in the discrete case, we can use a scale to associate visual cue(for example, color, shape, line type, size and transparency) with the levels of a factor
data(Salaries, package="car")
ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary, color=rank))+
  scale_color_manual(values=c("orange","olivedrab","navy"))+
  geom_point(size=2)
#uses the scale-color_manual() function to set the point colors for the three academic ranks

#if we did color challenged like does purple go with orange, we can use color presets via the scale_color_brewer() and scale_fill_brewer()
ggplot(data=Salaries, aes(x=yrs.since.phd,y=salary, color=rank))+ scale_color_brewer(palette="Set1")+geom_point(size=2)

#replacing palette="Set1" with another value such as "Set2", "Set3","Pastel1", "Pastel2","Paired","Dark2", or "Accent" will result in a different color scheme

#to see the available color sets, use
library(RColorBrewer)
display.brewer.all()

#to generate a display, for more information see help(sclae_color_brewer) and the ColorBrewer(http://colorbrewer2.org)

#15. themes
#the easiest way to place multiple ggplot2 graohs in a single figure is to use the grid.arrange() function in the gridExtra package
install.packages("gridExtra")
library(gridExtra)
p1<-ggplot(data=Salaries, aes(x=rank))+geom_bar()
p2<-ggplot(data=Salaries, aes(x=sex))+geom_bar()
p3<-ggplot(data=Salaries, aes(x=yrs.since.phd,y=salary))+geom_point()

library(gridExtra)
grid.arrange(p1,p2,p3,ncol=3)

#16. saving graphs
#we can save the graphs created by ggplot2 using the standard methods but convenience functin named ggsave()  can be particularly useful
#options include which plot to save, where to save it and in what format
myplot <-ggplot(data=mtcars, aes(x=mpg))+geom_histogram()
ggsave(file="mygraph.png",plot=myplot, width=5, height=4)

#saves myplot as a 5 inch by 4 inch PNG file named mygraph.png in the current working directory
#we can omit the plot= option, the most recently created graph is saved
ggsave(file="mygraph.pdf")

