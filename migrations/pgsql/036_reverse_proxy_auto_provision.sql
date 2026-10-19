-- PostgreSQL twin of migrations/036_reverse_proxy_auto_provision.sql (HC-243).
-- Seeds the auto-provisioning defaults (all off). ON CONFLICT DO NOTHING
-- is the PostgreSQL spelling of MySQL's INSERT IGNORE.

INSERT INTO hc_config (setting, value) VALUES
  ('reverse_proxy_auto_provision', 'N'),
  ('reverse_proxy_groups_header', 'Remote-Groups'),
  ('reverse_proxy_admin_groups', ''),
  ('reverse_proxy_caregiver_groups', ''),
  ('reverse_proxy_viewer_groups', ''),
  ('reverse_proxy_default_role', 'viewer'),
  ('reverse_proxy_sync_role', 'N'),
  ('reverse_proxy_name_header', ''),
  ('reverse_proxy_email_header', '')
ON CONFLICT (setting) DO NOTHING;
