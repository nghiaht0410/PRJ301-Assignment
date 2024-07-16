<%-- 
    Document   : take
    Created on : Jun 24, 2024, 8:26:46 AM
    Author     : sonnt-local
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: #f0f0f0; font-family: Arial, sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0;">
        <div class="form-container" style="background-color: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); width: 80%; max-width: 1000px; text-align: left;">
            <h2 style="margin-bottom: 20px; font-size: 24px; color: #333;">Enter Grades</h2>
            <form action="take" method="POST">
                <table style="border: 2px solid orange; width: 100%; border-collapse: collapse;">
                    <thead>
                        <tr style="background-color: orange; color: white;">
                            <th></th>
                                <c:forEach items="${requestScope.exams}" var="e">
                                <th>
                                    ${e.assessment.name} <br>
                                    ${e.date} - ${e.assessment.weight}
                                </th>
                            </c:forEach>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.students}" var="s">
                            <tr>
                                <td>${s.name}</td>
                                <c:forEach items="${requestScope.exams}" var="e">
                                    <td style="padding: 10px; text-align: center;">
                                        <input type="hidden" name="gradeid" value="${s.id}_${e.id}" />
                                        <input type="text" name="grade${s.id}_${e.id}" style="width: 60px; padding: 5px; border: 1px solid #ccc; border-radius: 4px; text-align: center;"
                                               <c:forEach items="${requestScope.grades}" var="g">
                                                   <c:if test="${g.exam.id eq e.id and g.student.id eq s.id}">
                                                       value="${g.score}"
                                                   </c:if>
                                               </c:forEach>
                                               />
                                    </td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <input type="hidden" name="cid" value="${param.cid}"/>
                <input type="submit" value="Save" style="
                background-color: orange;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                margin-top: 10px;
                display: block;
                margin: 0 auto;
                       "/>
            </form>
        </div>
    </body>
</html>
