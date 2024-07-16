<%-- 
    Document   : lecturer
    Created on : Jun 17, 2024, 9:05:55 AM
    Author     : X1 Nano
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course and Exam Selection</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        .form-container, .exam-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            margin: 10px 0;
        }
        h1 {
            color: #ff6600; /* Main color */
        }
        select, input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #ff6600; /* Main color */
            color: #fff;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #e65c00;
        }
        .exam-info {
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
            text-align: left;
        }
        .no-exams {
            color: #ff6600; /* Main color */
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <c:if test="${requestScope.exams eq null}">
            <h1>Select a Course</h1>
            <form action="view" method="POST"> 
                <input type="hidden" name="sid" value="${param.sid}"/>
                Choose A Course To Watch Your Grade:
                <select name="cid">
                    <c:forEach items="${requestScope.courses}" var="c">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="View"/>
            </form>
        </c:if>
    </div>
    
    <div class="exam-container">
        <c:if test="${requestScope.exams ne null}">
            <h1>Exam Grades</h1>
            <form action="grade" method="GET">
                ${requestScope.exams.size() == 0 ? '<div class="no-exams">Opp! There is no point yet! Wait... </div>' : ''}
                <c:forEach items="${requestScope.exams}" var="e">
                    <div class="exam-info">
                        <strong>Assessment:</strong> ${e.assessment.name} <br/>
                        <strong>Subject:</strong> ${e.assessment.subject.name} <br/>
                        <strong>Date:</strong> ${e.date} <br/>
                        <strong>Duration:</strong> ${e.duration} minutes <br/>
                        <strong>Score:</strong> ${e.score} <br/>
                    </div>
                </c:forEach>
                <!--<input type="submit" value="Take"/>-->
            </form>
        </c:if>
    </div>
</body>
</html>

