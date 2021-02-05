<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
  <title>rajesh textile</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE-Edge">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Cache-Control" content="no-cache">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav role="navigation">
    <div class="navbar navbar-inverse">
      <a class="navbar-brand" href="/MyApplication/welcome">Rajesh Textiles</a>
	<div class="navbar-collapse collapse">
    <ul class="nav navbar-nav">
      <li><a href="/MyApplication/login">Login</a></li>
      <li><a href="/MyApplication/register">New Registration</a></li>
      <li><a href="/MyApplication/show-users">All Users</a></li>
    </ul>
	</div>
	</div>
	
	<c:choose>
	<c:when test="${mode=='MODE_HOME'}">
	
	
	<div class="container" id="homediv">
	<div class="jumbotron text-center">
	<h1>Welcome to Rajesh Textile</h1>
	<h3>Subscribe my channel</h3>
	</div>
	</div>
	
	</c:when>
	
	<c:when test="${mode=='MODE_REGISTER'}">
	<div class="container text-center">
	<h3>New Registration</h3>
	<hr>
	<form action="save-user" method="post" class="form-horizontal">
	<input type="hidden" name="id" value="${user.id}"/>
	
	<div class="form-group">
	<label class="control-label col-md-3">Username</label>
	<div class="col-md-7">
	<input type="text" class="form-control" name="username" value="${user.username}">
	</div>
	</div>
	
	<div class="form-group">
	<label class="control-label col-md-3">First Name</label>
	<div class="col-md-7">
	<input type="text" class="form-control" name="firstname" value="${user.firstname}">
	</div>
	</div>
	
	<div class="form-group">
	<label class="control-label col-md-3">Last Name</label>
	<div class="col-md-7">
	<input type="text" class="form-control" name="lastname" value="${user.lastname}">
	</div>
	</div>
	
	<div class="form-group">
	<label class="control-label col-md-3">Age</label>
	<div class="col-md-7">
	<input type="text" class="form-control" name="age" value="${user.age}">
	</div>
	</div>
	
	<div class="form-group">
	<label class="control-label col-md-3">Password</label>
	<div class="col-md-7">
	<input type="password" class="form-control" name="password" value="${user.password}"/>
	</div>
	</div>
	
	<div class="form-group">
	<input type="submit" class="btn btn-primary" value="Register"/>
	</div>
	
	
	</form>
	</div>
	
	</c:when>
	
	<c:when test="${mode=='ALL_USERS'}">
	<div class="container text-center" id="taskDiv">
	<h3>All Users</h3>
	<hr>
	<div class="table-responsive">
	<table class="table table-striped table-bordered">
	<thead>
	<tr>
	<th>Id</th>
	<th>UserName</th>
	<th>FirstName</th>
	<th>LastName</th>
	<th>Age</th>
	<th>Delete</th>
	<th>Edit</th>
	</tr>
	</thead>
	
	<tbody>
	<c:forEach var="user" items="${users}">
	<tr>
	<td>${user.id}</td>
	<td>${user.username}</td>
	<td>${user.firstname}</td>
	<td>${user.lastname}</td>
	<td>${user.age}</td>
	<td><a href="/MyApplication/delete_user?id=${user.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
	<td><a href="/MyApplication/edit-user?id=${user.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	</div>
	</div>
	</c:when>
	
	<c:when test="${mode=='MODE_UPDATE'}">
	<div class="container text-center">
	<h3>Update User</h3>
	<hr>
	<form action="save-user" method="post" class="form-horizontal">
	<input type="hidden" name="id" value="${user.id}"/>
	
	<div class="form-group">
	<label class="control-label col-md-3">Username</label>
	<div class="col-md-7">
	<input type="text" class="form-control" name="username" value="${user.username}">
	</div>
	</div>
	
	<div class="form-group">
	<label class="control-label col-md-3">First Name</label>
	<div class="col-md-7">
	<input type="text" class="form-control" name="firstname" value="${user.firstname}">
	</div>
	</div>
	
	<div class="form-group">
	<label class="control-label col-md-3">Last Name</label>
	<div class="col-md-7">
	<input type="text" class="form-control" name="lastname" value="${user.lastname}">
	</div>
	</div>
	
	<div class="form-group">
	<label class="control-label col-md-3">Age</label>
	<div class="col-md-7">
	<input type="text" class="form-control" name="age" value="${user.age}">
	</div>
	</div>
	
	<div class="form-group">
	<label class="control-label col-md-3">Password</label>
	<div class="col-md-7">
	<input type="password" class="form-control" name="password" value="${user.password}"/>
	</div>
	</div>
	
	<div class="form-group">
	<input type="submit" class="btn btn-primary" value="Update"/>
	</div>
	
	</form>
	</div>
	
	</c:when>
	
	<c:when test="${mode=='MODE_LOGIN'}">
	<div class="container text-center">
	<h3>User Login</h3>
	<hr>
	<form action="login-user" method="post" class="form-horizontal">
	<c:if test="${not empty error }">
	<div class="alert alert-danger">
	<c:out value="${error}"></c:out>
	</div>
	</c:if>
	<div class="form-group">
	<label class="control-label col-md-3">Username</label>
	<div class="col-md-7">
	<input type="text" class="form-control" name="username" value="${user.username}">
	</div>
	</div>
	
	<div class="form-group">
	<label class="control-label col-md-3">Password</label>
	<div class="col-md-7">
	<input type="password" class="form-control" name="password" value="${user.password}"/>
	</div>
	</div>
	
	<div class="form-group">
	<input type="submit" class="btn btn-primary" value="Login"/>
	</div>
	
	</form>
	</div>
	</c:when>
	
	</c:choose>
</nav>
</body>
</html>