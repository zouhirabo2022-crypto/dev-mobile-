package ma.enset.imcapp.model;

public class ImcResult {
    private final double value;
    private final ImcCategory category;

    public ImcResult(double value, ImcCategory category) {
        this.value = value;
        this.category = category;
    }

    public double getValue() {
        return value;
    }

    public ImcCategory getCategory() {
        return category;
    }
}
