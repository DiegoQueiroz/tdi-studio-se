// ============================================================================
//
// Copyright (C) 2006-2010 Talend Inc. - www.talend.com
//
// This source code is available under agreement available at
// %InstallDIR%\features\org.talend.rcp.branding.%PRODUCTNAME%\%PRODUCTNAME%license.txt
//
// You should have received a copy of the agreement
// along with this program; if not, write to Talend SA
// 9 rue Pages 92150 Suresnes, France
//
// ============================================================================
package org.talend.designer.core.ui.editor.cmd;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.eclipse.ui.IWorkbenchPage;
import org.eclipse.ui.PlatformUI;
import org.talend.core.model.metadata.ColumnNameChanged;
import org.talend.core.model.metadata.IMetadataTable;
import org.talend.core.model.metadata.designerproperties.RepositoryToComponentProperty;
import org.talend.core.model.process.EParameterFieldType;
import org.talend.core.model.process.IElementParameter;
import org.talend.core.model.properties.ConnectionItem;
import org.talend.core.model.properties.Item;
import org.talend.core.model.repository.IRepositoryViewObject;
import org.talend.designer.core.model.components.EParameterName;
import org.talend.designer.core.model.components.EmfComponent;
import org.talend.designer.core.ui.editor.nodes.Node;
import org.talend.designer.core.ui.editor.properties.controllers.ColumnListController;
import org.talend.designer.core.ui.views.properties.ComponentSettingsView;
import org.talend.repository.UpdateRepositoryUtils;

/**
 * DOC nrousseau class global comment. Detailled comment <br/>
 * 
 * $Id: talend-code-templates.xml 1 2006-09-29 17:06:40 +0000 (ven., 29 sept. 2006) nrousseau $
 * 
 */
public class RepositoryChangeMetadataCommand extends ChangeMetadataCommand {

    private final String propName;

    private final Object oldPropValue, newPropValue;

    private final Node node;

    private String newRepositoryIdValue, oldRepositoryIdValue;

    public RepositoryChangeMetadataCommand(Node node, String propName, Object propValue, IMetadataTable newOutputMetadata,
            String newRepositoryIdValue) {
        super(node, node.getElementParameter(propName) == null ? null : node.getElementParameter(propName).getParentParameter(),
                null, newOutputMetadata, node.getElementParameter(propName) == null ? null : node.getElementParameter(propName)
                        .getParentParameter());
        this.propName = propName;
        oldPropValue = node.getPropertyValue(propName);
        newPropValue = propValue;
        this.node = node;
        this.newRepositoryIdValue = newRepositoryIdValue;
        this.setRepositoryMode(true);
    }

    @Override
    public void execute() {
        node.setPropertyValue(propName, newPropValue);

        if (node.isExternalNode() && !node.isELTComponent()) {
            for (IElementParameter parameter : node.getElementParameters()) {
                if (parameter.getFieldType() == EParameterFieldType.TABLE) {
                    if (!node.getMetadataList().isEmpty() && !node.getMetadataList().get(0).sameMetadataAs(newOutputMetadata)) {
                        parameter.setValue(new ArrayList<Map<String, Object>>());
                    }
                }
            }
        }
        // IElementParameter schemaTypeParameter =
        // node.getElementParameter(propName).getParentParameter().getChildParameters().get(
        // EParameterName.SCHEMA_TYPE.getName());
        // IElementParameter repositorySchemaTypeParameter = node.getElementParameter(propName).getParentParameter()
        // .getChildParameters().get(EParameterName.REPOSITORY_SCHEMA_TYPE.getName());
        // String schemaType = (String) schemaTypeParameter.getValue();
        // bug 6028, Display the parameter of REPOSITORY_SCHEMA_TYPE
        // if (schemaType != null && schemaType.equals(EmfComponent.REPOSITORY)) {
        // repositorySchemaTypeParameter.setShow(true);
        // if (newRepositoryIdValue != null) {
        // oldRepositoryIdValue = (String) repositorySchemaTypeParameter.getValue();
        // repositorySchemaTypeParameter.setValue(newRepositoryIdValue);
        // }
        // } else {
        // repositorySchemaTypeParameter.setShow(false);
        // }

        node.getElementParameter(EParameterName.UPDATE_COMPONENTS.getName()).setValue(true);
        setDBTableFieldValue(node, newOutputMetadata.getTableName(), oldOutputMetadata.getTableName());
        setSAPFunctionName(node, newOutputMetadata.getLabel());
        super.execute();
        String propertyType = (String) node.getPropertyValue(EParameterName.PROPERTY_TYPE.getName());
        if (propertyType != null) {
            if (propertyType.equals(EmfComponent.REPOSITORY)) {
                String propertyValue = (String) node.getPropertyValue(EParameterName.REPOSITORY_PROPERTY_TYPE.getName());

                IRepositoryViewObject lastVersion = UpdateRepositoryUtils.getRepositoryObjectById(propertyValue);
                Item item = lastVersion.getProperty().getItem();
                if (item instanceof ConnectionItem) {
                    for (IElementParameter param : node.getElementParameters()) {
                        if (param.getRepositoryValue() != null && !param.getRepositoryValue().equals("")) {
                            if (param.getRepositoryValue().equals("TYPE")) { //$NON-NLS-1$
                                continue;
                            }
                            if (param.getFieldType().equals(EParameterFieldType.TABLE)
                                    && param.getRepositoryValue().equals("XML_MAPPING")) { //$NON-NLS-1$
                                List<Map<String, Object>> table = (List<Map<String, Object>>) node.getPropertyValue(param
                                        .getName());
                                IMetadataTable metaTable = node.getMetadataList().get(0);
                                RepositoryToComponentProperty.getTableXmlFileValue(((ConnectionItem) item).getConnection(),
                                        "XML_MAPPING", param, //$NON-NLS-1$
                                        table, newOutputMetadata);
                                param.setRepositoryValueUsed(true);
                            } else {
                                Object value = RepositoryToComponentProperty.getValue(((ConnectionItem) item).getConnection(),
                                        param.getRepositoryValue(), newOutputMetadata);
                                if (value != null) {
                                    param.setValue(value);
                                }

                            }
                        }
                    }
                }
            }
        }
    }

    @Override
    public void undo() {
        node.setPropertyValue(propName, oldPropValue);
        IElementParameter repositorySchemaTypeParameter = node.getElementParameter(propName).getParentParameter()
                .getChildParameters().get(EParameterName.REPOSITORY_SCHEMA_TYPE.getName());
        if (newRepositoryIdValue != null) {
            repositorySchemaTypeParameter.setValue(oldRepositoryIdValue);
        }
        node.getElementParameter(EParameterName.UPDATE_COMPONENTS.getName()).setValue(true);
        super.undo();
    }

    @Override
    protected void updateColumnList(IMetadataTable oldTable, IMetadataTable newTable) {
        IWorkbenchPage page = PlatformUI.getWorkbench().getActiveWorkbenchWindow().getActivePage();
        ComponentSettingsView viewer = (ComponentSettingsView) page.findView(ComponentSettingsView.ID); //$NON-NLS-1$
        if (viewer == null) {
            return;
        }

        if (viewer.getElement() != null && viewer.getElement().equals(node)) {
            List<ColumnNameChanged> columnNameChanged = new ArrayList<ColumnNameChanged>();
            for (int j = 0; j < oldTable.getListColumns().size(); j++) {
                if (newTable.getListColumns().size() > j) {
                    String oldName = oldTable.getListColumns().get(j).getLabel();
                    String newName = newTable.getListColumns().get(j).getLabel();
                    if (!oldName.equals(newName)) {
                        columnNameChanged.add(new ColumnNameChanged(oldName, newName));
                    }
                }
            }
            ColumnListController.updateColumnList(node, null);
        }

    }

}
