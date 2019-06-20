<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	var ctx = "${ctx}";
	/* Right, first temporarily
	document.oncontextmenu = function (event){
		if(window.event){
			event = window.event;
		}try{
			var the = event.srcElement;
			if (!((the.tagName == "INPUT" && the.type.toLowerCase() == "text") || the.tagName == "TEXTAREA")){
				return false;
			}
			return true;
		}catch (e){
			return false; 
		} 
	} */
</script>