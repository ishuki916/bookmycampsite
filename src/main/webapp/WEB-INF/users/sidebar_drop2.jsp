<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<c:forEach var="msg" items="${announcement}" end="4">
          <div class="dropdown-divider"></div>
            ${msg.text}
</c:forEach>
<div class="dropdown-divider"></div>
 <a href="${contextRoot}/admin/announcement" class="dropdown-item dropdown-footer">See All Messages</a>


