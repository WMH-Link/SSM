<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的首页</title>
<!-- 
<frameset rows="20%,80%">
	<frame src=""></frame>
	
	<frameset cols="10%,90%">
		<frame src=""></frame>
		<frame src=""></frame>
	</frameset>
	
</frameset>
 -->
</head>
<body>

<form action="http://www.baidu.com" method="get">
	<a href="http://www.baidu.com">百度</a>
	<h1>我的百度</h1>
	<h3>我的百度</h3>
	<h6>我的百度</h6>
	<p>你的百度1</p>
	<p>你的百度2</p>
	<span>你的益达1</span><br/>
	<span>你的益达2</span>&nbsp;&nbsp;&nbsp;&nbsp;
	<span>你的益达3</span><br/>
	<input type="text" name="baidu" id="baidu">
	<!--button的几种方式  -->
	<input type="button" name="baidu" value="搜索">
	<button>搜索</button>
	
	<input type="radio" name="sex" value="1"/><label>男</label>
	<input type="radio" name="sex" value="2"/><label>女</label>
	<input type="radio" name="sex" value="3"/><label>保密</label><br/>
	
	<input type="checkbox" name="habbies" value="1"/><label>篮球</label>
	<input type="checkbox" name="habbies" value="2"/><label>足球</label>
	<input type="checkbox" name="habbies" value="3"/><label>羽毛球</label>
	<input type="checkbox" name="habbies" value="4"/><label>排球</label><br/>
	<label>文本域</label><textarea rows="10" cols="10"></textarea>
	
	<select name="sex"> 
		<option value="1">男</option>
		<option value="2">女</option>
		<option value="3">保密</option>
	</select><br/>
	<table border="1">
		<caption>学生信息表</caption>
		<thead>
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<td>性别</td>
				<td>联系电话</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>007</td>
				<td>张三</td>
				<td>男</td>
				<td>12345678977</td>
			</tr>
			<tr>
				<td>007</td>
				<td>张三</td>
				<td>男</td>
				<td>12345678977</td>
			</tr>
			<tr>
				<td>110</td>
				<td>李四</td>
				<td>男</td>
				<td rowspan="2">1231456977</td>
			</tr>
			<tr>
				<td>120</td>
				<td>王五</td>
				<td>男</td>				
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td>学号</td>
				<td>姓名</td>
				<td>性别</td>
				<td>联系电话</td>
			</tr>
		</tfoot>
	</table>
	文件：<input type="file"><br/>
	<input type="image" src=""/><br/>
	<img alt="文字" src="http://www.baidu.com/images/404_bg_right.png"><br/>
	
	<dl>
		<dt>流行音乐</dt>
	 	<dd>真心英雄</dd>
	 	<dd>真心英雄</dd>
	</dl>
	<ul>
		<li>学习HTML</li> 
		<li>显摆，炫耀</li> 
		<li>因为我已经爱上了我的电脑，我想给她点HTML爱情调料。</li> 
	</ul>
	<br/>
	<address>
	此文档的作者：<a href="mailto:bill@microsoft.com">Bill Gates</a>
	</address>
	<img src ="planets.gif" alt="Planets" usemap ="#planetmap" />
<br/><br/>
<map id ="planetmap">
 <area shape ="rect" coords ="0,0,82,126" href ="sun.htm" alt="Sun" />
 <area shape ="circle" coords ="90,58,3" href ="mercur.htm" alt="Mercury" />
 <area shape ="circle" coords ="124,58,8" href ="venus.htm" alt="Venus" />
</map>
	<br/>
	<article>
<h2>Netscape Is Dead</h2>
AOL has now officially announced that they will end 
the development and support of all Netscape browsers.
</article>
	<div>
<h2>Netscape Is Dead</h2>
AOL has now officially announced that they will end 
<hr> the development and support of all Netscape browsers.</hr>
</div>
	
	<br/>
	<bdo dir="rtl">Here is some text</bdo>
	<br> 
	毛泽东说过：<blockquote cite="">帝国主义都是纸老虎 ... </blockquote>
	<br/>
	<input id="myCar" list="cars" />
<datalist id="cars">
  <option value="BMW">
  <option value="Ford">
  <option value="Volvo">
</datalist>
	<br/>
	<datatemplate>
		<rule>规则一</rule>
		<rule>规则二</rule>
		<rule>规则三</rule>
	</datatemplate>
	<br/>
	a dozen is <ins>12</ins> <del>21</del>  pieces
	
	<br/>
	
	<legend>day day up</legend>
	<details open="true" >我在大路边，捡了一块钱</details>
	
	
	
	<br/>
	<dialog>
	  <dt>老师</dt>
	  <dd>2+2 等于？</dd>
	  <dt>学生</dt>
	  <dd>4</dd>
	  <dt>老师</dt>
	  <dd>答对了！</dd>
	</dialog>
	<fieldset>
		<legend>健康信息：</legend>
		<form>
		<label>身高：<input type="text" /></label>
		<label>体重：<input type="text" /></label>
		</form>
	</fieldset>
	<br/>
	<p>The <i class="taxonomy">Felis silvestris catus</i> is cute.</p>
	<p>The term <i>prose content</i> is defined above.</p>
	<p>There is a certain <i lang="fr">je ne sais quoi</i> in the air.</p>	
	<hr>	
	<br/>
	<m>标签定义带有记号的文本。请在需要突出显示文本时使用 <m>标签。<br>
	<menu>
	<li><input type="checkbox" />Red</li>
	<li><input type="checkbox" />blue</li>
	</menu>
	<nav>
	  <a href="index.htm">w3school 在线教程</a>
	  <a href="html5_meter.htm"> 上一页</a>
	  <a href="html5_nest.htm"> 下一页</a>
	</nav>
	<select>
      <optgroup label="Swedish Cars">
      <option value ="volvo">Volvo</option>
      <option value ="saab">Saab</option>
      </optgroup>

      <optgroup label="German Cars">
      <option value ="mercedes">Mercedes</option>
      <option value ="audi">Audi</option>
      </optgroup>
</select>
<br>
<object id="Slider1" width="100" height="50">
  <param name="BorderStyle" value="1" />
  <param name="MousePointer" value="0" />
  <param name="Enabled" value="1" />
  <param name="Min" value="0" />
  <param name="Max" value="10" />
</object>

<br>
<span>BorderStyle</span><span>BorderStyle</span><span>BorderStyle</span><br>
<pre>BorderStyle</pre><pre>BorderStyle</pre><pre>BorderStyle</pre>
<br>
<progress><span id="objprogress">85</span>%</progress>

<br>
这是一个短的引用：
<q>这是一个短的引用：</q>

<br>
	我们在每天早上 <time>9:00</time> 开始营业。
	我在 <time datetime="2016-07-15">情人节</time> 有个约会。
	<br>
	<br>
	<br>
	<input type="submit" value="提交">
</form>
</body>

</html>