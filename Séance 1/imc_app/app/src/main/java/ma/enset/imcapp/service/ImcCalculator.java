package ma.enset.imcapp.service;

import ma.enset.imcapp.model.ImcCategory;
import ma.enset.imcapp.model.ImcResult;

public class ImcCalculator {
    public ImcResult calculate(double weightKg, double heightCm) {
        if (weightKg <= 0 || heightCm <= 0) {
            throw new IllegalArgumentException("Weight and height must be positive.");
        }

        double heightM = heightCm / 100.0;
        double imc = weightKg / (heightM * heightM);
        return new ImcResult(imc, getCategory(imc));
    }

    private ImcCategory getCategory(double imc) {
        if (imc < 18.5) {
            return ImcCategory.MAIGREUR;
        }
        if (imc < 25.0) {
            return ImcCategory.NORMAL;
        }
        if (imc < 30.0) {
            return ImcCategory.SURPOIDS;
        }
        if (imc <= 40.0) {
            return ImcCategory.OBESITE_MODEREE;
        }
        return ImcCategory.OBESITE_SEVERE;
    }
}
