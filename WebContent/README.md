一、JSP全称是Java Server Pages，它和servle技术一样，都是SUN公司定义的一种用于开发动态web资源的技术。JSP/Servlet规范。JSP实际上就是Servlet。<br>
JSP这门技术的最大的特点在于，写jsp就像在写html，但它相比html而言，html只能为用户提供静态数据，而Jsp技术允许在页面中嵌套java代码，为用户提供动态数据。
<br>
JSP的3个指令<br>
JSP指令（directive）是为JSP引擎而设计的，它们并不直接产生任何可见输出，而只是告诉引擎如何处理JSP页面中的其余部分。<br>
在JSP 2.0规范中共定义了三个指令：【page、Include、taglib】
<br>
属性：
少用<br>
session: 是否会自动创建session对象。默认值是true;<br>
buffer: JSP中有javax.servlet.jsp.JspWriter输出字符流。设置。输出数据的缓存大小，默认是8kb<br>
isErrorPage: 是否创建throwable对象。默认是false;<br>
常用：演示<br>
import 和java代码中的import是一样的<br>
<%@ page import="java.util.Date,java.util.List"%><br>
或者：<br>
<%@ page import="java.util.Date"%><br>
<%@ page import="java.util.List"%><br>
注：JSP会自动导入以下的包：<br>
import java.lang.*;<br>
import javax.servlet.*;<br>
import javax.servlet.http.*;<br>
import javax.servlet.jsp.*;<br>
errorPage: 如果页面中有错误，则跳转到指定的资源<br>
errorPage="/uri" 如果写“/”则代表当前应用的目录下，绝对路径。<br>
如果不写“/”则代表相对路径。<br>

contextType: 等同于response.setContextType("text/html;charset=utf-8");<br>
pageEncoding: 告诉JSP引擎要翻译的文件使用的编码。<br>
isELIgnored: 是否支持EL表达式。 默认是false<br>
include<br>
静态包含：把其它资源包含到当前页面中。<br>
<%@ include file="/include/header.jsp" %><br>
动态包含：<br>
<jsp:include page="/include/header.jsp"></jsp:include><br>
两者的区别：翻译的时间段不同<br>
前者：在翻译时就把两个文件合并<br>
后者：不会合并文件，当代码执行到include时，才包含另一个文件的内容。<br>

原则：能用静的就不用动的。<br>
Taglib 【后面再学】<br>
作用：在JSP页面中导入JSTL标签库。替换jsp中的java代码片段。<br>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><br>
JSP的6个常用动作<br>
<jsp:include > 动态包含<br>
<jsp:forward > 请求转发<br>
注：一个jsp页面只能写一个转发<br>
<jsp:param > 设置请求参数<br>
<jsp:useBean > 创建一个对象<br>
<jsp:setProperty > 给指定的对象属性赋值<br>
<jsp:getProperty > 取出指定对象的属性值<br>
<p/>
JSP的9大内置对象<br>
内置对象是指在JSP的<%=%> 和<% %>中可以直接使用的对象<br>
对象名	类型	说明<br>
request &nbsp;&nbsp;	javax.servlet.http.HttpServletRequest	<br>
response &nbsp;&nbsp;	javax.servlet.http.HttpServletResponse	<br>
session &nbsp;&nbsp;	javax.servlet.http.HttpSession &nbsp;&nbsp;	由session="true"开关<br>
application	 &nbsp;&nbsp; javax.servlet.ServletContext	<br>
exception &nbsp;&nbsp;	java.lang.Throwable &nbsp;&nbsp;	由isErrorPage="false"开关<br>
page &nbsp;&nbsp;	java.lang.Object当前对象this &nbsp;&nbsp;	当前servlet实例<br>
config &nbsp;&nbsp;	javax.servlet.ServletConfig	<br>
out	 &nbsp;&nbsp; javax.servlet.jsp.JspWriter &nbsp;&nbsp;	字符输出流，相当于 printWriter对象<br>
<front color="red">pageContext	 &nbsp;&nbsp; javax.servlet.jsp.PageContext	</front><br>
<div></div>
pageContext(重要)<br>
概述<br>
本身也是一个域对象：它可以操作其它三个域对象（request session application）的数据<br>
常用方法<br>
void setAttribute(String name,Object o);<br>
Object getAttribute(String name);<br>
void removeAttribute(String name);<br>
操作其它域对象的方法<br>
void setAttribute(String name,Object o，int Scope);<br>
Object getAttribute(String name,int Scope);<br>
void removeAttribute(String name,int Scope);<br>
scpoe的值：<br>
PageContext.PAGE_SCOPE <br>
PageContext.REQUEST_SCOPE <br>
PageContext.SESSION_SCOPE <br>
PageContext.APPLICATION_SCOPE<br>
<br>
JSP的EL表达式<br>
EL概述:EL表达式：expression language 表达式语言,用于简化jsp中java代码开发。<br>
&nbsp;&nbsp;它不是一种开发语言，是jsp中获取数据的一种规范<br>
获取数据<br>
EL表达式只能获取存在4个作用域中的数据<br>
${u} 原理： pageContext.findAttribute("u");<br>
EL获取对于null这样的数据，在页面中表现为空字符串<br>
${u.name} == u.getName()方法<br>
点（.） 运算符相当于调了getter方法，点后页面跟的是属性名。<br>
<br><br><br>
二、Servlet简介<br>
Servlet是sun公司提供的一门用于开发动态web资源的技术。<br>
Sun公司在其API中提供了一个servlet接口<br>
Servlet 是运行在 Web 服务器中的小型 Java 程序（即：服务器端的小应用程序）。<br>
servlet 通常通过 HTTP（超文本传输协议）接收和响应来自 Web 客户端的请求。<br>
若想开发一个动态web资源(即开发一个Java程序向浏览器输出数据)，要完成2个步骤：<br>
&nbsp;&nbsp;&nbsp;&nbsp;编写一个Java类，实现servlet接口。<br>
&nbsp;&nbsp;&nbsp;&nbsp;把开发好的Java类部署到web服务器中。<br>
1、Servlet生命周期（重要）<br>
Servlet生命周期四个状态：实例化-->初始化-->服务->销毁<br>
出生：（实例化-->初始化）第一次访问Servlet就出生（默认情况下）<br>
活着：（服务）应用活着，servlet就活着<br>
死亡：（销毁）应用卸载了servlet就销毁。<br>
2、Servlet实现的三种方式<br>
&nbsp;&nbsp;实现javax.servlet.Servlet接口<br>
&nbsp;&nbsp;继承javax.servet.GenericServlet类(适配器模式)<br>
&nbsp;&nbsp;继承javax.servlet.http.HttpServlet类（模板方法设计模式）<br>
HelloServlet(是HttpServlet的子类)-->>HttpServlet(是GenerServlet的子类)-->>GenericServlet(是Servlet实现类)-->>Servlet(接口)<br>
3、Servlet映射细节<br>
掌握Servlet映射规则<br>
通配符* 代表任意字符串，如图：<br><br>
url-pattern: *.do  以*.字符串的请求都可以访问 注：不要加/<br>
url-pattern: /*  任意字符串都可以访问<br>
url-pattern： /action/* 以/action开头的请求都可以访问<br>
匹配规则：<br>
优先级：从高到低<br>
绝对匹配-->  /开头匹配 --> 扩展名方式匹配<br><br>
如果url-pattern的值是/，表示执行默认映射。所有资源都是servlet<br>
<br><br><br>
三、HTTP简介<br>
4HTTP协议（HyperText Transfer Protocol，超文本传输协议）是用于从WWW服务器传输超文本到本地浏览器的传输协议。它可以使浏览器更加高效，使网络传输减少。它不仅保证计算机正确快速地传输超文本文档，还确定传输文档中的哪一部分，以及哪部分内容首先显示(如文本先于图形)等。<br>
1、HTTP消息头
HTTP消息头是指在超文本传输协议（ Hypertext Transfer Protocol ，HTTP）的请求和响应消息中，协议头部分的那些组件。<br>
HTTP消息头用来准确描述正在获取的资源、服务器或者客户端的行为<br>
HTTP消息头定义了HTTP事务中的具体操作参数。<br>
消息头包括请求时的消息头（请求头）和响应时的消息头（响应头）<br>
1.1HTTP的常见请求头<br>
Content-Length：表示请求消息正文的长度。<br>
Cookie：这是最重要的请求头信息之一<br>
Host：初始URL中的主机和端口。<br>
1.2HTTP的常见响应头<br>
Allow：	服务器支持哪些请求方法（如GET、POST等）。<br>
Date	 当前的GMT时间。你可以用setDateHeader来设置这个头以避免转换时间格式的麻烦。<br>
Refresh	表示浏览器应该在多少时间之后刷新文档，以秒计。除了刷新当前文档之外，你还可以通过setHeader("Refresh", "5; URL=http://host/path")让浏览器读取指定的页面。 <br>
&nbsp;&nbsp;&nbsp;&nbsp;注意Refresh头不属于HTTP 1.1正式规范的一部分，而是一个扩展，但Netscape和IE都支持它。<br>
四、Request&Response
Web服务器收到客户端的http请求，会针对每一次请求，分别创建一个用于代表请求的request对象、和代表响应的response对象。<br>
1、响应正文（主体）<br>
getWrite(); 字符输出流<br>
getOutputStream(); 字节输出流<br>
2、响应编码:
案例：向客户端输出中文<br>
3、响应状态码<br>
常见的状态码参照：http://tool.oschina.net/commons?type=5<br>
404&nbsp;&nbsp;请求失败，请求所希望得到的资源未被在服务器上发现<br>
200&nbsp;&nbsp;请求已成功，请求所希望的响应头或数据体将随此响应返回。<br>
302&nbsp;&nbsp; 重定向<br>
500&nbsp;&nbsp; 服务抛出异常<br>
