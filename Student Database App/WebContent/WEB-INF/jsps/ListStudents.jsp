<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/images/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css"> -->
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css"> -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/dataTables.foundation.min.css">
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/tabletools/2.2.4/css/dataTables.tableTools.css" />

<style>
	td.details-control {
    	background: url('../images/Add.png') no-repeat center center;
    	cursor: pointer;
	}
	tr.shown td.details-control {
    	background: url('../images/minus16.png') no-repeat center center;
	}
	.showHideColumn{
		cursor: pointer;
		color: blue;
	}
</style>
</head>
<body style="margin-right: 10px;margin-left: 10px;" onload="noBack();" onpageshow="if (event.persisted) noBack();">
	<div id="wrapper">
		<div id="header">
			<h2>Employee Database App</h2>
		</div>
	</div>
	<div id = "msgBlock">	
		<c:if test="${not empty successMessage}">
			<div class="alert alert-success alert-dismissable">
			<a class="close" data-dismiss="alert" aria-label="close" title = "success" onclick="close();">×</a>
				<strong>${successMessage}</strong>
			</div>
		</c:if>
		<c:if test="${not empty updateMessage}">
			<div class="alert alert-info alert-dismissable">
			<a class="close" data-dismiss="alert" aria-label="close" title = "update" onclick="close();">×</a>
				<strong>${updateMessage}</strong>
			</div>
		</c:if>
		<c:if test="${not empty deleteMessage}">
			<div class="alert alert-danger alert-dismissable">
			<a class="close" data-dismiss="alert" aria-label="close" title="delete" onclick="close();">×</a>
				<strong>${deleteMessage}</strong>
			</div>
		</c:if>
		</div>
	<p align = "right">
	<button class="btn btn-default btn-sm"
				onclick="window.location.href='logout.html'; return false;"><span class="glyphicon glyphicon-off"></span> Logout</button></p>
	<div>
		<s:form action="searchProcess.html" modelAttribute="student" class="form-inline">
			<div class="form-group">
				<label for="filter">Filter By:</label>
				<s:select path = "search" id="country" title = "filter" class="form-control" onchange="$(this).ajaxCallForCity();">
					<s:option value="0">Select</s:option>
					<s:option value="Gender">Gender</s:option>
					<s:option value="Hobbies">Hobbies</s:option>
					<s:option value="State">State</s:option>
				</s:select>
			</div>
<c:choose>
	<c:when test="${changed==true}">
   		<div class="form-group">
   			<s:select path="secSearch" name = "city" class="form-control" id="citydropdown">
   			<option value="">Select</option>
     		<c:if test="${not empty setComboValues}">
     			<c:forEach items="${setComboValues}" var="sp">
     				<s:option value="${sp.key}">${sp.value}</s:option>
     			</c:forEach>
     		</c:if>
     		</s:select>
  		</div>
	</c:when>
<c:otherwise>
	<div class="form-group">
	    <s:select path="secSearch" name = "city" class="form-control" id="citydropdown">
			<option value="">Select</option>  
			<c:if test="${not empty setComboValues}">
				<c:forEach items="${setComboValues}" var="sp">
			    	<s:option value="${sp.key}">${sp.value}</s:option>
			    </c:forEach>
			</c:if>  
		</s:select>
	</div>
</c:otherwise>
</c:choose>			
    		<button type = "submit" value = "Go" class="btn btn-default btn-sm">Go <span class="glyphicon glyphicon-search"></span> </button>
		</s:form>
	</div><br />
		
		<c:set var="count" value="0" scope="page" />
		<display:table export="true" name="theStudents" id="tableData" requestURI="/student/list" pagesize="5" class="table table-hover table-striped example">
			
			<display:column title="Id" sortable="true" media = "html">	
				<a href="javascript:$(this).ajaxfindById(${theStudents[count].id});">${theStudents[count].id}</a>
			</display:column>
			<display:column property="userName" title="Username" sortable="true" />
	        <display:column property="firstName" title="First Name" sortable="true" />
	        <display:column property="lastName" title="Last Name" sortable="true" />
	        <display:column property="email" title="Email" sortable="true" />
	        <display:column property="dateOfBirth" title="Date Of Birth" sortable="true" />	        
	        <display:column property="gender" title="Gender" sortable="true"  />	        
	        <display:column property="hobbies" title="Hobbies" sortable="true"  />	        
	        <display:column property="state" title="State" sortable="true"  />	
	        <display:column property="city" title="City" sortable="true"  />
	        <display:column property="deptValue" title="Department" sortable="true"  />
	        <display:column property="skills" title="Skills" sortable="true"  />	
	        
	        <display:setProperty name="export.pdf.students" value="theStudents.pdf"/>
	        <display:setProperty name="export.excel.students" value="theStudents.xls" />
	        <display:setProperty name="export.rtf.students" value="theStudents.rtf" />
	        <display:setProperty name="export.csv.students" value="theStudents.csv" />
	        <display:setProperty name="export.xml.students" value="theStudents.xml" />
	        <display:column title="Actions" media="html">
		        <c:url var = "updateLink" value = "/student/displayUpdateForm">
					<c:param name = "studentId" value="${theStudents[count].id}"/>
				</c:url>
				<c:url var = "deleteLink" value = "/student/displayDeleteForm">
					<c:param name = "studentId" value = "${theStudents[count].id}" />
				</c:url>
	        	<a href = "${updateLink}"><span class="glyphicon glyphicon-pencil"></span></a>
	        	|
	       	 	<a href = "${deleteLink}" 
				onclick = "if(!(confirm('Are you sure want to delete this customer?'))) return false"><span class="glyphicon glyphicon-remove"></span></a>
	        </display:column>
	    	<c:set var="count" value="${count + 1}" scope="page"/>
	    	
	    </display:table>
	    
	   	<button class="btn btn-default btn-sm"
				onclick="window.location.href='displayAddForm.html'; return false;"><span class="glyphicon glyphicon-user"></span> Add Employee</button>
		<br />
		<div id = "dialog-2" title = "Dialog Title goes here...">
        </div>
		<br />
		<div>
		<b>Show / Hide Columns: </b>
		<a class = "showHideColumn" data-columnindex = "1">Id</a> - 
		<a class = "showHideColumn" data-columnindex = "2">Username</a> - 
		<a class = "showHideColumn" data-columnindex = "3">FirstName</a> - 
		<a class = "showHideColumn" data-columnindex = "4">Email</a> - 
		<a class = "showHideColumn" data-columnindex = "5">Date of Birth</a> - 
		<a class = "showHideColumn" data-columnindex = "6">Gender</a> - 
		<a class = "showHideColumn" data-columnindex = "7">State</a> - 
		<a class = "showHideColumn" data-columnindex = "8">City</a>
		</div>
		<table id="example" class="table table-striped" width="100%">
			<thead>
				<tr>
					<th></th>
					<th class = "foot">Id</th>
					<th class = "foot">Username</th>
					<th class = "foot">First Name</th>
					<th class = "foot">Email</th>
					<th class = "foot">Date of birth</th>
					<th class = "foot">Gender</th>
					<th class = "foot">State</th>
					<th class = "foot">City</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th></th>
					<th class = "foot">Id</th>
					<th class = "foot">Username</th>
					<th class = "foot">First Name</th>
					<th class = "foot">Email</th>
					<th class = "foot">Date of birth</th>
					<th class = "foot">Gender</th>
					<th class = "foot">State</th>
					<th class = "foot">City</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</tfoot>
		</table>
<script type = "text/javascript" 
		src = "${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type = "text/javascript"
		src = "${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
function format(d){
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td><b>Full Name</b></td><td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>'+
            '<td>'+d.firstName+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td><b>Last Name</b></td><td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>'+
            '<td>'+d.lastName+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td><b>Hobbies</b></td><td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>'+
            '<td>'+d.hobbies+'</td>'+
        '</tr>'+
    '</table>';
}

$('document').ready(function(){
	if($('#citydropdown').val() != 0){
		$('#citydropdown').show();
		$('button[value = "Go"]').show();
	}else{
		$('#citydropdown').hide();
		$('button[value = "Go"]').hide();
	}
	$('#country').on('change', function(){
		$('#citydropdown').show();
		$('button[value = "Go"]').show();
	});
	$.fn.ajaxCallForCity=function()
	{ 	
		$.ajax({
	      	 type : "POST",
	      	 url : "getSearchDropDown.html",
	      	 data : ({
	      	 	"tableField" : $(this).val(),
	      	 }),
	      	 dataType : "json",
	      	 success : function(response) {
	      	 if(response!=null){
	      		$("#citydropdown").html("<option  value=''>Select</option>");
			 	$.each(response, function(key, element) {
					$("#citydropdown").append("<option  value="+key+">"+element+"</option>");
			 	});
	   	 	} 
	   	},
	 });
	};
	 $("#dialog-2").dialog({
        autoOpen: false, 
        buttons: {
           OK: function() {$(this).dialog("close");}
        },
        title: "Student Information",
        position: {
           my: "center",
           at: "center"
        }
     });
	 
	 $.fn.ajaxfindById=function(a){
		 $.ajax({
	      	 type : "POST",
	      	 url : "findById.html",
	      	 data : ({
	      	 	"studentId" : a,
	      	 }),
	      	 dataType : "json",
	      	 success : function(data, response) {
	      		//$.fn.myFunction(data, response);
	      		$("#dialog-2").html(
	    				"<table class='table'><tr><th>Username<td>:</td></th><td>&nbsp;"+data.userName+"</td></tr>"+
	    					"<tr><th>First Name<td>:</td></th><td>&nbsp;"+data.firstName+"</td></tr>"+
	    					"<tr><th>Last Name<td>:</td></th><td>&nbsp;"+data.lastName+"</td></tr>"+
	    					"<tr><th>Email<td>:</td></th><td>&nbsp;"+data.email+"</td></tr>"+
	    					"<tr><th>Date Of Birth<td>:</td></th><td>&nbsp;"+data.dateOfBirth+"</td></tr>"+
	    					"<tr><th>Gender<td>:</td></th><td>&nbsp;"+data.gender+"</td></tr>"+
	    					"<tr><th>Hobbies<td>:</td></th><td>&nbsp;"+data.hobbies+"</td></tr>"+
	    					"<tr><th>State<td>:</td></th><td>&nbsp;"+data.state+"</td></tr>"+
	    					"<tr><th>City<td>:</td></th><td>&nbsp;"+data.city+"</td></tr>"+
	    					"<tr><th>Skills<td>:</td></th><td>&nbsp;"+data.skills+"</td></tr>"+
	    					"</table>"
	    			);
	    		$("#dialog-2").dialog("open");
	   		},
	 	});
	};
	var data = eval('${employeeList}');
	var table = $('#example').DataTable({
	
	//this is for API search
	"initComplete": function () {
    	var api = this.api();
        api.$('td').click( function () {
        	api.search( this.innerHTML ).draw();
           });
       },	
		
	//'sort' : false, 				//to turn off the sorting
    //'paging': false,				//to turn off the pagination
    //'searching' : false,			//to remove the search option
    //'scrollY' : 200,				//to fix the fixed height or to add the scroll bar
	data : data,
	columns: [
	{
    	"className":      'details-control',
    	"orderable":      false,
    	"data":           null,
    	"defaultContent": ''
	},
	{ 'data' : "id"},
	{ 'data' : "userName"},
	{ 'data' : "firstName"},
	{ 'data' : "email"},
	{ 'data' : "dateOfBirth"},
	{ 'data' : "gender"},
	{ 'data' : "state"},
	{ 'data' : "city"},
	{
		'render':function (data, type, row) {
            return '<a href=/Student_Database_App/student/displayUpdateForm?studentId=' + row.id + '><span class="glyphicon glyphicon-pencil"></span></a>'
        },
		'sortable' : false				//to turn off the particular column sorting
    },
	{
        'render':function (data, type, row) {
            return '<a title="ddd" href=/Student_Database_App/student/displayDeleteForm?studentId=' + row.id + '><span class="glyphicon glyphicon-remove"></span></a>'
        },
        'sortable' : false				//to turn off the particular column sorting
    }
	],
	});
	
	
	var tableTools = new $.fn.dataTable.TableTools(table, {
		'sSwfPath' : '//cdn.datatables.net/tabletools/2.2.4/swf/copy_csv_xls_pdf.swf',
	});
	$(tableTools.fnContainer()).insertBefore('#example_wrapper');
	
	$('.showHideColumn').on('click', function(){
		var tableColumn = table.column($(this).attr('data-columnindex'));
		tableColumn.visible(!tableColumn.visible());
	});
	
	$('#example thead th.foot').each(function(){
		var title = $('#example tfoot th').eq($(this).index()).text();
		$(this).html('<input type = "text" placeholder = "Search '+title+'" />');
	});
	
	table.columns().every(function(){
		var datatableColumn = this;
		
		var searchTextBoxes = $(this.header()).find('input');
		
		
		searchTextBoxes.on('keyup change', function(){
			datatableColumn.search(this.value).draw();
		});
		
		searchTextBoxes.on('click', function(e){
			e.stopPropagation();
		});
	});
	
	
	
	
	$('#example tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row(tr);
        if(row.child.isShown()) {
            row.child.hide();
            tr.removeClass('shown');
        }
        else{
            row.child(format(row.data())).show();
            tr.addClass('shown');
        }
    });
	
	$('a[title="ddd"]').on('click', function(){
		if(!(confirm('Are you sure want to delete this customer?'))) return false;
	});
});
</script>
<script type = "text/javascript"
		src = "${pageContext.request.contextPath}/js/ListStudents.js"></script>
<script type = "text/javascript" 
		src = "${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<%-- <script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script> --%>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.foundation.min.js"></script>
<script src="//cdn.datatables.net/tabletools/2.2.4/js/dataTables.tableTools.min.js"></script>
</body>
</html>