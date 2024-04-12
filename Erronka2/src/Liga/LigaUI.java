package Liga;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class LigaUI {
    private JFrame frame;
    private JTextField[] txtTaldeak;
    private JComboBox<Integer> comboBoxTaldeKop;
    private JComboBox<String> comboBoxTxapelketaKodeak;
    private JButton btnGorde;
    private SQLManager sqlManager;

    public LigaUI() {
        initialize();
        sqlManager = new SQLManager();
    }

    private void initialize() {
        frame = new JFrame();
        frame.setTitle("Partiduak");
        frame.setBounds(100, 100, 500, 400);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().setLayout(null);

        JLabel lblTaldeKop = new JLabel("Talde Kopurua:");
        lblTaldeKop.setBounds(29, 28, 104, 16);
        frame.getContentPane().add(lblTaldeKop);

        comboBoxTaldeKop = new JComboBox<>();
        comboBoxTaldeKop.setBounds(145, 25, 116, 22);
        comboBoxTaldeKop.addItem(6);
        comboBoxTaldeKop.addItem(8);
        comboBoxTaldeKop.addItem(10);
        comboBoxTaldeKop.addItem(12);
        frame.getContentPane().add(comboBoxTaldeKop);

        JLabel lblTxapelketaKodeak = new JLabel("Txapelketa Kodeak:");
        lblTxapelketaKodeak.setBounds(29, 72, 126, 16);
        frame.getContentPane().add(lblTxapelketaKodeak);

        comboBoxTxapelketaKodeak = new JComboBox<>();
        comboBoxTxapelketaKodeak.setBounds(176, 69, 185, 22);
        comboBoxTxapelketaKodeak.addItem("1-Gizona");
        comboBoxTxapelketaKodeak.addItem("2-Emakumea");
        comboBoxTxapelketaKodeak.addItem("3-Sub-18");
        comboBoxTxapelketaKodeak.addItem("4-Sub-16");
        frame.getContentPane().add(comboBoxTxapelketaKodeak);

        comboBoxTaldeKop.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
                int taldeKop = (int) comboBoxTaldeKop.getSelectedItem();
                SortuTaldeak(taldeKop);
                sortuGordeBotoia();
            }
        });

        int taldeKop = (int) comboBoxTaldeKop.getSelectedItem();
        SortuTaldeak(taldeKop);
        sortuGordeBotoia();
    }

    public JFrame getFrame() {
        return frame;
    }

    private void SortuTaldeak(int taldeKop) {
        if (txtTaldeak != null) {
            for (JTextField txtTaldea : txtTaldeak) {
                frame.getContentPane().remove(txtTaldea);
            }
        }

        int yPosition = 116;
        int xPosition = 145;
        txtTaldeak = new JTextField[taldeKop];
        int halfTaldeKop = taldeKop / 2;
        for (int i = 0; i < halfTaldeKop; i++) {
            txtTaldeak[i] = new JTextField();
            txtTaldeak[i].setBounds(xPosition, yPosition, 116, 22);
            frame.getContentPane().add(txtTaldeak[i]);
            txtTaldeak[i].setColumns(10);
            yPosition += 25;
        }
        yPosition = 116;
        xPosition = 290;
        for (int i = halfTaldeKop; i < taldeKop; i++) {
            txtTaldeak[i] = new JTextField();
            txtTaldeak[i].setBounds(xPosition, yPosition, 116, 22);
            frame.getContentPane().add(txtTaldeak[i]);
            txtTaldeak[i].setColumns(10);
            yPosition += 25;
        }
        frame.revalidate();
        frame.repaint();
    }

    private void sortuGordeBotoia() {
        if (btnGorde != null) {
            frame.getContentPane().remove(btnGorde);
        }

        btnGorde = new JButton("Gorde");
        btnGorde.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
                sqlManager.insertPartidoak((int) comboBoxTaldeKop.getSelectedItem(), (String) comboBoxTxapelketaKodeak.getSelectedItem(), txtTaldeak);
            }
        });
        btnGorde.setBounds(145, txtTaldeak[txtTaldeak.length - 1].getY() + 50, 97, 25);
        frame.getContentPane().add(btnGorde);
        frame.revalidate();
        frame.repaint();
    }
}
