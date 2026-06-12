package org.schabi.newpipe.settings;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import org.schabi.newpipe.util.ThemeHelper;

public class DownloadSettingsActivity extends AppCompatActivity {

    public DownloadSettingsActivity() {
        super();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ThemeHelper.setTheme(this);
        
        DownloadSettingsFragment fragment = new DownloadSettingsFragment();
        getSupportFragmentManager()
            .beginTransaction()
            .replace(android.R.id.content, fragment)
            .commit();
    }
}
