// ============================================================================
//
// Copyright (C) 2006-2009 Talend Inc. - www.talend.com
//
// This source code is available under agreement available at
// %InstallDIR%\features\org.talend.rcp.branding.%PRODUCTNAME%\%PRODUCTNAME%license.txt
//
// You should have received a copy of the agreement
// along with this program; if not, write to Talend SA
// 9 rue Pages 92150 Suresnes, France
//
// ============================================================================
package org.talend.designer.core.ui.preferences;

import org.eclipse.gmf.runtime.common.ui.preferences.AbstractPreferencePage;
import org.eclipse.gmf.runtime.common.ui.preferences.FontFieldEditor;
import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Group;
import org.talend.designer.core.DesignerPlugin;
import org.talend.designer.core.i18n.Messages;

public class OutputConsolePreferencePage extends AbstractPreferencePage {

    private FontFieldEditor consoleFontField = null;

    public static final String CONSOLE_FONT = "talendOutputConsoleFont"; //$NON-NLS-1$

    public OutputConsolePreferencePage() {
        setPreferenceStore(DesignerPlugin.getDefault().getPreferenceStore());
    }

    @Override
    protected void addFields(Composite parent) {
        Composite main = createPageLayout(parent);
        createFontAndColorGroup(main);
    }

    private Composite createPageLayout(Composite parent) {
        Composite main = new Composite(parent, SWT.NULL);
        main.setLayout(new GridLayout());
        main.setLayoutData(new GridData(GridData.GRAB_HORIZONTAL | GridData.HORIZONTAL_ALIGN_FILL));
        return main;
    }

    protected Composite createFontAndColorGroup(Composite parent) {

        Group group = new Group(parent, SWT.NONE);
        group.setLayoutData(new GridData(GridData.FILL_HORIZONTAL));
        group.setLayout(new GridLayout(3, false));
        Composite composite = new Composite(group, SWT.NONE);
        GridLayout gridLayout = new GridLayout(3, false);
        composite.setLayout(gridLayout);
        GridData gridData = new GridData(GridData.FILL_HORIZONTAL);
        gridData.grabExcessHorizontalSpace = true;
        gridData.horizontalSpan = 3;
        composite.setLayoutData(gridData);
        group.setText(Messages.getString("OutputConsolePreferencePage.outputConsole"));

        addFontAndColorFields(composite);

        GridLayout layout = new GridLayout();
        layout.numColumns = 3;
        layout.marginWidth = 0;
        layout.marginHeight = 0;
        layout.horizontalSpacing = 8;
        composite.setLayout(layout);

        return group;

    }

    protected void addFontAndColorFields(Composite composite) {

        consoleFontField = new FontFieldEditor(OutputConsolePreferencePage.CONSOLE_FONT, Messages
                .getString("OutputConsolePreferencePage.consoleFont"), composite); //$NON-NLS-1$
        addField(consoleFontField);
    }

    @Override
    protected void initHelp() {
        // do nothing.
    }

}
