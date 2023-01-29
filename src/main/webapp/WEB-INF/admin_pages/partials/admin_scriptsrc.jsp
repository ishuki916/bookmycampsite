<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!-- base:js -->
  <script src="${contextRoot}/spica/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="${contextRoot}/spica/js/off-canvas.js"></script>
  <script src="${contextRoot}/spica/js/hoverable-collapse.js"></script>
  <script src="${contextRoot}/spica/js/template.js"></script>
  <!-- endinject -->
  <!-- plugin js for this page -->
  <script src="${contextRoot}/spica/vendors/chart.js/Chart.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- Custom js for this page-->
  <script src="${contextRoot}/spica/js/chart.js"></script>
  <!-- End custom js for this page-->
 