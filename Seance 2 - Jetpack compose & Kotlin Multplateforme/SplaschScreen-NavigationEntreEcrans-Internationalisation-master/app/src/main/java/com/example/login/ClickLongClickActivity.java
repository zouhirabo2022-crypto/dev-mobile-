package com.example.login;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class ClickLongClickActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_click_long_click);

        Button click = findViewById(R.id.click);
        TextView longText = findViewById(R.id.longText);

        click.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(ClickLongClickActivity.this, "Button click ", Toast.LENGTH_SHORT).show();
                longText.setText("Simple Click On Button ");
            }
        });

        click.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {
                Toast.makeText(ClickLongClickActivity.this, "Button Long click", Toast.LENGTH_SHORT).show();
                longText.setText("Long Click On Button");
                return true;
            }
        });
    }
}
