<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,java.net.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='${path}/a00_com/packages/core/main.css' rel='stylesheet' />
<link href='${path}/a00_com/packages/daygrid/main.css' rel='stylesheet' />
<link href='${path}/a00_com/packages/timegrid/main.css' rel='stylesheet' />
<link href="${path}/a00_com/jquery-ui.css" rel="stylesheet" >




<style type="text/css">
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 100px auto 0 auto;
  }
  input[type=text],select,label,textarea{
     margin-bottom:12px;pardding:.4em;width:95%;
  }
</style>

<script src="${path}/a00_com/jquery.min.js"></script>
<script src='${path}/a00_com/packages/core/main.js'></script>
<script src='${path}/a00_com/packages/interaction/main.js'></script>
<script src='${path}/a00_com/packages/daygrid/main.js'></script>
<script src='${path}/a00_com/packages/timegrid/main.js'></script>
<script src="${path}/a00_com/jquery-ui.js"></script>



<script type="text/javascript">
   $(document).ready(function(){           
       var calendarEl = document.getElementById('calendar');
       
       var today = new Date();
       var date = today.getFullYear()+'-'+("0"+(today.getMonth()+1)).slice(-2)+'-'+today.getDate();
       var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
       
       
       var calendar = new FullCalendar.Calendar(calendarEl, {
         plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
         //defaultView: 'timeGridWeek',
         //nowIndicator: true,
         //now: date+'T'+time,
         eventLimit: true,
         events: 'https://fullcalendar.io/demo-events.json?overload-day', 
         header: {
           left: 'prev,next today',
           center: 'title',
           right: 'dayGridMonth,timeGridWeek,timeGridDay'
         },
         defaultDate: new Date().toISOString(),
         navLinks: true, // can click day/week names to navigate views
         selectable: true,
         selectMirror: true,
         select: function(arg) {
               $("#dialog #start").val(arg.start.toISOString());
               //같은 날짜명 null이 들어 오므로.. 시작 날짜로 설정처리..
               //모듈에 버그가 있는
             	 //시작 날짜 시간과 마지막 날짜 시간이 같은 경우 : 종일일정시..
             	 // ==> 시작 날짜와 마지막 날짜를 강제로 입력 처리하게 처리.. 
             	 // readonly 였다가 등록을 누르는 순간 뜨게 한다.
				$("#dialog #end").val(arg.end!=null?arg.end.toISOString(): arg.start.toISOString());
	    	 	$("#dialog").dialog("open");
          /*
           var title = prompt('Event Title:');
           if (title) {
             calendar.addEvent({
               title: title,
               start: arg.start,
               end: arg.end,
               allDay: arg.allDay
             })
           }
           */
           calendar.unselect()
         },
         eventClick:function(info,element){
        	 // info가 각각의 이벤트의 정보를 가져온다.
        	 //info라는 매개변수parameter에 의해서, 클릭하거나 여러가지 이벤트에 의해서
        	 // 호출할 각 일정 데이터의 정보를 가지고 온다.
        	 // 상세내용
        	 
        	 
            //alert(info.event.title);
            //내장된 속성
            //var event = info.event;
            //확장 속성
            //var exEvent = info.event.extendedProps;
            //alert(event.title+":"+exEvent.content);
            //alert(info.event.start+":"+info.event.end);
            //$("#dialog2").dialog("open");
            
            //드래그 날짜 변경, 시간 사이즈로 변경하는 함수 정의 
            
            //화면으로 보기에는 하나씩 넣어져있지만  
            //데이터베이스에서 가져온 내용을 모두 다 가지고 있는게 info이다
            
            detail(info);
         },
         droppable:true,
         eventDrop:function(info){
            detail(info);
         },
         eventDragStop:function(info){
            detail(info);
         },
         eventResize:function(info){
            detail(info);
         },
         editable: true,
         eventLimit: true, // allow "more" link when too many events
         events:function(info, successCallback, failureCallback){
             $.ajax({
                type:"post",
                url:"calendar.do?method=data5",
                dataType:"json",
                success:function(data){
                   //alert(data.list.length);
                   //alert(data.list.title);
                   var list = data.list;
                   var events = [];
                   for(var idx in list){
                      var event = list[idx];
                      events.push(event);
                   }
                   
                   successCallback(events)
                   //calendar.addEventSource(data.list);
					// 전체 데이터 내용들이 각각의 cell에 담겨있는 상황.
                }
             });            
            
         }
       });

       calendar.render();
//       $("h1").attr("align","center").click(function(){
//          alert("서버 데이터 호출!!");
/* 
# ajax로 서버의 자원 호출..
1. ajax는 화면 refresh 없이 이벤트로 서버에 있는 자원을 호출하는 것으로,
   form의 submit, location href를 통하여 화면 전체를 변경 시키는 것과
   구별된다.
2. 서버에 특정한 자원을 호출 하는 방법
   1) url(서버의 특정한 주소를 호출하는 방법)
   2) 요청값 전달(parameter 데이터)
3. 기본적인 ajax 호출 형식..
   1) $.ajax({속성:속성값,속성2:속성2값,,,,});
   2) 속성
      - type : get/post - 요청값을 전달하는 방식의 차이..
      - url : 서버의 자원이 있는 위치   ?요청key:요청value&....
      - data : 요청값에 대한 처리..   
         1) 요청key=요청value&요청key=요청value&..
         2) {요청key:요청value, 요청key:요청value,......}
         3) $("form").serialize() : form 하위에 있는 요소객체들을 
            name와 value을 기준으로 위에 나열될 query string으로 
            자동변환되어 전송한다.
      - dataType : 어떤 형식의 데이터를 서버에서 가져올것인가?
               text, html, json
      - success: function(revData){}
            서버에서 넘겨준 데이터를 revData로 받을 수 있다.
 */          
 //         var name=$("[name=name]").val();
 //         var age=$("[name=age]").val();
 //         var loc=$("[name=loc]").val();
 /*
          $.ajax({
             type:"post",
             url:"calendar.do?method=data3",
             dataType:"json",
             success:function(revData){
                //alert(revData.length);
                alert(revData[0].start+":"+revData[0].end);
                
                calendar.addEventSource(revData);

             }
          });
*/         
 //등록 창은 dialog box, 상세화면도 dialog box였지   
 
//       });
      $("#dialog").dialog({
         autoOpen:false, //
         buttons:{
            "등록":function(){
                 var title = $("#dialog #title").val();
                 var start = $("#dialog #start").val();
                 var end = $("#dialog #end").val();
                 var content = $("#dialog #content").val();
                 var color = $("#dialog #color").val();
                 var textColor = $("#dialog #textColor").val();              
                 var allDay = $("#dialog #allDay").val()=="true";
                 //alert(allDay);
                 if (title) {
                   calendar.addEvent({
                     title: title,
                     start: start,
                     end: end,
                     content:content,
                     color:color,
                     textColor:textColor,
                     allDay:allDay
                   })
                 }
                 //등록 후, DB 적용 전 화면 적용
                 //calendar.render();
                 //등록 처리
                 // ajax 는 $("#frm1").serialze(): 의 요소값을 받아, key = value로 설정하여 전송할 수 있게 처리.
                 
                 $.ajax({
                    type:"post",
                    url:"calendar.do?method=insert",
                    data:$("#frm1").serialize(),
                    success:function(data){
                       
                       alert("등록완료");
                    }
                    
                 });
                 
                 
                 
                 $("#dialog #title").val("");
                 $("#dialog #content").val("");
                 // 등록후  색상과  allDay 초기 화..
                 $("#dialog #color").val("#0099cc");
                 $("#dialog #textColor").val("#ccffff");                 
                 $("#dialog #allDay").val("true");                 
                 $("#dialog").dialog("close");
            }
         },
         modal:true
         
      });
      
      $("#dialog2").dialog({
         autoOpen:false,
         buttons:{
            "수정":function(){
            	// 1) 화면 ui에서 변경. ajax로만 처리하면 화면 깜빡거리거나 이상한데로 가는경우가 있다.
            	// 이래서 화면 ui 변경 처리가 필요
            	// 2) AJAX 를 통해서 실제 db변경 처리..
            	 var id = $("#dialog2 #id").val();
                 var title = $("#dialog2 #title").val();
                 var start = $("#dialog2 #start").val();
                 var end = $("#dialog2 #end").val();
                 var content = $("#dialog2 #content").val();
                 var color = $("#dialog2 #color").val();
                 var textColor = $("#dialog2 #textColor").val();
                 var allDay = $("#dialog2 #allDay").val()=="true";
                 
                 //화면 변경 처리
                 //수정버튼을 눌렀을때 지금 저장되어있는 id값.
                 
                 //화면 ui 변경. 위에 1)에서 설명. 
                 
                 //1.calendar.getEventById(id) : 해당 event 객체 가져오기
                 // id 값으로 calendar 객체에 있는 이벤트 중에서 지정된 이벤트를 객체로 
                 // 가져올 수 있다. 
                 // ARrayList 배열 중 하나의 객체 선택하여 가져온다.
                   
                 //alert("변경할 id:"+id);
               
                
                 var event = calendar.getEventById(id);
                 //변경할 속성값 저장
                 //이벤트객체.setProp("속성",속성값)
                 //이벤트객체.setExtendedProp("속성",속성값)
                 //   확장 속성(사용자 정의)
                 event.setProp("title",title);
                 event.setProp("backgroundColor",color);
                 event.setProp("textColor",textColor);
                 event.setExtendedProp("content",content);
                 // 날짜는 클리과 스크롤 드랍, 사이즈를 변경하는 순간
				 // 변경이 되기 때문에 입력값으로 가져올 필요가 없다.
				 event.setAllDay(allDay);
				 updateCall();
                 //event.setAllDay(allDay);
                  $("#dialog2").dialog("close");
                 
                 //문자열을 boolean 형식으로 변경
                 //등록 후, DB 적용 전 화면 적용
            },
			"삭제":function(){
		        var id = $("#dialog2 #id").val();
		        // 1. 화면uI처리
		        var event =calendar.getEventById( id );
		        //    이벤트객체.remove() : calendar 전체 이벤트
		        //   객체에서 해당 이벤트만 삭제처리..
		        //
		        
		        event.remove();
		        // 2. DB처리..
		        //calendar.render();
               
                 //updateCall refresh하면 없어지는데 이게 수정 프로세스
                 
		        $.ajax({
		        	type:"post",
		        	url:"calendar.do?method=delete",
		        	data:{id:id},
		        	success:function(data){
		        		alert("삭제완료");
		        	}
		        });  
		        $("#dialog2").dialog("close");
			}			
		},
		modal:true
	});		
});

   function detail(info){
       //내장된 속성 - 기본 속성
       // 1. info.event : 기본정보를 가져올 수 있다.
       
       var event = info.event;
       //확장 속성.  확장된 속성으로 데이터를 가지고 있다.
       // 2. info.event.extendedProps. 일정에 등록된 인원을 표시하고싶다, 어떤 업무가 완료되거나 진행/추가되어있는 사항이다. 일정상세로 출력해주면 된다.
       // vo 객체, mapping 시켜놓고 (database 넣은후) Calendar.vo에 넣어서 추가 할 수 있다.
       var exEvent = info.event.extendedProps;
       // event. 속성, exEvent.속성
       // 실제 vo가 json으로 변경해서 현재 full calendar 모듈에서 json 데이터로 저장되어 있다.
       // json으로 가져와서 화면에 출력. 
       // event.id는 데이터베이스에서 처리할 때 필요한 key이기에 
       // 주로 명시적으로 보이는 것보다, input type= hidden으로 처리하여, 삭제, 수정시 활용을 한다.
       
       

       $("#dialog2 #id").val(event.id);
       $("#dialog2 #title").val(event.title);
       $("#dialog2 #start").val(event.start.toISOString());
       // 같은 날짜시간은 null이 들어오므로 시작 날짜로 설정처리.
       $("#dialog2 #end").val(event.end.toISOString());
       $("#dialog2 #content").val(exEvent.content);
       $("#dialog2 #color").val(event.backgroundColor);
       $("#dialog2 #textColor").val(event.textColor);
       // ""+boolean ==> 문자열형 데이터로 처리 true ==> "true"
       $("#dialog2 #allDay").val(""+event.allDay);
       
       //상세화면을 로딩.
       $("#dialog2").dialog("open");
   }
   function updateCall(){
	    $.ajax({
	    	type:"post",
	    	url:"calendar.do?method=update",
	    	data:$("#frm2").serialize(),
	    	success:function(data){
	    		//if(data=="")
	    		alert("수정완료");
	    	}
	    });	
	}
   
   
   
</script>
</head>
<body>
   <!-- <h1>ajax 연동 연습!!</h1> -->
   <!-- 
   <input name="name"/>
   <input name="age"/>
   <input ="loc"/>  종일여부: boolean -->
    <div id="wrapper">
		<!-- header -->
 			<jsp:include page="a04_headerGantt.jsp" />
			<jsp:include page="a04_sidebarGantt.jsp" />  
	
		<div class="contain">
				
	 		<div id='calendar'>


			  	<div id="dialog" title="일정등록">
			  	  	<form id="frm1">
				  		<label>일정이름</label>
				  		<input id="title" name="title" type="text"/>
				  		<label>내용</label>
				  		<textarea rows="5" cols="20"  id="content"  name="content" ></textarea>
				  		<label>종일여부</label>
				  		<select id="allDay" name="allDay">
				  			<option value="true"> 종 일 </option>
				  			<option value="false"> 시간 </option>
				  		</select>
				  		<label>시작날짜</label>
				  		<input id="start" name="start" type="text" readonly />
				  		<label>마지막날짜</label>
				  		<input id="end" name="end" type="text" readonly/>
				  		<label>배경색상</label>
				  		<input id="color"  name="color"  type="color" value="#0099cc"/>
				  		<label>글자색상</label>
				  		<input id="textColor"  name="textColor"  type="color" value="#ccffff"/>
			  		</form>
			  	</div>
			  	<div id="dialog2" title="일정상세">
			  	  	<form id="frm2">
			  	  		<input id="id" name="id" type="hidden" />
				  		<label>일정이름</label>
				  		<input id="title" name="title" type="text"/>
				  		<label>내용</label>
				  		<textarea rows="5" cols="20" id="content" name="content" ></textarea>
				  		<label>종일여부</label>
				  		<select id="allDay" name="allDay">
				  			<option value="true"> 종 일 </option>
				  			<option value="false"> 시간 </option>
				  		</select>
				  		<label>시작날짜</label>
				  		<input id="start" name="start" type="text" readonly/>
				  		<label>마지막날짜</label>
				  		<input id="end" name="end" type="text" readonly/>
				  		<label>배경색상</label>
				  		<input id="color"  name="color"  type="color" value="#0099cc"/>
				  		<label>글자색상</label>
				  		<input id="textColor"  name="textColor"  type="color" value="#ccffff"/>
			  		</form>
			  	</div>
			  	
			  </div>
	  	</div>
	</div>
</body>
</html>