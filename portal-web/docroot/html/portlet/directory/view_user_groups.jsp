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
--%>

<%@ include file="/html/portlet/directory/init.jsp" %>

<%
PortletURL portletURL = (PortletURL)request.getAttribute("view.jsp-portletURL");
%>

<liferay-ui:search-container
	searchContainer="<%= new UserGroupSearch(renderRequest, portletURL) %>"
>
	<aui:input disabled="<%= true %>" name="userGroupsRedirect" type="hidden" value="<%= portletURL.toString() %>" />

	<liferay-ui:search-form
		page="/html/portlet/directory/user_group_search.jsp"
	/>

	<%
	UserGroupSearchTerms searchTerms = (UserGroupSearchTerms)searchContainer.getSearchTerms();

	LinkedHashMap<String, Object> userGroupParams = new LinkedHashMap<String, Object>();
	%>

	<liferay-ui:search-container-results>
		<c:choose>
			<c:when test="<%= PropsValues.USER_GROUPS_INDEXER_ENABLED && PropsValues.USER_GROUPS_SEARCH_WITH_INDEX %>">
				<%@ include file="/html/portlet/user_groups_admin/user_group_search_results_index.jspf" %>
			</c:when>
			<c:otherwise>
				<%@ include file="/html/portlet/user_groups_admin/user_group_search_results_database.jspf" %>
			</c:otherwise>
		</c:choose>
	</liferay-ui:search-container-results>

	<liferay-ui:search-container-row
		className="com.liferay.portal.model.UserGroup"
		escapedModel="<%= true %>"
		keyProperty="userGroupId"
		modelVar="userGroup"
	>
		<liferay-ui:search-container-column-text
			name="name"
			orderable="<%= true %>"
			property="name"
		/>

		<liferay-ui:search-container-column-text
			name="description"
			orderable="<%= true %>"
			property="description"
		/>

		<liferay-ui:search-container-column-jsp
			align="right"
			path="/html/portlet/directory/user_group_action.jsp"
		/>
	</liferay-ui:search-container-row>

	<div class="separator"><!-- --></div>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>