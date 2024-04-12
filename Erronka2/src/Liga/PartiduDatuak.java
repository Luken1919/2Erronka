package Liga;

import javax.swing.JTextField;

public class PartiduDatuak {
    private int taldeKop;
    private String txapelketaKodeak;
    private JTextField[] taldeak;

    public PartiduDatuak(int taldeKop, String txapelketaKodeak, JTextField[] taldeDatuak) {
        this.taldeKop = taldeKop;
        this.txapelketaKodeak = txapelketaKodeak;
        this.taldeak = taldeDatuak;
    }

	public int getTaldeKop() {
		return taldeKop;
	}

	public void setTaldeKop(int taldeKop) {
		this.taldeKop = taldeKop;
	}

	public String getTxapelketaKodeak() {
		return txapelketaKodeak;
	}

	public void setTxapelketaKodeak(String txapelketaKodeak) {
		this.txapelketaKodeak = txapelketaKodeak;
	}

	public JTextField[] getTaldeak() {
		return taldeak;
	}

	public void setTaldeak(JTextField[] taldeak) {
		this.taldeak = taldeak;
	}

    
}
