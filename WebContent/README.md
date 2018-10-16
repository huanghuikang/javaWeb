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
<br><br><br>
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
4、请求重定向
请求重定向指：一个web资源收到客户端请求后，通知客户端去访问另外一个web资源，这称之为请求重定向。<br>
重定向特点：地址栏会变，并发送2次请求，增加服务器负担<br>
实现方式<br>
response.sendRedirect()<br>
实现原理：<br>
302/307状态码和location头即可实现重定向<br>
转发特点：地址栏不会变，客户端发送一次请求<br>
4.1、response细节<br>
getOutputStream和getWriter方法分别用于得到输出二进制数据、输出文本数据<br>
getOutputStream和getWriter这两个方法互相排斥，调用了其中的任何一个方法后，就不能再调用另一方法。-->>  会抛异常。<br>
Servlet程序向ServletOutputStream或PrintWriter对象中写入的数据将被Servlet引擎从response里面获取，Servlet引擎将这些数据当作响应消息的正文，然后再与响应状态行和各响应头组合后输出到客户端。 <br>
Serlvet的service方法结束后，Servlet引擎将检查getWriter或getOutputStream方法返回的输出流对象是否已经调用过close方法，如果没有，Servlet引擎将调用close方法关闭该输出流对象。 <br>
4.2、HttpServletRequest
简介：<br>
HttpServletRequest对象代表客户端的请求，当客户端通过HTTP协议访问服务器时，HTTP请求头中的所有信息都封装在这个对象中，开发人员通过这个对象的方法，可以获得客户这些信息。<br>
***request常用方法<br>
4.21、获得客户端信息<br>
getRequestURL方法返回客户端发出请求时的完整URL。<br>
getRequestURI方法返回请求行中的资源名部分。<br>
getQueryString 方法返回请求行中的参数部分。<br>
getRemoteAddr方法返回发出请求的客户机的IP地址<br>
getRemoteHost方法返回发出请求的客户机的完整主机名<br>
getRemotePort方法返回客户机所使用的网络端口号<br>
getLocalAddr方法返回WEB服务器的IP地址。<br>
getLocalName方法返回WEB服务器的主机名<br>
getMethod得到客户机请求方式<br>

2.22、获得客户端请求头<br>
getHead(name)方法 <br>
getHeaders(String name)方法 <br>
getHeaderNames方法<br>
4.23、获得客户端请求参数(客户端提交的数据)<br>
getParameter(name)方法<br>
getParameterValues（String name）方法<br>
getParameterNames方法 <br>
getParameterMap方法  //做框架用，非常实用<br>
getInputStream<br>
5、实现请求转发<br>
请求转发指一个web资源收到客户端请求后，通知服务器去调用另外一个web资源进行处理。<br>
request对象提供了一个getRequestDispatcher方法，该方法返回一个RequestDispatcher对象，调用这个对象的forward方法可以实现请求转发。<br>
request对象同时也是一个域对象，开发人员通过request对象在实现转发时，把数据通过request对象带给其它web资源处理。<br>
setAttribute方法 <br>
getAttribute方法  <br>
removeAttribute方法<br>
getAttributeNames方法<br>
6、实现请求重定向<br><br>
重定向机制的运作流程<br>
6.1、用户在浏览器端输入特定URL，请求访问服务器端的某个组件<br>
6.2、服务器端的组件返回一个状态码为302的响应结果。<br>
6.3、当浏览器端接收到这种响应结果后，再立即自动请求访问另一个web组件<br>
6.4、浏览器端接收到来自另一个web组件的响应结果。<br>
HttpServeltResponse的sendRedirect(String location)用于重定向<br>
7、转发和重定向的区别<br>
域对象：session,request,page...<br>
域:区间、范围<br>
重定向：以前的request中存放的变量全部失效，并进入一个新的request作用域。<br>
转发：以前的request中存放的变量不会失效，就像把两个页面拼到了一起。<br>
<br><br><br>
五、会话<br>
什么是会话<br>
会话可简单理解为：用户开一个浏览器，点击多个超链接，访问服务器多个web资源，然后关闭浏览器，整个过程称之为一个会话。<br>
1、保存会话数据的两种技术<br>
1.1、Cookie<br>
Cookie是客户端技术，程序把每个用户的数据以cookie的形式写给用户各自的浏览器。当用户使用浏览器再去访问服务器中的web资源时，就会带着各自的数据去。这样，web资源处理的就是用户各自的数据了。<br>
1.2、Session<br>
Session是服务器端技术，利用这个技术，服务器在运行时可以为每一个用户的浏览器创建一个其独享的HttpSession对象，由于session为用户浏览器独享，所以用户在访问服务器的web资源时，可以把各自的数据放在各自的session中，当用户再去访问服务器中的其它web资源时，其它web资源再从用户各自的session中取出数据为用户服务<br>
2、Cookie API<br>
2.1、javax.servlet.http.Cookie<br>
2.21、javax.servlet.http.Cookie类用于创建一个Cookie<br>
2.22、response接口中定义了一个addCookie方法，它用于在其响应头中增加一个相应的Set-Cookie头字段。<br> 
2.23、request接口中也定义了一个getCookies方法，它用于获取客户端提交的Cookie。<br>
3、Cookie类的方法： <br>
public Cookie(String name,String value)<br>
setValue与getValue方法 <br>
setMaxAge与getMaxAge方法 (秒)<br>
setPath与getPath方法<br>
setDomain与getDomain方法<br>
getName方法<br>
4、Cookie应用场景<br>
4.1、记录上次访问时间，用Cookie的maxAge方法，设置cookies的存活时间<br>
4.11、maxAge:cookie的缓存时间。默认是-1，默认存在浏览器的缓存中。单位是秒<br>
&nbsp;&nbsp;&nbsp;&nbsp;负数：表示cookie的数据存在浏览器缓存中<br>
&nbsp;&nbsp;&nbsp;&nbsp;0：表示删除cookie<br>
&nbsp;&nbsp;&nbsp;&nbsp;正数：缓存在持久化磁盘上的时间<br>
5、Cookie细节<br>
一个Cookie只能标识一种信息，它至少含有一个标识该信息的名称（NAME）和设置值（VALUE）。 <br>
一个WEB站点可以给一个WEB浏览器发送多个Cookie，一个WEB浏览器也可以存储多个WEB站点提供的Cookie。<br>
浏览器一般只允许存放300个Cookie，每个站点最多存放20个Cookie，每个Cookie的大小限制为4KB。<br>
如果创建了一个cookie，并将他发送到浏览器，默认情况下它是一个会话级别的cookie（即存储在浏览器的内存中），用户退出浏览器之后即被删除。若希望浏览器将该cookie存储在磁盘上，则需要使用maxAge，并给出一个以秒为单位的时间。将最大时效设为0则是命令浏览器删除该cookie。<br>
3、Session API<br>
3.1session概述<br>
在WEB开发中，服务器可以为每个用户浏览器创建一个会话对象（session对象），注意：一个浏览器独占一个session对象(默认情况下)。因此，在需要保存用户数据时，服务器程序可以把用户数据写到用户浏览器独占的session中，当用户使用浏览器访问其它程序时，其它程序可以从用户的session中取出该用户的数据，为用户服务。<br>
Session和Cookie的主要区别在于：<br>
Cookie是把用户的数据写给用户的浏览器。<br>
Session技术把用户的数据写到用户独占的session中。<br>
Session对象由服务器创建，开发人员可以调用request对象的getSession方法得到session对象。<br>
3.2、Session的疑问<br>
疑问：服务器是如何实现一个session为一个用户浏览器服务的？<br>
服务器会为每个浏览器分配一个session ID,然后把Session ID通过Cookie的形式存储在客户端<br>
3.3、Session的应用场景<br>
购物车实现、验证码登录<br>
3.4、HttpSession常用方法<br>
把数据保存在HttpSession对象中，该对象也是一个域对象。<br>
void setAttribute(String name,Object value);<br>
Object getAttribute(String name);<br>
void removeAttribute(String name);<br>
HttpSession.getId()<br>
setMaxInactiveInterval(int interval)  设置session的存活时间<br>
invalidate() 使此会话无效<br>

3.5、getSession():内部执行原理<br>
HttpSession request.getSession():内部执行原理<br>
1、获取名称为JSESSIONID的cookie的值。<br>
2、没有这样的cookie，创建一个新的HttpSession对象，分配一个唯一的SessionID，并且向客户端写了一个名字为JSESSIONID=sessionID的cookie<br>
3、有这样的Cookie，获取cookie的值（即HttpSession对象的值），从服务器的内存中根据ID找那个HttpSession对象：<br>
找到了：取出继续为你服务。<br>
找不到：从2开始。<br>
3.6、Session的状态三种：
创建：当浏览器第一次访问服务器动态资源就创建<br>
活着：服务器应用运行时<br>
死亡：
Session.invalidate();强制销毁<br>
超时：默认30分钟<br>
setMaxInactiveInterval(int ）单位秒<br>
