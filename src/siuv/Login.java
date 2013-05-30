package siuv;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.sql.*;

import javax.swing.JOptionPane;

public class Login extends javax.swing.JFrame 
{
    Connection conexion;
    ResultSet rs;
    PreparedStatement psExecute;
    Statement stmt;
    MysqlDataSource data = new MysqlDataSource();
    
    public Login() 
    {
        initComponents();
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLUs = new javax.swing.JLabel();
        jLCon = new javax.swing.JLabel();
        txtCon = new javax.swing.JPasswordField();
        txtUs = new javax.swing.JTextField();
        btnIngresar = new javax.swing.JButton();
        btnSalir = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setResizable(false);

        jLabel1.setFont(new java.awt.Font("Britannic Bold", 0, 18)); // NOI18N
        jLabel1.setText("Iniciar sesión ");

        jLUs.setText("Usuario");

        jLCon.setText("Contraseña");

        btnIngresar.setText("Ingresar");
        btnIngresar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnIngresarActionPerformed(evt);
            }
        });

        btnSalir.setText("Salir");
        btnSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSalirActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(0, 104, Short.MAX_VALUE)
                .addComponent(btnIngresar)
                .addGap(70, 70, 70)
                .addComponent(btnSalir)
                .addGap(96, 96, 96))
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(49, 49, 49)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLCon)
                            .addComponent(jLUs))
                        .addGap(26, 26, 26)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(txtUs, javax.swing.GroupLayout.PREFERRED_SIZE, 144, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtCon, javax.swing.GroupLayout.PREFERRED_SIZE, 144, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(140, 140, 140)
                        .addComponent(jLabel1)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLUs)
                    .addComponent(txtUs, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLCon)
                    .addComponent(txtCon, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnSalir)
                    .addComponent(btnIngresar))
                .addContainerGap(22, Short.MAX_VALUE))
        );

        setSize(new java.awt.Dimension(412, 221));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void btnIngresarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnIngresarActionPerformed
        // Esto es un ejemplo. Tanto el usuario como la contraseña debe salir de la base de datos.
        
        String usuario = "";
        String contraseña = "";
        String permisos = "";
        data.setUser("root");
        data.setPassword("uv");
        data.setDatabaseName("siuv");
        data.setServerName("127.0.0.1");
        
        try
        {
            conexion = data.getConnection();
            psExecute = conexion.prepareStatement("SELECT * FROM usuarios WHERE Username='" + txtUs.getText() + "';");
            rs = psExecute.executeQuery();
            if (rs.next()){
                usuario = rs.getString("Username");
                contraseña = rs.getString("Password");
                permisos = rs.getString("Permisos");
            }
            if (usuario.equals(txtUs.getText())){
                if (contraseña.equals(txtCon.getText())){
                    Menu_principal inicio = new Menu_principal(permisos);
                    inicio.setVisible(true);
                this.dispose();
            } else{
                JOptionPane.showConfirmDialog(this, "Error en la contraseña, por favor revísela.", "Error", JOptionPane.DEFAULT_OPTION, JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showConfirmDialog(this, "El nombre de usuario no existe. Utilice otro nombre.", "Error", JOptionPane.DEFAULT_OPTION, JOptionPane.ERROR_MESSAGE);
        }
        } catch (SQLException ex)
        {
            JOptionPane.showMessageDialog(this, ex.getMessage());
        }
    }//GEN-LAST:event_btnIngresarActionPerformed

    private void btnSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSalirActionPerformed
    
        if (JOptionPane.showConfirmDialog(this, "¿Desea salir del Sistema?", "Advertencia", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE) == 0){
            this.dispose();
    }
    }//GEN-LAST:event_btnSalirActionPerformed

    public static void main(String args[]) 
    {
        java.awt.EventQueue.invokeLater(new Runnable() 
        {
            public void run() 
            {
                new Login().setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnIngresar;
    private javax.swing.JButton btnSalir;
    private javax.swing.JLabel jLCon;
    private javax.swing.JLabel jLUs;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPasswordField txtCon;
    private javax.swing.JTextField txtUs;
    // End of variables declaration//GEN-END:variables
}
