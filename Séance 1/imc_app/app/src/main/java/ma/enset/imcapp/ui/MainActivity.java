package ma.enset.imcapp.ui;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

import ma.enset.imcapp.R;
import ma.enset.imcapp.model.ImcResult;
import ma.enset.imcapp.service.ImcCalculator;

public class MainActivity extends Activity {
    private final ImcCalculator imcCalculator = new ImcCalculator();

    private EditText editTextWeight;
    private EditText editTextHeight;
    private TextView textViewResult;
    private TextView textViewCategory;
    private ImageView imageViewCategory;
    private DecimalFormat imcFormat;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        DecimalFormatSymbols symbols = DecimalFormatSymbols.getInstance(Locale.FRANCE);
        imcFormat = new DecimalFormat("0.00", symbols);

        editTextWeight = findViewById(R.id.editTextWeight);
        editTextHeight = findViewById(R.id.editTextHeight);
        textViewResult = findViewById(R.id.textViewResult);
        textViewCategory = findViewById(R.id.textViewCategory);
        imageViewCategory = findViewById(R.id.imageViewCategory);
        Button buttonCalculate = findViewById(R.id.buttonCalculate);

        buttonCalculate.setOnClickListener(view -> calculateImc());
    }

    private void calculateImc() {
        Double weight = readPositiveValue(editTextWeight);
        Double heightCm = readPositiveValue(editTextHeight);

        if (weight == null || heightCm == null) {
            clearResult();
            return;
        }

        ImcResult result = imcCalculator.calculate(weight, heightCm);
        showResult(result);
    }

    private Double readPositiveValue(EditText editText) {
        String value = editText.getText().toString().trim().replace(',', '.');
        if (value.isEmpty()) {
            editText.setError(getString(R.string.error_required));
            return null;
        }

        try {
            double number = Double.parseDouble(value);
            if (number <= 0) {
                editText.setError(getString(R.string.error_positive));
                return null;
            }
            editText.setError(null);
            return number;
        } catch (NumberFormatException exception) {
            editText.setError(getString(R.string.error_positive));
            return null;
        }
    }

    private void showResult(ImcResult result) {
        textViewResult.setText(getString(R.string.result_format, imcFormat.format(result.getValue())));
        textViewCategory.setText(result.getCategory().getLabelResId());
        imageViewCategory.setImageResource(result.getCategory().getImageResId());
        imageViewCategory.setVisibility(View.VISIBLE);
    }

    private void clearResult() {
        textViewResult.setText(R.string.result_empty);
        textViewCategory.setText("");
        imageViewCategory.setVisibility(View.INVISIBLE);
    }
}
