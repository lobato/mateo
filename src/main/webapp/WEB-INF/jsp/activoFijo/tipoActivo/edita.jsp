<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <title><s:message code="tipoActivo.nuevo.label" /></title>
        <link rel="stylesheet" href="<c:url value='/css/chosen.css' />" type="text/css">
    </head>
    <body>
        <jsp:include page="../menu.jsp" >
            <jsp:param name="menu" value="tipoActivo" />
        </jsp:include>

        <div id="nuevo-tipoActivo" class="content scaffold-list" role="main">
            <h1><s:message code="tipoActivo.nuevo.label" /></h1>
            <p class="well">
                <a class="btn btn-primary" href="<s:url value='/activoFijo/tipoActivo'/>"><i class="icon-list icon-white"></i> <s:message code='tipoActivo.lista.label' /></a>
            </p>
            <c:url var="actualizaUrl" value="/activoFijo/tipoActivo/actualiza" />
            <form:form commandName="tipoActivo" action="${actualizaUrl}" method="post">
                <form:hidden path="id" />
                <form:hidden path="version" />
                <form:errors path="*">
                    <div class="alert alert-block alert-error fade in" role="status">
                        <a class="close" data-dismiss="alert">×</a>
                        <c:forEach items="${messages}" var="message">
                            <p>${message}</p>
                        </c:forEach>
                    </div>
                </form:errors>

                <fieldset>
                    <s:bind path="tipoActivo.nombre">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="nombre">
                                <s:message code="nombre.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:input path="nombre" maxlength="128" required="true" cssClass="span3" />
                            <form:errors path="nombre" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    <s:bind path="tipoActivo.descripcion">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="descripcion">
                                <s:message code="descripcion.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:textarea path="descripcion" maxlength="128" required="true" cssClass="span3" />
                            <form:errors path="descripcion" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    <s:bind path="tipoActivo.porciento">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="porciento">
                                <s:message code="porciento.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:input path="porciento" maxlength="128" required="true" cssClass="span3" cssStyle="text-align:right;" type="number" step="0.01" min="0" max="10" />
                            <form:errors path="porciento" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    <s:bind path="tipoActivo.vidaUtil">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="vidaUtil">
                                <s:message code="vidaUtil.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:input path="vidaUtil" maxlength="128" required="true" cssClass="span3" />
                            <form:errors path="vidaUtil" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    <s:bind path="tipoActivo.cuenta">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="cuentaId">
                                <s:message code="cuenta.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:select path="cuenta.id" id="cuentaId" required="true" cssClass="span3" >
                                <form:options items="${cuentas}" itemValue="id" itemLabel="nombreCompleto" />
                            </form:select>
                            <form:errors path="cuenta" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                </fieldset>

                <p class="well" style="margin-top: 10px;">
                    <button type="submit" name="actualizarBtn" class="btn btn-primary btn-large" id="actualizar" ><i class="icon-ok icon-white"></i>&nbsp;<s:message code='actualizar.button'/></button>
                    <a class="btn btn-large" href="<s:url value='/activoFijo/tipoActivo/ver/${tipoActivo.id}'/>"><i class="icon-remove"></i> <s:message code='cancelar.button' /></a>
                </p>
            </form:form>
        </div>
        <content>
            <script src="<c:url value='/js/chosen.jquery.min.js' />"></script>
            <script>
                $(document).ready(function() {
                    $('select#cuentaId').chosen();
                    $('input#nombre').focus();
                });
            </script>                    
        </content>
    </body>
</html>
