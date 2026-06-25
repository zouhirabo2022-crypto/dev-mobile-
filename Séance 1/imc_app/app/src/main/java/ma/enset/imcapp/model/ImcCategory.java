package ma.enset.imcapp.model;

import ma.enset.imcapp.R;

public enum ImcCategory {
    MAIGREUR(R.string.category_thin, R.drawable.maigre),
    NORMAL(R.string.category_normal, R.drawable.normal),
    SURPOIDS(R.string.category_overweight, R.drawable.surpoids),
    OBESITE_MODEREE(R.string.category_obese, R.drawable.obese),
    OBESITE_SEVERE(R.string.category_severe_obese, R.drawable.t_obese);

    private final int labelResId;
    private final int imageResId;

    ImcCategory(int labelResId, int imageResId) {
        this.labelResId = labelResId;
        this.imageResId = imageResId;
    }

    public int getLabelResId() {
        return labelResId;
    }

    public int getImageResId() {
        return imageResId;
    }
}
