package less13;

public class App {
	public static void main(String[] args) {
		ProdEngine pe = new ProdEngine();
//		Products prod = new Products("Thunderclaw",
//				"Громокоготь (англ. Thunderclaw) — это дракон, принадлежащий классу: «Ищейки». Впервые данный вид драконов появляется в полнометражном анимационном фильме: «Как приручить дракона 2». Позже в игре: «Dragons: Rise of Berk» нам дали его название. С виду Громокогти кажутся вовсе не опасными, а просто любопытными. Но на самом деле они очень опасные.",
//				18450);
//		pe.addProd(prod);
//		System.out.println(pe.getProdBiId(4));
		System.out.println(pe.getAll());
	}
}
