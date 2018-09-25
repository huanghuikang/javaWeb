XML解析<br>
简介:xml解析就是读写xml的意思<br>
DOM解析：
将文档加载进内存，形成一颗dom树(document对象)，将文档的各个组成部分封装为一些对象。
优点：因为，在内存中会形成dom树，可以对dom树进行增删改查。<br>
缺点：dom树非常占内存，解析速度慢。<br>
SAX解析:
逐行读取，基于事件驱动<br>
优点：不占内存，速度快<br>
缺点：只能读取，不能回写(改数据)<br>
JAXP：
sun公司提供的解析。支持dom和sax。JAXP（Java API for XMLProcessing，意为XML处理的Java API）,它提供解析和验证XML文档的能力。<br>
JDOM：
JDOM是一个开源项目，它基于树型结构，利用纯JAVA的技术对XML文档实现解析、生成、序列化以及多种操作。
DOM4J：
dom for java
dom4j是一个Java的XML API，是jdom的升级品，用来读写XML文件的。dom4j是一个十分优秀的JavaXML API，具有性能优异、功能强大和极其易使用的特点，它的性能超过sun公司官方的dom技术
