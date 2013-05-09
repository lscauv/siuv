/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CPP;

import CPC.*;
import CPC.CPCInicio;
import CPC.cobroUnico;
import java.sql.*;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.awt.Dimension;
import javax.swing.JOptionPane;
import javax.swing.JTable;

/**
 *
 * @author lscauv
 */
public class PagosPendientesProveedor extends javax.swing.JInternalFrame {

    Connection conexion;
    ResultSet rs;
    PreparedStatement psExecute;
    Statement stmt;
    MysqlDataSource data = new MysqlDataSource();
    String nombre;
    
    /**
     * Creates new form cuentasPendientes
     */
    public PagosPendientesProveedor() {
        initComponents();
        
        data.setUser("root");
        data.setPassword("1234");
        data.setDatabaseName("siuv");
        data.setServerName("127.0.0.1");
        
        try
        {
            conexion = data.getConnection();
            psExecute = conexion.prepareStatement("SELECT cxc.ID_CC as 'ID', cli.ID_RFC as 'RFC', v.ID_NFacturas as 'Factura', c.Cantidad, d.Folio, d.Fecha_documento as 'Fecha' FROM cuentas_por_cobrar cxc, ventas v, credito c, doc_cobrar d, clientes cli WHERE cxc.ID_NFacturas = v.ID_NFacturas AND cli.ID_RFC = cxc.ID_RFC;");
            rs = psExecute.executeQuery();
            siuv.ListTableModel tmodel = siuv.ListTableModel.createModelFromResultSet(rs);
            jTable1.setModel(tmodel);
            
        } catch (SQLException ex)
        {
            JOptionPane.showMessageDialog(this, ex.getMessage());
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        btnCerrar = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTable2 = new javax.swing.JTable();

        setClosable(true);
        setMaximizable(true);
        setTitle("Consulta Proveedor");

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        jTable1.getTableHeader().setReorderingAllowed(false);
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);

        btnCerrar.setText("Cerrar");
        btnCerrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCerrarActionPerformed(evt);
            }
        });

        jTable2.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null}
            },
            new String [] {
                "RFC", "Proveedor", "Deuda", "Pagos", "Restante", "Fecha"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.Short.class, java.lang.Float.class, java.lang.Float.class, java.lang.Object.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jScrollPane2.setViewportView(jTable2);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnCerrar))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(31, 31, 31)
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 1132, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 76, Short.MAX_VALUE)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 0, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(654, 654, 654))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 376, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnCerrar)
                .addContainerGap())
        );

        getAccessibleContext().setAccessibleParent(this);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCerrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCerrarActionPerformed
        // TODO add your handling code here:
        this.dispose();
    }//GEN-LAST:event_btnCerrarActionPerformed

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:
        if (evt.getClickCount() == 2)
        {
            JTable tabla = (JTable)evt.getSource();
            int row = tabla.getSelectedRow();
            //int col = tabla.getSelectedColumn();
            String factura = tabla.getValueAt(row, 2).toString();
            cobroUnico cobro = new cobroUnico(factura);
            cobro.setVisible(true);
            
            Dimension dim = CPCInicio.desktopPane.getSize();
            Dimension winDim = cobro.getSize();
            cobro.setLocation((dim.width - winDim.width) / 2, (dim.height - winDim.height) / 2);
            CPCInicio.desktopPane.add(cobro, new Integer(10));
            
            //JOptionPane.showConfirmDialog(this, "RFC: " + RFC, "RFC Seleccionado", 2);
        }
    }//GEN-LAST:event_jTable1MouseClicked

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCerrar;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTable1;
    private javax.swing.JTable jTable2;
    // End of variables declaration//GEN-END:variables
}
