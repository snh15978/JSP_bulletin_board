<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src ="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	
<style>
//colors
$grey: #cacaca;

// main
#page_container {
  margin-top: 15px;
  margin-bottom: 15px;
}

// search input
#accordion_search_bar_container {
  position: relative;
  &:after { 
    content: '\e003';
    font-family: Glyphicons Halflings;
    width: 18px;
    height: 18px;
    position: absolute;
    right: 10px;
    bottom: 10px; 
  }  
  #accordion_search_bar {
    display: block;
    margin: 10px auto;
    width: 100%;
    padding: 7px 10px;
    border: 1px solid $grey;
    border-radius: 25px;
    outline: 0;
  }
}

// make all the line clickable
.panel-title { 
  a {
    display: block;
  }
}
</style>

<title>Insert title here</title>
</head>
<body>
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
	  	<div id="accordion_search_bar_container">
      		<input type="search" 
        		 id="accordion_search_bar" 
         		placeholder="Search"/>
		</div>
		
			<div class="panel panel-default">
			  <div class="panel-heading" role="tab" id="heading90">
			    <h4 class="panel-title">
			      <a data-toggle="collapse" data-parent="#accordion" href="#collapse90" aria-expanded="true" aria-controls="collapse90">
			      	90 : 제목23 <br>2018-04-21
			    </a>
			  </h4>
			</div>
			<div id="collapse90" class="collapsepanel-collapse collapse" role="tabpanel" aria-labelledby="heading90">
			   <div class="panel-body">
				[ 원문 ]<br>
					입력내용2
				<br>
				<br>
				[ 오류단어 : 에러번호23 ]<br>
				오류단어2
				<br>
				<br>
				[ 대치어 ]<br>
				대치어2
				<br>
				<br>
				[ 사용자 의견 ]<br>
				의견1
				<br>
				<br>
				<a href='delete.do?number=90'>삭제</a>		
			    </div>
			  </div>
			</div>
			<div class="panel panel-default">
			  <div class="panel-heading" role="tab" id="heading10">
			    <h4 class="panel-title">
			      <a data-toggle="collapse" data-parent="#accordion" href="#collapse10" aria-expanded="true" aria-controls="collapse10">
			      	10 : adf <br>2018-04-12
			    </a>
			  </h4>
			</div>
			<div id="collapse10" class="collapsepanel-collapse collapse" role="tabpanel" aria-labelledby="heading10">
			   <div class="panel-body">
				[ 원문 ]<br>
					dfsf
				<br>
				<br>
				[ 오류단어 : sdfsdf ]<br>
				sdf
				<br>
				<br>
				[ 대치어 ]<br>
				sdf
				<br>
				<br>
				[ 사용자 의견 ]<br>
				sdfd
				<br>
				<br>
				<a href='delete.do?number=10'>삭제</a>		
			    </div>
			  </div>
			</div>
		
			<div class="panel panel-default">
			  <div class="panel-heading" role="tab" id="heading9">
			    <h4 class="panel-title">
			      <a data-toggle="collapse" data-parent="#accordion" href="#collapse9" aria-expanded="true" aria-controls="collapse9">
			      	9 : ad <br>2016-01-01
			    </a>
			  </h4>
			</div>
			<div id="collapse9" class="collapsepanel-collapse collapse" role="tabpanel" aria-labelledby="heading9">
			   <div class="panel-body">
				[ 원문 ]<br>
					asd
				<br>
				<br>
				[ 오류단어 : sda ]<br>
				d
				<br>
				<br>
				[ 대치어 ]<br>
				das
				<br>
				<br>
				[ 사용자 의견 ]<br>
				asd
				<br>
				<br>
				<a href='delete.do?number=9'>삭제</a>		
			    </div>
			  </div>
			</div>
		
			<div class="panel panel-default">
			  <div class="panel-heading" role="tab" id="heading8">
			    <h4 class="panel-title">
			      <a data-toggle="collapse" data-parent="#accordion" href="#collapse8" aria-expanded="true" aria-controls="collapse8">
			      	8 : asd <br>2016-04-16
			    </a>
			  </h4>
			</div>
			<div id="collapse8" class="collapsepanel-collapse collapse" role="tabpanel" aria-labelledby="heading8">
			   <div class="panel-body">
				[ 원문 ]<br>
					sda
				<br>
				<br>
				[ 오류단어 : as ]<br>
				ad
				<br>
				<br>
				[ 대치어 ]<br>
				asdas
				<br>
				<br>
				[ 사용자 의견 ]<br>
				adad
				<br>
				<br>
				<a href='delete.do?number=8'>삭제</a>		
			    </div>
			  </div>
			</div>
		
			<div class="panel panel-default">
			  <div class="panel-heading" role="tab" id="heading5">
			    <h4 class="panel-title">
			      <a data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="true" aria-controls="collapse5">
			      	5 : 오류 <br>2018-04-13
			    </a>
			  </h4>
			</div>
			<div id="collapse5" class="collapsepanel-collapse collapse" role="tabpanel" aria-labelledby="heading5">
			   <div class="panel-body">
				[ 원문 ]<br>
					오류
				<br>
				<br>
				[ 오류단어 : 123123 ]<br>
				오류
				<br>
				<br>
				[ 대치어 ]<br>
				오류
				<br>
				<br>
				[ 사용자 의견 ]<br>
				오류
				<br>
				<br>
				<a href='delete.do?number=5'>삭제</a>		
			    </div>
			  </div>
			</div>
		
	</div>	
</body>
<script type="text/javascript">
//$('.collapse').not(':first').collapse(); // Collapse all but the first row on the page.

//This section makes the search work.
(function() {
var searchTerm, panelContainerId;
$('#accordion_search_bar').on('change keyup', function() {
 searchTerm = $(this).val();
 $('#accordion > .panel').each(function() {
   panelContainerId = $(this).attr('id');
	alert(panelContainerId);
   // Makes search to be case insesitive 
   $.extend($.expr[':'], {
     'contains': function(elem, i, match, array) {
       return (elem.textContent || elem.innerText || '').toLowerCase()
         .indexOf((match[3] || "").toLowerCase()) >= 0;
     }
   });

   // END Makes search to be case insesitive

   // Show and Hide Triggers
   $(panelContainerId + ':not(:contains(' + searchTerm + '))').hide(); //Hide the rows that done contain the search query.
   $(panelContainerId + ':contains(' + searchTerm + ')').show(); //Show the rows that do!

 });
});
}());
//End Show and Hide Triggers

//END This section makes the search work.
</script>
</html>