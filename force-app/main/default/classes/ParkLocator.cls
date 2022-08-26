public class ParkLocator {
  public static String[] country(String pais) {
    ParkService.ParksImplPort parkService = new ParkService.ParksImplPort();
    return parkService.byCountry(pais);
  }
}