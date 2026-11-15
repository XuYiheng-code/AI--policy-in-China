# 数据说明

目前有中央层（L1，快照 2026-11-15 02:31）和浙江省（L2，快照 2026-11-15 17:15，当晚复核）两批数据。**全部为智能体与脚本初判，尚未人工核验**，采集也没有完成，详见 [中央层运行报告](../docs/reports/central_report_20261115.pdf) 和 [浙江省现状说明](../docs/reports/zhejiang_report_20261115.pdf)。

## data/central/

| 文件 | 行数 | 内容 |
|---|---:|---|
| `policies.csv` | 652 | **政策主记录**：A/B 级来源记录按已确认的同文组归并后的视图，一行一份政策。分析时优先用这张表 |
| `source_records.csv` | 818 | 全部来源记录，45 个字段（相关性、去向、领域、形式、效力层级、引文证据、完整性等） |
| `sources.csv` | 879 | 每条记录的原始来源网址和经核对的补充来源 |
| `government_reports.csv` | 8 | 辅库：提到人工智能的政府工作报告 |
| `government_report_years.csv` | 19 | 政府工作报告逐年来源与版本核对 |
| `unit_progress.csv` | 66 | 66 个中央机关单元在 R1—R7 各检索路由上的进度 |
| `search_log.csv` | 5,609 | 每一次检索的日志，包括 0 命中 |
| `texts/{doc_id}.txt` | 818 | 清洗后的正文，文件名对应 `doc_id` |

文件均为 UTF-8（带 BOM），可直接用 Excel 打开。

## data/provincial/zhejiang/

| 文件 | 行数 | 内容 |
|---|---:|---|
| `policies.csv` | 459 | **独立政策清单**，一行一份。在 469 个同文组基础上，逐对比对正文又合并了 10 对来源不同的同一政策；`merged_groups` 列出被合并的组，`date_basis`、`date_confidence` 说明日期来源。分析时优先用这张表 |
| `source_records.csv` | 557 | 全部来源记录，字段同中央层；另加 `same_text_group`（同文组）、`policy_id`（所属独立政策）、`archive_dir`（原件在 Release 包里的位置） |
| `sources.csv` | 557 | 每条记录的来源网址、来源类型和完整性 |
| `agency_coverage.csv` | 56 | 省级机关与载体的部门网站检索次数、来源记录数和覆盖说明 |
| `route_status.csv` | 7 | R1—R7 各路由的检索次数与状态 |
| `search_log.csv` | 2,855 | 每一次检索的日志，包括 0 命中 |
| `retrieval_gaps.csv` | 588 | 已入库来源逐项缺什么（附件、正文图片等）及原因；一条记录可有多行 |
| `qc_duplicate_review.csv` | 11 | 疑似重复逐对核查结论（合并 10 对，保留 1 对） |
| `qc_date_supplement.csv` | 31 | 无日期政策的日期补充、依据与可信度 |
| `followup_formal_versions.csv` | 5 | 三份征求意见稿的正式版补查结果，以及补查中发现的 2 份新线索 |
| `texts/{doc_id}.txt` | 557 | 清洗后的正文 |

## 怎么读

- **来源记录不等于政策份数。** 同一文件在国务院政策库、部委官网各有一份时记两条。`policies.csv` 只合并了已确认的 27 组同文，没发现的重复还在里面。
- **主库与辅库分开计数。** `doc_class` 为 `主库`、`主库-实施类`、`主库-转发` 的是研究分析的分母；`辅库-*`、`线索库`、`排除` 不计入政策数量。
- **相关性等级**：A 主题型、B 专项型、C 提及型、X 不相关、待定。定义见 [`rules.json`](../rules.json) 的 `relevance` 一节。
- **日期**：`date_written` 是成文日期；网站发布日期另列，不能当作政策首次发布日期。
- **0 条登记不等于 0 份政策**：某机关没有记录，只说明还没找到。
- **浙江的日期**：`policies.csv` 的 `date` 优先取网站发布日期，其次成文日期，都缺时用 11-15 补充的日期；`date_confidence` 为“低”的只说明不晚于该年。`source_records.csv` 里的日期字段保持底稿原样。

## 不在这里的东西

- 原件（官网 HTML、PDF、Word、WPS 及附件）和网页打印快照：体积约 790 MB，不放进 Git 历史，作为附件发布在 [Release `data-central-20261115`](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-central-20261115)。解压后按 `central/{检索单元}/{doc_id}/` 查找，包内 `MANIFEST.csv` 列出每个文件的 SHA-256。
- 浙江省原件：压缩包约 336 MB（解压后约 520 MB、2,968 个文件），发布在 [Release `data-zhejiang-20261115`](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-zhejiang-20261115)。解压后主库/辅库来源在 `zhejiang/originals/{doc_id}/`，线索库和独立线索包在 `zhejiang/clues/`，每个文件夹的 `meta.json` 记录来源 URL、哈希、引文和初读结论；包内 `MANIFEST.csv` 列出每个文件的 SHA-256。
- 检索候选题录：其中大部分来自北大法宝检索结果，不公开转载。
- 问题单和工作日志：内部过程记录，只公开汇总数字。
