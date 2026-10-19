-- PostgreSQL twin of migrations/037_add_user_patients.sql (HC-237).

CREATE TABLE IF NOT EXISTS hc_user_patients (
  user_login VARCHAR(25) NOT NULL,
  patient_id INTEGER NOT NULL,
  created_at TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_login, patient_id),
  FOREIGN KEY (patient_id) REFERENCES hc_patients (id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS idx_hc_user_patients_patient ON hc_user_patients (patient_id);
