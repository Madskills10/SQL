CREATE USER 'grafanaReader' IDENTIFIED BY 'madsgrafanaproject';

GRANT SELECT ON performance_schema.* TO 'grafanaReader';