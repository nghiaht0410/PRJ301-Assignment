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
    </head>
    <body>
        <c:if test="${requestScope.exams eq null}">
        <form action="view" method="POST"> 
            <input type="hidden" name="sid" value="${param.sid}"/>
            Choose A Course To Watch Your Grade:  <select name="cid">
                <c:forEach items="${requestScope.courses}" var="c">
                    <option value="${c.id}">${c.name}</option>
                </c:forEach>
            </select>
            <input type="submit" value="View"/>
        </form>
        </c:if>
        <c:if test="${requestScope.exams ne null}">
            <form action="grade" method="GET">
                ${requestScope.exams.size() == 0 ? 'Opp! There is no point yet! Wait... ' : ''}
                <c:forEach items="${requestScope.exams}" var="e">
                    ${e.assessment.name} - ${e.assessment.subject.name} - ${e.date} - ${e.duration} minutes <br/>
                    Score: ${e.score}<br/>
                </c:forEach>
                    <!--<input type="submit" value="take"/>-->
            </form>
        </c:if>
    </body>
</html>
