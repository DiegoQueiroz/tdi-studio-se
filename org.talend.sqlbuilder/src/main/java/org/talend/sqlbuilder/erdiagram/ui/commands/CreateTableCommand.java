// ============================================================================
//
// Talend Community Edition
//
// Copyright (C) 2006 Talend - www.talend.com
//
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 2.1 of the License, or (at your option) any later version.
//
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
// Lesser General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
//
// ============================================================================
package org.talend.sqlbuilder.erdiagram.ui.commands;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.gef.commands.Command;
import org.talend.core.model.metadata.builder.connection.MetadataTable;
import org.talend.sqlbuilder.erdiagram.ui.nodes.ErDiagram;
import org.talend.sqlbuilder.erdiagram.ui.nodes.Table;
import org.talend.sqlbuilder.repository.utility.EMFRepositoryNodeManager;

/**
 * DOC qzhang class global comment. Detailled comment <br/>
 * 
 * $Id: talend.epf 1 2006-09-29 17:06:40 +0000 (ææäº, 29 ä¹æ 2006) nrousseau $
 * 
 */
public class CreateTableCommand extends Command {

    protected List<MetadataTable> metaTables;

    private List<Table> tables;

    private ErDiagram erDiagram;

    /**
     * DOC admin CreateTableCommand constructor comment.
     */
    public CreateTableCommand(ErDiagram erDiagram, List<MetadataTable> tables) {
        this.metaTables = tables;
        this.erDiagram = erDiagram;
        this.tables = erDiagram.getTables();
        setLabel("CreateTableCommand"); //$NON-NLS-1$
        setTableNames();
    }

    private List<String> tableNames = new ArrayList<String>();

    private void setTableNames() {
        for (Table table : tables) {
            tableNames.add(table.getElementName());
        }
    }

    @Override
    public void execute() {
        for (MetadataTable metadataTable : metaTables) {
            if (!tableNames.contains(metadataTable.getSourceName())) {
                Table table = new Table();
                table.setMetadataTable(metadataTable, null);
                table.setErDiagram(erDiagram);
                erDiagram.addTable(table);
            }
        }
        List<String[]> fks = erDiagram.getNodeManager().getPKFromTables(erDiagram.getMetadataTables());
        erDiagram.setRelations(fks);
    }

    @Override
    public void redo() {
        // TODO Auto-generated method stub
        super.redo();
    }

    @Override
    public void undo() {
        // TODO Auto-generated method stub
        super.undo();
    }

}
