/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
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

package com.liferay.gradle.plugins;

import com.liferay.gradle.plugins.source.formatter.FormatSourceTask;
import com.liferay.gradle.plugins.source.formatter.SourceFormatterPlugin;
import com.liferay.gradle.plugins.util.GradleUtil;

import org.gradle.api.Action;
import org.gradle.api.Project;
import org.gradle.api.tasks.TaskContainer;

/**
 * @author Andrea Di Giorgi
 * @author Hugo Huijser
 */
public class SourceFormatterDefaultsPlugin
	extends BasePortalToolDefaultsPlugin<SourceFormatterPlugin> {

	@Override
	protected void configureDefaults(
		Project project, SourceFormatterPlugin sourceFormatterPlugin) {

		super.configureDefaults(project, sourceFormatterPlugin);

		configureTasksFormatSource(project);
	}

	protected void configureTasksFormatSource(
		FormatSourceTask formatSourceTask) {

		int maxLineLength = GradleUtil.toInteger(
			GradleUtil.getProperty(
				formatSourceTask.getProject(),
				"source.formatter.max.line.length", (String)null));

		formatSourceTask.setMaxLineLength(maxLineLength);

		int processorThreadCount = GradleUtil.toInteger(
			GradleUtil.getProperty(
				formatSourceTask.getProject(),
				"source.formatter.processor.thread.count", (String)null));

		formatSourceTask.setProcessorThreadCount(processorThreadCount);
	}

	protected void configureTasksFormatSource(Project project) {
		TaskContainer taskContainer = project.getTasks();

		taskContainer.withType(
			FormatSourceTask.class,
			new Action<FormatSourceTask>() {

				@Override
				public void execute(FormatSourceTask formatSourceTask) {
					configureTasksFormatSource(formatSourceTask);
				}

			});
	}

	@Override
	protected Class<SourceFormatterPlugin> getPluginClass() {
		return SourceFormatterPlugin.class;
	}

	@Override
	protected String getPortalToolConfigurationName() {
		return SourceFormatterPlugin.CONFIGURATION_NAME;
	}

	@Override
	protected String getPortalToolName() {
		return _PORTAL_TOOL_NAME;
	}

	private static final String _PORTAL_TOOL_NAME =
		"com.liferay.source.formatter";

}