function RTSP(){
  this.viidToken = ''
  this.url = '' 
}
var times = 0
var token = ''
var url = ''
/**
 * 初始化
 */
RTSP.prototype.init = function() {
  this.loadEvent()
}
/**
 * 加载事件
 */
RTSP.prototype.loadEvent = function() {
  var self = this
  //登录
  $('#unvLoginIn').on('click', function(){
    self.loginI()
  })
  //登出
  $('#unvLoginOut').on('click', function(){
    self.loginOut()
  })
  //查看详情
  $('.unv-look').on('click', function(){
    var detailsArea = $(this).parent().nextAll('.unv-details')
    if(detailsArea.is(':hidden')){
      detailsArea.show()
    }else{
      detailsArea.hide()
    }
  })
 
  //查询摄像机编码
  $('#unvQueryTrack').on('click', function () {
    self.doQueryCarmera()
  })

  //保活
  $('#unvKeepAlive').on('click', function(){
    self.keepalive(1)    
  })
  //注册播放器
  $('#unvBuildChannel').on('click', function(){
    self.buildChannel()
  })
  //启动实况取RTSP URL
  $('#unvGetRTSPURL').on('click', function(){
    self.getRTSPURL()
  })
}

// 每隔 30 秒调用一次接口
var intervalID = setInterval(keepAlive, 30000); // 30000 毫秒 = 30 秒 


//登录
RTSP.prototype.loginI = function() {
  var self = this,
	 serviceIp = $('#unvServiceIp').val(),
	 inPutParams = [{
      'dom': 'unvServiceIp',
      'check': [{
        'text': '服务器IP不能为空',
        'type': 'required'
      }, {
        'text': '服务器IP错误',
        'type': 'regular',
        'reg': /(\d{1,3}\.){3}\d{1,3}/
      }]
    }, {
      'dom': 'unvName',
      'check': [{
        'text': '用户名不能为空',
        'type': 'required'
      }]
    }, {
      'dom': 'unvPassword',
      'check': [{
        'text': '登录密码不能为空',
        'type': 'required'
      }]
    }]
  if(!self.checkParams(inPutParams)){
    return
  }
  $.ajax({
    'type': 'POST',
    'url': 'http://' + serviceIp + ':8088' + '/VIID/login/v2',
    'success': function(res) {
      if(res.AccessCode != null){
        self.loginII(res.AccessCode, serviceIp)
      }else{
        $('#unvLoginState').html('请重新登陆')
      }
    },
    'error': function(error) {
      console.log(error)
    }
  })
}
RTSP.prototype.loginII = function(accessCode, serviceIp) {
  var self = this,
	 userName = $('#unvName').val(),
	 userPwd = $('#unvPassword').val(),
	 enuserName = base64encode(userName),
	 enuserPwd = hex_md5(userPwd),
	 login_signature = hex_md5(enuserName + accessCode + enuserPwd)

  $.ajax({
    'type': 'POST',
    'url': 'http://' + serviceIp + ':8088' + '/VIID/login/v2',
    'data': JSON.stringify({
      'UserName': userName,
      'AccessCode': accessCode,
      'LoginSignature': login_signature
    }),
    'contentType':'application/json',
    'success': function(res) {
      if(res.AccessToken != null){
        $('#unvLoginState').html( '登录成功，用户名：' + userName )
        self.viidToken = res.AccessToken
        token = res.AccessToken
        self.url = 'http://' + serviceIp + ':8088'
        url = self.url
      }else{
        $('#unvLoginState').html(res.ErrMsg)
      }
    },
    'error':function(error){
      console.log(error)
    }
  })
}
//登出
RTSP.prototype.loginOut = function() {
  var self = this
  $.ajax({
    'type': 'POST',
    'url': self.url + '/VIID/logout',
    'headers': {
      'Authorization': self.viidToken
    },
    'success': function(res){
      var errcode = res.ErrCode
      if(errcode === 0){
        $('#unvLoginState').html('退出成功')
        self.viidToken = ''
        self.url = ''
      }else{
        $('#unvLoginState').html(res.ErrMsg)
      }
    },
    'error':function(error){
      console.log(error)
    }
  })
}
/**
 *  查询摄像机信息
 */
 RTSP.prototype.doQueryCarmera = function () {
  var self = this,
    org = $('#unvOrgCode').val(),
    resourcesType = $('#unvResourcesType').val(),
    pageFirst = $('#unvPageFirst').val(),
    pageNumber = $('#unvPageNumber').val(),
    type = 'GET',
    url = self.url + '/VIID/query',
    condition = {
      'ItemNum': 5,
      'Condition': [{
        'QueryType': 256,
        'LogicFlag': 0,
        'QueryData': Number(resourcesType)
      }, {
        'QueryType': 273,
        'LogicFlag': 6,
        'QueryData': ''
      }, {
        'QueryType': 1,
        'LogicFlag': 6,
        'QueryData': ''
      }, {
        'QueryType': 262,
        'LogicFlag': 0,
        'QueryData': '1'
      }, {
        'QueryType': 257,
        'LogicFlag': 0,
        'QueryData': '1'
      }],
      'QueryCount': 1,
      'PageFirstRowNumber': Number(pageFirst),
      'PageRowNum': Number(pageNumber)
    },
    data = {
      'org': org,
      'condition': JSON.stringify(condition)
    }
  $.ajax(
    {
      'type': type,
      'url': url,
      'data': data,
      'contentType': 'application/json',
      'beforeSend': function (XMLHttpRequest) {
        XMLHttpRequest.setRequestHeader('Authorization', self.viidToken)
      },
      'success':
				function (res) {
				  if (res.ErrCode === 0 && res.Result && res.Result.InfoList instanceof Array) {
				    var columns = [
				      {
				        'title': '资源名称',
				        'dataIndex': 'ResItemV1.ResName'
				      }, {
				        'title': '摄像机编码',
				        'dataIndex': 'ResItemV1.ResCode'
				      }, {
				        'title': '资源类型',
				        'dataIndex': 'ResItemV1.ResType',
				        'render': {
				          '0': '不可用',
				          '1': '在线',
				          '2': '离线'
				        }
				      }, {
				        'title': '资源状态（1为在线，2为离线，0为不可用）',
				        'dataIndex': 'ResItemV1.ResStatus'
				      }, {
				        'title': '资源所属组织编码',
				        'dataIndex': 'ResItemV1.OrgCode'
				      }
				    ]
				    self.loadTableDom(res.Result.InfoList, columns, 'unvTableOne')
				  }
				  self.loadTextDom(url, type, syntaxHighlight(data), syntaxHighlight(res), 'unvTextOne')
				}
    })
}

//保活
RTSP.prototype.keepalive = keepAlive

// 保活方法
function keepAlive(){ 
    if(!token) {
      console.log('系统还没登录，请先登录VM')
      return
    }
    
    var urlTemp = url + '/VIID/hadesadapter/user/keepalive',
     type = 'POST'
    $.ajax({
      'type': type,
      'url': urlTemp,
      'headers': {
        'Authorization': token
      },
      'contentType':'application/json',
      'success': function(res) {
        if(res.ErrCode === 0){
          times = times + 1 
          $('#unvKeepAliveTimes').html( '保活第'+times+"次，ErrCode:"+res.ErrCode+", ErrMsg:"+ res.ErrMsg )
          document.getElementById("unvKeepAlive").disabled = true;
        } else {          
          document.getElementById("unvKeepAlive").disabled = false;
          $('#unvKeepAliveTimes').html( '保活第'+times+"次，ErrCode:"+res.ErrCode+", ErrMsg:"+ res.ErrMsg )
        }
        loadTextDom(urlTemp, type, syntaxHighlight(urlTemp), syntaxHighlight(res), 'unvTextOneKeep')
      },
      'error': function(err) {
        console.log(err)
      }
    }) 
}

// 默认折叠详细信息
RTSP.prototype.hideArea = function(){
  var detailsArea = $(this).parent().nextAll('.unv-details')
  detailsArea.hide()
}

//注册播放通道
RTSP.prototype.buildChannel = function() {
  var self = this,
	 channelNum = $('#unvChannelNum').val()
  if(!self.viidToken) {
    alert('系统未登录，请先登录！')
    return
  }
  var inPutParams = [{
    'dom': 'unvChannelNum',
    'check': [{
      'text': '需要申请的通道数量不能为空',
      'type': 'required'
    }]
  }]
  if(!self.checkParams(inPutParams)){
    return
  }
  var url = self.url + '/VIID/live/player/build',
	 type = 'POST',
	 data = JSON.stringify({
    Num: channelNum 
})
  $.ajax({
    'type': type,
    'url': url,
    'data': data,
    'headers': {
      'Authorization': self.viidToken
    },
    'contentType':'application/json',
    'success': function(res) {
      if(res.ErrCode === 0){ 
        document.getElementById("unvBuildChannel").disabled = true;        
        $('#unvTextBuildChannel').html( '注册播放器成功')
      } else {
        document.getElementById("unvBuildChannel").disabled = false;
      }
      self.loadTextDom(url, type, syntaxHighlight(data), syntaxHighlight(res), 'unvTextTwo')
    },
    'error': function(err) {
      console.log(err)
    }
  })
}
//获取RTSPURL
RTSP.prototype.getRTSPURL = function(){
  var self = this,
  streamType = $('#unvStreamType').val()
  cameraCode = $('#unvCameraCode').val()
  if(!self.viidToken) {
    alert('系统未登录，请先登录！')
    return
  }
  var inPutParams = [{
    'dom': 'unvStreamType',
    'check': [{
      'text': '码流类型不能为空',
      'type': 'required'
    }]
  },{
    'dom': 'unvCameraCode',
    'check': [{
      'text': '摄像机编码不能为空',
      'type': 'required'
    }]
  }]
  if(!self.checkParams(inPutParams)){
    return
  }
  var url = self.url + '/VIID/live/start',
	 type = 'POST',
	 data =  JSON.stringify({
    CameraCode: cameraCode,
    StreamType: streamType
    })
  $.ajax({
    'type': type,
    'url': url,
    'data': data,
    'headers': {
      'Authorization': self.viidToken
    },
    'contentType':'application/json',
    'success': function(res) {
      if(res.ErrCode !=0){
			  alert('获取RTSP URL失败，错误码：' + res.ErrCode + '\r\n' + '错误信息为：' + res.ErrMsg)
			  return
      } else {      
        $('#unvTextRTSPURL').html( 'RTSP URL:   '+ self.getObjChild(res.Result, "RtspURL") )
      }
      self.loadTextDom(url, type, syntaxHighlight(data), syntaxHighlight(res), 'unvTextThree')
    },
    'error': function(err) {
      console.log(err)
    }
  })
}
/**
 * 输入框校验
 * @param [Object]
 */
RTSP.prototype.checkParams = function(inPutParams) {
  var flag = true
  $.each(inPutParams, function(index, item) {
    if(item.check instanceof Array) {
      for(var i = 0; i < item.check.length; i++) {
        if(item.check[i].type == 'required') {
          if($('#'+ item.dom).val().trim() == '' ) {
            alert(item.check[i].text)
            return flag = false
          }
        }else if(item.check[i].type == 'regular') {
          if(!item.check[i].reg.test($('#'+ item.dom).val().trim())) {
            alert(item.check[i].text)
            return flag = false
          }
        }
      }
    }
  })
  return flag
}
/**
 * 加载表格数据
 */
RTSP.prototype.loadTableDom = function(dataSource, columns, domId){
  var self = this,
    html = '<table>'
  html += '<tr>'
  $.each(columns, function(index, item){
    html += '<th>' + item.title + '</th>'
  })
  html += '</tr>'
  $.each(dataSource, function(index1, item1){
    html += '<tr>'
    $.each(columns, function(index2, item2){
      html += '<td>' + self.getObjChild(item1, item2.dataIndex) + '</td>'
    })
    html += '</tr>'
  })
  html += '</table>'
  $('#' + domId).html(html)
}
/**
 * 对象深层次取值
 */
RTSP.prototype.getObjChild = function(data, str){
  if(!str){
    return data
  }
  var value = data
  $.each(str.split('.'), function(index, item){
    value = value[item]
  })
  return value
}
/**
 * 加载详细信息DOM
 */
RTSP.prototype.loadTextDom = loadTextDom

function loadTextDom(url, type, paramIn, paramOut, domId){
  if($('#' + domId).html()){
    $('#' + domId).html('')
  }
  var html = '<div class="unv-text">' +
	'<label><span>URL：</span><span>' + url + '</span></label>'+
	'<label><span>请求方式：</span><span>' + type + '</span></label>' +
	'</div>' +
	'<div class="unv-text">入参</div>' +
	'<pre class="unv-text">' + paramIn + '</pre>' +
	'<div class="unv-text">出参</div>' +
	'<pre class="unv-text">' + paramOut + '</pre>'
  $('#' + domId).html(html).show()
  $('#' + domId).html(html).hide()
}
$(document).ready(function(){
  var rtsp = new RTSP()
  rtsp.init()
})