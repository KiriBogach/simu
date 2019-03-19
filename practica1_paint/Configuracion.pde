public class Configuracion {

	// Clase que mantiene guardada toda la configuración de los elementos
	
	public String forma = "";
	public boolean relleno = false;
	public boolean mouseClicked = false;
	public boolean inColorSelection = false;
	public boolean inFiltros = false;

	public color colorRelleno = color(0);
	public color colorBorde = color(0);

	public PVector recorte0 = null;
	public PVector recorte1 = null;

	public float grosor = 1;

	public float elementSize = 100;

}