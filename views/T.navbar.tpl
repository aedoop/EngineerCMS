{{define "navbar"}}
<!-- navbar-inverse一个带有黑色背景白色文本的导航栏 
固定在页面的顶部，向 .navbar class 添加 class .navbar-fixed-top
为了防止导航栏与页面主体中的其他内容
的顶部相交错，需要向 <body> 标签添加内边距，内边距的值至少是导航栏的高度。
-->
<style type="text/css">
    a.navbar-brand{display: none;}  
    @media (max-width: 960px) { 
     a.navbar-brand{ display: inline-block;} 
    }
  </style>
<nav class="navbar navbar-default navbar-static-top" role = "navigation">
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle = "collapse"  data-target = "#target-menu">  
      <span class="sr-only">qieh</span>  
      <span class="icon-bar"></span>  
      <span class="icon-bar"></span>  
      <span class="icon-bar"></span>  
    </button>
    <a id="11" class="navbar-brand">水利设计</a>
  </div>
  <div class="collapse navbar-collapse" id = "target-menu"> 
    <ul class="nav navbar-nav">
       <li {{if .IsIndex}}class="active"{{end}}>
        <a href="/index">首页</a>
      </li>
      <li {{if .IsProject}}class="active"{{end}}>
        <a href="/project/">项目</a>
      </li>      
      <li {{if .IsOnlyOffice}}class="active"{{end}}>
        <a href="/onlyoffice">OnlyOffice</a>
      </li>
      <li {{if or .IsDesignGant .IsConstructGant}}class="dropdown active"{{end}}>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          进度 <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li {{if .IsDesignGant}}class="active"{{end}}>
            <a href="/projectgant">设计进度</a>
          </li>
          <li {{if .IsConstructGant}}class="active"{{end}}>
            <a href="/projectgant">施工进度</a>
          </li>
        </ul>
      </li>
      <form class="navbar-form navbar-left" role="search" method="get" action="/search">
        <div class="form-group">
          <input type="text" class="form-control"  class="search-query span2" placeholder="Search Products" name="keyword" id="keyword"></div>
          <input type="hidden" name="productid" id="productid" value="{{.Category.Id}}">
          <button type="submit" class="btn btn-default" id="search">Submit</button>
      </form>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          规范 <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li>
            <a href="http://112.74.42.44:8081" target="_blank">查询</a>
          </li>
          <li>
            <a href="http://112.74.42.44:8081/legislation" target="_blank">对标</a>
          </li>
        </ul>
      </li>
      <li {{if or .IsMeetingroomCalendar .IsCarCalendar .IsOrderCalendar .IsAttendanceCalendar}}class="dropdown active"{{end}} >
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          预订 <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li {{if .IsMeetingroomCalendar}}class="active"{{end}}>
            <a href="/meetingroom">会议室&值班安排</a>
          </li>
          <li {{if .IsCarCalendar}}class="active"{{end}}>
            <a href="/car">车辆</a>
          </li>
          <li {{if .IsOrderCalendar}}class="active"{{end}}>
            <a href="/order">订餐</a>
          </li>
          <li {{if .IsAttendanceCalendar}}class="active"{{end}}>
            <a href="/attendance">考勤</a>
          </li>
        </ul>
      </li>
    </ul>

    <!-- <div class="pull-right"> -->
    <ul class="nav navbar-nav navbar-right">
        {{if .IsLogin}}
          {{if .IsAdmin}}
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{.Username}} <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="/admin" title="管理">进入后台</a></li>
                <li><a href="/login" title="重新登录">重新登录</a></li>
                <li><a href="/login?exit=true">退出</a></li>
              </ul>
            </li>
          {{else}}
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{.Username}} <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="/user" title="用户资料">用户资料</a></li>
                <li><a href="/login" title="重新登录">重新登录</a></li>
                <li><a href="/login?exit=true">退出</a></li>
              </ul>
            </li>
          {{end}}
        {{else}}
          {{if .IsAdmin}}
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{.Username}} <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="/admin" title="管理">进入后台</a></li>
                <li><a href="/login" title="重新登录">重新登录</a></li>
                <li><a href="/login?exit=true">退出</a></li>
              </ul>
            </li>
          {{else}}
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{.Username}} <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="/login">登陆</a></li>
              </ul>
            </li>
          {{end}}
        {{end}}
        <li {{if .IsWiki}}class="active"{{end}}>
          <a href="/wiki">Wiki</a>
        </li> 
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          帮助 <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li>
            <a href="/doc/ecms" title="工程师知识管理系统">EngineerCMS</a>
          </li>
          <li>
            <a href="/doc/meritms" title="价值和成果管理系统">MeritMS</a>
          </li>
          <li>
            <a href="/doc/hydrows" title="水利供水管线设计工具">HydroWS</a>
          </li>
        </ul>
      </li>      
    </ul>
    <!-- </div> -->
  </div>  
</nav>
{{end}}

