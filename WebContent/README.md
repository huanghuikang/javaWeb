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
