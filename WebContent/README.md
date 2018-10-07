JSP全称是Java Server Pages，它和servle技术一样，都是SUN公司定义的一种用于开发动态web资源的技术。JSP/Servlet规范。JSP实际上就是Servlet。<br>
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
