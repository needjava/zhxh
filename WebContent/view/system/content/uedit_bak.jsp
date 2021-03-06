<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/boot.js"></script>
	
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/tinymce4.2.3/upload/plugin.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/tinymce4.2.3/tinymce.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/tinymce4.2.3/jquery.tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/tinymce4.2.3/upload/plugin.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }    
    </style>
    
    <script type="text/javascript">
		//var result = '${result}';
		var pHeight = $(window.parent).height()-402;
		tinymce.init({
	        selector: "textarea",
	        plugins: [
	            "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
	            "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
	            "table contextmenu directionality emoticons template textcolor paste fullpage textcolor upload"
	        ],
	
	        toolbar1: "undo redo | cut copy paste | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
	        toolbar2: " searchreplace | bullist numlist | outdent indent blockquote | link unlink anchor image media code | inserttime preview | forecolor backcolor",
	        toolbar3: "table | hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft upload",
	
			//width: 600,
			height: pHeight,
			upload_action: '${pageContext.request.contextPath}/public/upload_content_pic.htmls',//required
			upload_file_name: 'file',//required
	        menubar: false,
	        toolbar_items_size: 'small',
	 		font_formats : '宋体=宋体;微软雅黑=微软雅黑;新宋体=新宋体;黑体=黑体;Courier New=courier new,courier,monospace;AkrutiKndPadmini=Akpdmi-n',
	        style_formats: [
	            {title: 'Bold text', inline: 'b'},
	            {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
	            {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
	            {title: 'Example 1', inline: 'span', classes: 'example1'},
	            {title: 'Example 2', inline: 'span', classes: 'example2'},
	            {title: 'Table styles'},
	            {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
	        ],
	
	        templates: [
	            {title: 'Test template 1', content: 'Test 1'},
	            {title: 'Test template 2', content: 'Test 2'}
	        ],
	        language:'zh_CN'
	    });
    </script>
</head>
<body>
	<div class="mini-splitter" style="width:100%;height:100%;">
	    <div id="preview" size="50%" showCollapseButton="true" style="padding:0px;">
	    	<div class="mini-toolbar" borderStyle="border-top:0;border-bottom:1;border-left:0;border-right:0;">
		        <table style="width:100%;">
		            <tbody>
		             <tr>
		                 <td style="width:100%;">
		                 	<span id="pid" style="padding-left:5px;">预览</span>
		                 </td>
		                 <td style="white-space:nowrap;">
		                 </td>
		             </tr>
		         </tbody>
		        </table>
		    </div>
		    <div class="mini-fit">
		    	${content.memo }
		    </div>
	    </div>
	    <div showCollapseButton="true">
	    	<div class="mini-toolbar" borderStyle="border:0;">
		        <table style="width:100%;">
		            <tbody>
		             <tr>
		                 <td style="width:100%;">
		                 	<span id="pid" style="padding-left:5px;">内容编辑</span>
		                 </td>
		                 <td style="white-space:nowrap;">
		                  	<!-- <a class="mini-button" iconCls="icon-add" plain="true" onclick="addRow()">新增</a>
		                	<a class="mini-button" iconCls="icon-remove" plain="true" onclick="delRow()">删除</a>
			                <span class="separator"></span> -->
			         		<a class="mini-button" iconCls="icon-save" plain="true" onclick="onOk()">保存</a>
		                 </td>
		             </tr>
		         </tbody>
		        </table>
		    </div>
		    <div class="mini-fit"><!-- border-bottom: 1;border-top: 0;border-left:0;broder-right:0" -->
		    	<form id="form1" method="post">
					<input type="hidden" id="id" name="id" value="${content.id }"/>
					<div>
					    <textarea id="memo" name="memo">${content.memo }</textarea>
					</div>
				</form>
		    </div>
	        
	    </div>        
	</div>
	
	<script type="text/javascript">
		$(function(){
			/* var pHeight = $(window.parent).height();
	   		var pWidth = $(window.parent).width();
	   		$('.mini-splitter').height(pHeight);
	   		$('.mini-splitter').width(pWidth); */
	   		
		});
	    //添加
	    function SaveData() {
			var content = {};
			var memo = tinymce.activeEditor.getContent();
			content.id = $('#id').val();
			content.memo = memo;
	        $.ajax({
	        	url: "${pageContext.request.contextPath}/public/memo.htmls",
	            data: content,
	            type: "post",
	            dataType:"text",
	            cache: false,
	            success: function (text) {
	            	if(text != "success"){
	            		mini.alert("保存失败！");
	            		return;
	            	}
	            	$('#preview').html(memo);
	            	//CloseWindow("save");
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	                CloseWindow();
	            }
	        });
	    }
	
	    /* function SetData(data) {
	    	id = data.id;
	    	alert(data.id);
        } */
	    
	    function CloseWindow(action) {            
	        if (action == "close" && form.isChanged()) {
	            if (confirm("数据被修改了，是否先保存？")) {
	                return false;
	            }
	        }
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();            
	    }
	    function onOk(e) {
	        SaveData();
	    }
	    function onCancel(e) {
	        CloseWindow("cancel");
	    }

	</script>
</body>
</html>