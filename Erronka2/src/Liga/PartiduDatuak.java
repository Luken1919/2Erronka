package Liga;

import javax.swing.JTextField;

/**
 * Klase hau txapelketako partiduen datuak gordetzeko sortu da. 
 * 
 */
public class PartiduDatuak {
    private int taldeKop;
    private String txapelketaKodeak;
    private JTextField[] taldeak;

    /**
     * PartiduDatuak klasearen eraikitzailea.
     * @param taldeKop Talde kopurua
     * @param txapelketaKodeak Txapelketaren kodea
     * @param taldeDatuak Taldeen datuak gordetzeko JTextField arraya
     */
    public PartiduDatuak(int taldeKop, String txapelketaKodeak, JTextField[] taldeDatuak) {
        this.taldeKop = taldeKop;
        this.txapelketaKodeak = txapelketaKodeak;
        this.taldeak = taldeDatuak;
    }

	
	/** 
	 * Talde kopurua itzultzen du.
	 * @return Talde kopurua
	 */
	public int getTaldeKop() {
		return taldeKop;
	}

	
	/** 
	 * Talde kopurua ezarri.
	 * @param taldeKop Talde kopurua
	 */
	public void setTaldeKop(int taldeKop) {
		this.taldeKop = taldeKop;
	}

	/**
	 * Txapelketaren kodea itzultzen du.
	 * @return Txapelketaren kodea
	 */
	public String getTxapelketaKodeak() {
		return txapelketaKodeak;
	}

	/**
	 * Txapelketaren kodea ezartzen du.
	 * @param txapelketaKodeak Txapelketaren kodea
	 */
	public void setTxapelketaKodeak(String txapelketaKodeak) {
		this.txapelketaKodeak = txapelketaKodeak;
	}

	/**
	 * Taldeen datuak gordetzeko JTextField arraya itzultzen du.
	 * @return Taldeen datuak gordetzeko JTextField arraya
	 */
	public JTextField[] getTaldeak() {
		return taldeak;
	}

	/**
	 * Taldeen datuak gordetzeko JTextField arraya ezartzen du.
	 * @param taldeak Taldeen datuak gordetzeko JTextField arraya
	 */
	public void setTaldeak(JTextField[] taldeak) {
		this.taldeak = taldeak;
	}

    
}
