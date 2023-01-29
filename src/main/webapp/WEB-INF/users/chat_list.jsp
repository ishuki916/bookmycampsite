<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

          <c:forEach items="${mapmsg}" var="msg" varStatus="stauts">
<!-- 用AJAX血衣寫好了 -->

<%--           	<a href="${contextRoot}/admin/chat/${msg.key.id}">        --%>
            <div class="chat_list ${msg.key.id==toUser?'active_chat':'' }" onclick="change_user(${msg.key.id})">
              <div class="chat_people">
                <div class="chat_img"> <img src="${msg.key.image}" alt="sunil"> </div> 
                <div class="chat_ib">
                  <h5>${msg.key.username}</h5>
                  <p>
                  ${msg.value[0].text}
                  </p>
                  <span class="chat_date">${msg.value[0].createDate}</span>
                </div>
              </div>
            </div>
          </c:forEach>
            
         
         