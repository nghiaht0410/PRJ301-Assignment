<%-- 
    Document   : lecturer
    Created on : Jun 17, 2024, 9:05:55 AM
    Author     : X1 Nano
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/view.css">
        <link rel="stylesheet" type="text/css" href="css/take.css">
    </head>
    <body>
        <c:if test="${requestScope.exams eq null}">
            <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
                <form action="lecturer" method="POST" style="background-color: #FFA500; padding: 20px; border-radius: 5px;"> 
                    <input type="hidden" name="lid" value="${param.lid}"/>
                    <label style="color: white; font-weight: bold;">Choose A Course: </label>
                    <select name="cid" style="margin: 10px 0; padding: 5px; border-radius: 3px;">
                        <c:forEach items="${requestScope.courses}" var="c">
                            <option value="${c.id}">${c.name}</option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="View" style="background-color: white; color: #FFA500; padding: 5px 10px; border: none; border-radius: 3px; cursor: pointer;"/>
                </form>
            </div>
        </c:if>

        <c:if test="${requestScope.exams ne null}">
            <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
                <form action="take" method="GET" style="background-color: #FFA500; padding: 20px; border-radius: 5px;">
                    <input type="hidden" name="lid" value="${param.lid}"/>
                    <input type="hidden" name="cid" value="${param.cid}"/>
                    <c:forEach items="${requestScope.exams}" var="e">
                        <input type="checkbox" name="eid" value="${e.id}"/> ${e.assessment.name} - ${e.assessment.subject.name} - ${e.date} - ${e.duration} minutes <br/>
                    </c:forEach>
                    <input type="submit" value="Take" style="background-color: white; color: #FFA500; padding: 5px 10px; border: none; border-radius: 3px; cursor: pointer;"/>
                </form>
            </div>
        </c:if>
    </body>
</html>
