<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="templates/admin_header.jsp"></jsp:include>

 <div class="row">
        <div class="col-md-12">
            <h1>Add user</h1>
            <!-- when 'edit' mode : -->
            <!--<h2>Edit user</h2> -->
            <form:form class="form-add-user row" commandName="userAccount" name="addUserForm" id="user_add" method="POST">
             	<c:choose>
					<c:when
						test="${not empty userAccount.id}">
					</c:when>
				</c:choose>
             	<c:if test="${not empty error}">
             		<div class="error-title">Following errors occurred:</div>
					<div class="error">${error}</div>
				</c:if>
				<c:if test="${not empty message}">
					<div class="error">${message}</div>
				</c:if>
					
                <div class="col-md-4">
                    <label> Name*: </label>
                   		<form:input path="username" type="text" id="name" name="name" class="form-control" placeholder="Name" />
                   	<form:hidden path="id"/>
					<form:hidden path="enabled" />
                    <form:errors class="error" path="username" />
                    <label> Surname*: </label>
                    	<form:input path="surname" type="text" id="surname" name="surname" class="form-control" placeholder="Surname" />
                    	<form:errors class="error" path="surname" />
                    <label> Phone Number*: </label>
                    	<form:input path="phoneNumber" type="text" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="Phone" />
                    <form:errors class="error" path="phoneNumber" />
                    <br>
                    <button class="btn btn-primary btn-block" type="submit">Save</button>
                </div>
                <div class="col-md-4">
                    <label> Email*: </label>
                    	<form:input path="email" type="email" field="email" name="email" id="email" class="form-control" placeholder="Email" />
                    	<form:errors class="error" path="email" />
                    <label> Position*: </label>
                        <form:select path="role" class="form-control" name="role" id="role">
                        	<form:option value="" label="- Select -"/>
                        	<form:options items="${role}" />
                        </form:select>
                        <form:errors class="error" path="role" />
                </div>
                <div class="col-md-4">
                    <label> Start date*: </label>
                        <form:input path="date" type="text" name="start-date" class="form-control" id="datepicker" />
                    <form:errors class="error" path="date" />
                    </br>
                    <form:input path="password" type="password" id="password" class="form-control" placeholder="Password" />
                    <form:errors class="error" path="password" />
                    
                    <form:input path="confirmPassword" type="password" id="confirmPassword" class="form-control" placeholder="Repeat password" />
                    <form:errors class="error" path="confirmPassword" />
	                    
                    <!--  <a class="btn btn-info" data-toggle="modal" data-target="#pass">Change password</a> -->
                </div>
            </form:form><!-- /form -->
        </div>
    </div>
 <jsp:include page="templates/footer.jsp"></jsp:include>