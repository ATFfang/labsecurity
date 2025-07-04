var base64EncodeChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";  
var base64DecodeChars = new Array(  
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63,  
    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1,  
    -1,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,  
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1,  
    -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,  
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1);  
/**
 * base64编码
 * @param {String} str 需要编码的字符串
 */
function base64encode(str) {  
    var out, i, len;  
    var c1, c2, c3;  
  
    len = str.length;  
    i = 0;  
    out = "";  
    while(i < len) {  
    c1 = str.charCodeAt(i++) & 0xff;  
    if(i == len)  
    {  
        out += base64EncodeChars.charAt(c1 >> 2);  
        out += base64EncodeChars.charAt((c1 & 0x3) << 4);  
        out += "==";  
        break;  
    }  
    c2 = str.charCodeAt(i++);  
    if(i == len)  
    {  
        out += base64EncodeChars.charAt(c1 >> 2);  
        out += base64EncodeChars.charAt(((c1 & 0x3)<< 4) | ((c2 & 0xF0) >> 4));  
        out += base64EncodeChars.charAt((c2 & 0xF) << 2);  
        out += "=";  
        break;  
    }  
    c3 = str.charCodeAt(i++);  
    out += base64EncodeChars.charAt(c1 >> 2);  
    out += base64EncodeChars.charAt(((c1 & 0x3)<< 4) | ((c2 & 0xF0) >> 4));  
    out += base64EncodeChars.charAt(((c2 & 0xF) << 2) | ((c3 & 0xC0) >>6));  
    out += base64EncodeChars.charAt(c3 & 0x3F);  
    }  
    return out;  
}
/**
 * 文本化json
 * @param {Object} json 接口出入参
 */
function syntaxHighlight(json) {
    if (typeof json != 'string') {
        json = JSON.stringify(json, undefined, 2);
    }
    json = json.replace(/&/g, '&').replace(/</g, '<').replace(/>/g, '>');
    return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function (match) {
        var cls = 'number';
        if (/^"/.test(match)) {
            if (/:$/.test(match)) {
                cls = 'key';
            } else {
                cls = 'string';
            }
        } else if (/true|false/.test(match)) {
            cls = 'boolean';
        } else if (/null/.test(match)) {
            cls = 'null';
        }
        return '<span class="' + cls + '">' + match + '</span>';
    });
}

/**
 * ajax get请求转为url
 * @param {String} url 请求的url
 * @param {Object} data 对象
 * 
 */
function addURLParam(url,data){
    for(var name in data){                   
        url += ( url.indexOf("?") == -1 ? "?" : "&" );
        //console.log(Object.prototype.toString.call(data[name]))
        if(Object.prototype.toString.call(data[name]) === '[object Object]'){
            url += encodeURI(name) + "=" + encodeURI(JSON.stringify(data[name]))
        }
        else{
            url += encodeURI(name) + "=" + encodeURI(data[name])
        }
    //     console.log(p);//   取得是key值
    //  console.log(obj[p]);//取得是value值
}
    return url;
}
/**
 * 获取图片base64位编码
 */
function getPictureBase64(imgFile,getBase64data,ele){
    var PictureBase64=''
    var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
    if(!pattern.test(imgFile.value)) { 
      alert("请上传jpg/jpeg/png/gif/bmp格式的照片！");  
      imgFile.focus(); 
    }else{
       //添加显示图片的HTML元素
        var childrens=$(ele).children()
        if(childrens.length===0){
             $(ele).append("<div class='img-item'><div id='img1'><img src='' width='200' height='200'/></div><span class='delete-hook' onclick='deleteImg(this)'>删除</span></div>");
        }
       
       //判断浏览器类型
       if(document.all){ 
          //兼容IE
          var realPath, xmlHttp, xml_dom, tmpNode, imgBase64Data;
          realPath = imgFile.value;//获取文件的真实本地路径.
          xmlHttp = new ActiveXObject("MSXML2.XMLHTTP");
          xmlHttp.open("POST",realPath, false);
          xmlHttp.send("");
          xml_dom = new ActiveXObject("MSXML2.DOMDocument");
          tmpNode = xml_dom.createElement("tmpNode");
          tmpNode.dataType = "bin.base64";
          tmpNode.nodeTypedValue = xmlHttp.responseBody;
          PictureBase64=tmpNode.text.replace(/\n/g,"");
          if(PictureBase64!==''){
            getBase64data(PictureBase64)
        }
          imgBase64Data = "data:image/bmp;base64," + tmpNode.text.replace(/\n/g,"");
          document.getElementById('img1').innerHTML="<img src='"+imgBase64Data+"' width='200' height='200'/>"; //渲染图片
       }else{
          //兼容主流浏览器 
          var fileReader, imgData;
        	fileReader = new FileReader();  
            fileReader.readAsDataURL(imgFile.files[0]);
            // (fileReader.onload = function () {  
            //     PictureBase64 = this.result; //base64数据
            //     // ele.innerHTML = "<img src='"+imgData+"' width='"+width+"' height='"+height+"'/>"; //渲染图片
            // })()
            fileReader.onload = function () {  
                PictureBase64 = this.result; //base64数据
                document.getElementById('img1').innerHTML = "<img src='"+PictureBase64+"' width='200' height='200'/>"; //渲染图片
                if(PictureBase64!==''){
            
                    switch (imgFile.files[0].type.indexOf('jpeg')) {
                        case 6:
                            getBase64data(PictureBase64.slice(23));
                
                            break;
                    
                        default:
                            getBase64data(PictureBase64.slice(22));
                            break;
                    }
                    
                }
            }
            
       }
       //重置表单(允许用户可以连续添加相同图片)
    } 
}