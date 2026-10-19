-- PostgreSQL twin of migrations/038_add_prn_daily_limit.sql (HC-238).

ALTER TABLE hc_medicine_schedules ADD COLUMN max_doses_per_24h INTEGER NULL;
ALTER TABLE hc_medicine_schedules ADD COLUMN min_hours_between DECIMAL(5, 2) NULL;

CREATE TABLE hc_prn_limit_alert_log (
  schedule_id  INTEGER NOT NULL PRIMARY KEY,
  last_dose_at TIMESTAMP(0) NOT NULL,
  last_level   VARCHAR(10) NOT NULL,
  sent_at      TIMESTAMP(0) NOT NULL
);
