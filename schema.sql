PRAGMA foreign_keys = ON;
CREATE TABLE unit (unit_id TEXT PRIMARY KEY, level TEXT NOT NULL, unit_kind TEXT NOT NULL,
  name TEXT NOT NULL, admin_code TEXT, prov_code TEXT, parent_unit TEXT, region TEXT,
  sub_provincial INTEGER DEFAULT 0, batch_id TEXT, status TEXT DEFAULT '未开始',
  history TEXT, note TEXT);
CREATE TABLE agency (agency_id TEXT PRIMARY KEY, unit_id TEXT REFERENCES unit, name TEXT NOT NULL,
  category TEXT, priority TEXT, home_url TEXT, note TEXT);
CREATE TABLE site (site_id TEXT PRIMARY KEY, agency_id TEXT REFERENCES agency, site_type TEXT,
  url TEXT, verify_status TEXT, verified_at TEXT);
CREATE TABLE run (run_id TEXT PRIMARY KEY, agent TEXT, model TEXT, model_version TEXT,
  prompt_version TEXT, started_at TEXT, ended_at TEXT, target TEXT, note TEXT);
CREATE TABLE search_log (log_id TEXT PRIMARY KEY, unit_id TEXT REFERENCES unit, route TEXT,
  site TEXT, query TEXT, time_range TEXT, n_results INTEGER, n_browsed INTEGER,
  n_new_cand INTEGER, n_ab INTEGER, anomaly TEXT, run_id TEXT REFERENCES run,
  executed_at TEXT, evidence_path TEXT, note TEXT);
CREATE TABLE candidate (cand_id TEXT PRIMARY KEY, unit_id TEXT REFERENCES unit, title TEXT,
  issuer TEXT, date_hint TEXT, url TEXT, route TEXT, log_id TEXT REFERENCES search_log,
  outcome TEXT, doc_id TEXT, reason TEXT);
CREATE TABLE document (doc_id TEXT PRIMARY KEY, unit_id TEXT REFERENCES unit,
  title TEXT NOT NULL, title_notice TEXT, doc_number TEXT, issuers TEXT NOT NULL,
  issuer_n INTEGER, issuer_type TEXT, level TEXT NOT NULL, unit_kind TEXT, prov_code TEXT,
  admin_code TEXT, legal_force TEXT, official_genre TEXT, policy_form TEXT, doc_class TEXT,
  date_written TEXT, date_published TEXT, date_effective TEXT, period_start INTEGER,
  period_end INTEGER, validity TEXT, relevance TEXT, relevance_evidence TEXT,
  ai_hits INTEGER, ai_forms TEXT, domains TEXT, adjacent_field TEXT, parent_doc_id TEXT,
  source_url TEXT, source_type TEXT, retrieved_at TEXT, route TEXT, file_format TEXT,
  sha256 TEXT, pages INTEGER, chars INTEGER, ocr INTEGER DEFAULT 0, completeness TEXT,
  dup_group TEXT, version_of TEXT, prehistory INTEGER DEFAULT 0, status TEXT,
  agent_id TEXT, checker TEXT, conflicts TEXT, note TEXT);
CREATE TABLE doc_agency (doc_id TEXT REFERENCES document, agency_name TEXT, seq INTEGER,
  is_lead INTEGER, PRIMARY KEY (doc_id, seq));
CREATE TABLE source (source_id TEXT PRIMARY KEY, doc_id TEXT REFERENCES document,
  source_type TEXT, url TEXT, retrieved_at TEXT, is_primary INTEGER, note TEXT);
CREATE TABLE file (file_id TEXT PRIMARY KEY, doc_id TEXT REFERENCES document, role TEXT,
  path TEXT, orig_name TEXT, format TEXT, sha256 TEXT UNIQUE, pages INTEGER, bytes INTEGER);
CREATE TABLE relation (rel_id TEXT PRIMARY KEY, from_doc TEXT REFERENCES document,
  to_doc TEXT, rel_type TEXT, evidence TEXT, found_by TEXT, checked INTEGER DEFAULT 0);
CREATE TABLE chunk (chunk_id TEXT PRIMARY KEY, doc_id TEXT REFERENCES document,
  seq INTEGER, path TEXT, text TEXT, chars INTEGER, k1_hit INTEGER);
CREATE TABLE clue (clue_id TEXT PRIMARY KEY, unit_id TEXT, clue_type TEXT, title TEXT,
  url TEXT, mentioned_title TEXT, found INTEGER, doc_id TEXT, note TEXT);
CREATE TABLE qc_sample (sample_id TEXT PRIMARY KEY, batch_id TEXT, sample_type TEXT,
  target_id TEXT, seed INTEGER, assigned_to TEXT, status TEXT);
CREATE TABLE qc_result (sample_id TEXT REFERENCES qc_sample, field TEXT, db_value TEXT,
  checked_value TEXT, result TEXT, error_type TEXT, basis TEXT, checker TEXT,
  checked_at TEXT, written_back INTEGER DEFAULT 0);
CREATE TABLE issue (issue_id TEXT PRIMARY KEY, raised_at TEXT, raised_by TEXT, target TEXT,
  issue_type TEXT, severity TEXT, description TEXT, resolution TEXT, owner TEXT,
  status TEXT, closed_at TEXT);
CREATE INDEX ix_doc_unit ON document(unit_id);
CREATE INDEX ix_doc_rel ON document(relevance, doc_class);
CREATE INDEX ix_log_unit ON search_log(unit_id);
