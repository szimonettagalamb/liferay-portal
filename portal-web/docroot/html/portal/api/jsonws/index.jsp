<%--
/**
 * Copyright (c) 2000-2012 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
 <style type="text/css">
	<%@ include file="/html/portal/api/jsonws/css.jspf" %>
</style>

<div id="header">
	<div id="header-content">
		<h1><a href="jsonws">JSON Web Services API</a></h1>
	</div>
</div>

<div id="content">
	<c:choose>
		<c:when test="<%= PropsValues.JSON_WEB_SERVICE_ENABLED %>">
			<%
			String signature = ParamUtil.getString(request, "signature");
			%>

			<c:choose>
				<c:when test="<%= Validator.isNull(signature) %>">
					<%@ include file="/html/portal/api/jsonws/actions.jspf" %>
				</c:when>
				<c:otherwise>
					<%@ include file="/html/portal/api/jsonws/action.jspf" %>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			JSON web services are disabled.
		</c:otherwise>
	</c:choose>
</div>

<div id="footer">
	<div id="footer-content">

		<%
		Calendar calendar = CalendarFactoryUtil.getCalendar();
		%>

		Copyright (c) 2000-<%= calendar.get(Calendar.YEAR) %> Liferay, Inc. All rights reserved.
	</div>
</div>
----------------
--%>

<%@ include file="/html/portal/api/jsonws/init.jsp" %>

<%
String signature = ParamUtil.getString(request, "signature");
%>

<style>
	<%@ include file="/html/portal/api/jsonws/css.jspf" %>
</style>

<div id="wrapper">
	<header id="banner" role="banner">
		<hgroup id="heading">
			<h1 class="site-title">
				<a class="logo" href="./" title="JSONWS API">
					<img alt="JSONWS API" height="<%= themeDisplay.getCompanyLogoHeight() %>" src="<%= HtmlUtil.escape(themeDisplay.getCompanyLogo()) %>" width="<%= themeDisplay.getCompanyLogoWidth() %>" />
				</a>

				<span class="site-name">
					JSONWS API
				</span>
			</h1>
		</hgroup>
	</header>

	<div id="content">
		<div id="main-content">

			<%
			if (Validator.isNull(signature)) {
			%>

				<%@ include file="/html/portal/api/jsonws/actions.jspf" %>

			<%
			}
			else {
			%>

				<%@ include file="/html/portal/api/jsonws/action.jspf" %>

			<%
			}
			%>
		</div>
	</div>

	<footer id="footer" role="contentinfo">
		<p class="powered-by">
			<liferay-ui:message key="powered-by" /> <a href="http://www.liferay.com" rel="external">Liferay</a>
		</p>
	</footer>
</div>