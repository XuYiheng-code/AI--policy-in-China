# 数据说明

目前有中央层（L1，快照 2026-11-15 02:31）和十个省级单元（L2：浙江、江苏、山东为 11-16 第二轮，湖南 11-16，上海、安徽 11-23，福建 11-23 第二轮，江西 11-24 第二轮，陕西 11-24，广东 11-26）的数据。各省现状说明见 `docs/reports/`。**全部为智能体与脚本初判，尚未人工核验**，采集也没有完成，详见 [中央层运行报告](../docs/reports/central_report_20261115.pdf) 、[浙江省现状说明](../docs/reports/zhejiang_report_20261116.pdf) 和 [江苏省现状说明](../docs/reports/jiangsu_report_20261116.pdf)。

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

## data/provincial/zhejiang/（第二轮，2026-11-16）

| 文件 | 行数 | 内容 |
|---|---:|---|
| `policies.csv` | 397 | **独立政策清单**（A 60、B 337），按 Codex 11-16 政策主记录分组；`date_basis`、`date_confidence` 说明日期来源。分析时优先用这张表 |
| `source_records.csv` | 559 | 全部来源记录（标准库 document 表），另加 `policy_id`、`archive_dir` |
| `sources.csv` | 665 | 来源网址与主来源标记 |
| `search_log.csv` | 3,187 | 检索日志（标准库 search_log 表） |
| `agency_coverage.csv` | 56 | 机关覆盖（R2 日志数、方式、来源记录数） |
| `route_status.csv` | 7 | R1—R7 状态 |
| `retrieval_gaps.csv` | 588 | 已入库来源逐项缺什么（不含北大法宝题录） |
| `manual_download_urls.csv` | 356 | 被拦截、需要人工下载的 URL 与拦截方式 |
| `qc_b_level_review.csv` | 200 | B 级口径复核：原判、复判、逐字引文、位置、理由 |
| `qc_pending_adjudication.csv` | 58 | B/C 边界待裁决清单（最后一列留给人工填写） |
| `qc_duplicate_review.csv`、`qc_date_supplement.csv` | 11、31 | 第一轮重复与日期核查（已写回标准库） |
| `followup_formal_versions.csv` | 5 | 征求意见稿正式版补查与新线索 |
| `doc_id_changes.csv` | 749 | 新旧编号对照（第二轮 99 份按网站发布日期改号） |
| `texts/{doc_id}.txt` | 559 | 清洗后的正文 |

## data/provincial/jiangsu/（第二轮，2026-11-16）

| 文件 | 行数 | 内容 |
|---|---:|---|
| `policies.csv` | 199 | **独立政策清单**（A 63、B 136）；《数字经济促进条例》2022 原版与 2025 修正版分列 |
| `source_records.csv` | 207 | 全部登记记录，另加 `policy_id`、`archive_dir` |
| `sources.csv` | 248 | 记录与来源 URL 的对应 |
| `search_log.csv` | 1,984 | 检索日志（含 757 条外部查询：影子清单、法宝未定位题名、线索包署名反查） |
| `agency_coverage.csv` | 45 | 机关、R2 日志数、R2 结果 |
| `route_status.csv` | 7 | R1—R7 状态 |
| `zhejiang_shadow_check.csv` | 459 | 浙江影子清单逐条结果（找到同类 24、被拦截 435） |
| `manual_sites.csv`、`portal_terms_manual.csv`、`gazette_384_issues_manual.csv` | 41、31、384 | 需人工处理的站点、门户未执行检索词、待人工翻阅的公报期次 |
| `clue_packages_review.csv` | 86 | 86 个线索包的本轮处置（43 个已入库或并入，43 个未编号） |
| `pkulaw_title_status_summary.csv` | 5 | 北大法宝 1,155 条题录处置状态汇总（题录本身不公开） |
| `retrieval_gaps.csv` | 10 | 登记来源待补原件 |
| `qc_duplicate_review.csv`、`qc_date_supplement.csv` | 1、2 | 版本关系与日期补充 |
| `doc_id_changes.csv` | 16 | 编号变更对照 |
| `texts/{doc_id}.txt` | 207 | 正文 |

## 其他省级单元（2026-11-23 导出）

上海、安徽、福建、江西、山东、湖南、广东、陕西用同一套文件，由各省桌面阅读版和采集底稿导出：

| 省份 | 文件夹 | 独立政策 | 来源记录 | 检索日志 | 正文 |
|---|---|---:|---:|---:|---:|
| 上海 | `provincial/shanghai/` | 278 | 281 | 2608 | 281 |
| 安徽 | `provincial/anhui/` | 320 | 342 | 1462 | 342 |
| 福建 | `provincial/fujian/` | 471 | 678 | 4459 | 665 |
| 江西 | `provincial/jiangxi/` | 312 | 479 | 1806 | 479 |
| 山东 | `provincial/shandong/` | 254 | 269 | — | 299 |
| 湖南 | `provincial/hunan/` | 370 | 370 | 5926 | 370 |
| 广东 | `provincial/guangdong/` | 323 | 477（政策清单对应 447） | 2436 | 447 |
| 陕西 | `provincial/shaanxi/` | 166 | 1366（政策来源 223） | 3279 | 223 |

| 文件 | 内容 |
|---|---|
| `policies.csv` | **独立政策清单**，一行一份：`policy_id`、`title`、`issuers`、`date`（`date_type` 发布/成文/通过，`date_basis` 依据）、`relevance`、`doc_class`、`policy_form`、`completeness`、`source_doc_ids`（并入的来源记录）、`ai_evidence_excerpt` |
| `source_records.csv` | 全部登记记录（底稿字段原样），另加 `policy_id`、`archive_dir`（原件包内路径）；山东为阅读版来源对照表 |
| `route_status.csv` | R1—R7 检索状态与卡点 |
| `search_log.csv` | 检索日志，含 0 命中（山东底稿未单列，暂缺） |
| `agency_coverage.csv` | 机关、R2 日志数、登记记录数 |
| `qc_duplicate_review.csv`、`qc_date_supplement.csv` | 执行方的去重结论与日期补充 |
| `qc_fulltext_dedup.csv`、`qc_reading_dates.csv`、`qc_similar_pairs.csv` | Claude 阅读层的全文查重补充、日期补充或修正、内容相近但分别计数的文件对（有则提供） |
| `texts/{doc_id}.txt` | 全部来源记录的正文 |

上海的 9 部地方性法规在人大网站上的发布日期都是 2025-08-05（网站统一上线日），`policies.csv` 已改用通过日期，`source_records.csv` 保持底稿原样。

## 怎么读

- **来源记录不等于政策份数。** 同一文件在国务院政策库、部委官网各有一份时记两条。`policies.csv` 只合并了已确认的 27 组同文，没发现的重复还在里面。
- **主库与辅库分开计数。** `doc_class` 为 `主库`、`主库-实施类`、`主库-转发` 的是研究分析的分母；`辅库-*`、`线索库`、`排除` 不计入政策数量。
- **相关性等级**：A 主题型、B 专项型、C 提及型、X 不相关、待定。定义见 [`rules.json`](../rules.json) 的 `relevance` 一节。
- **日期**：`date_written` 是成文日期；网站发布日期另列，不能当作政策首次发布日期。
- **0 条登记不等于 0 份政策**：某机关没有记录，只说明还没找到。
- **浙江的日期**：`policies.csv` 的 `date` 优先取网站发布日期，其次成文日期，都缺时用 11-15 补充的日期；`date_confidence` 为“低”的只说明不晚于该年。`source_records.csv` 里的日期字段保持底稿原样。

## 不在这里的东西

- 原件（官网 HTML、PDF、Word、WPS 及附件）和网页打印快照：体积约 790 MB，不放进 Git 历史，作为附件发布在 [Release `data-central-20261115`](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-central-20261115)。解压后按 `central/{检索单元}/{doc_id}/` 查找，包内 `MANIFEST.csv` 列出每个文件的 SHA-256。
- 浙江省原件（第二轮编号）：发布在 [Release `data-zhejiang-20261116`](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-zhejiang-20261116)；第一轮的 `data-zhejiang-20261115` 按旧编号保留。解压后主库/辅库来源在 `zhejiang/originals/{doc_id}/`，线索库和独立线索包在 `zhejiang/clues/`，每个文件夹的 `meta.json` 记录来源 URL、哈希、引文和初读结论；包内 `MANIFEST.csv` 列出每个文件的 SHA-256。
- 江苏省原件（第二轮）：发布在 [Release `data-jiangsu-20261116`](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-jiangsu-20261116)；主库来源在 `jiangsu/originals/{doc_id}/`，未编号线索包在 `jiangsu/clues/`；本机路径已改为相对路径。
- 上海市原件：发布在 [Release `data-shanghai-20261123`](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-shanghai-20261123)；登记记录原件在 `shanghai/originals/{doc_id}/`，线索材料在 `shanghai/clues/`，待核补件在 `shanghai/pending_supplements/`；本机路径已删除，包内 `MANIFEST.csv` 列出 SHA-256。
- 安徽省原件：发布在 [Release `data-anhui-20261123`](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-anhui-20261123)；登记记录原件在 `anhui/originals/{doc_id}/`，线索材料在 `anhui/clues/`；本机路径已删除，包内 `MANIFEST.csv` 列出 SHA-256。
- 福建省原件（第二轮）：发布在 [Release `data-fujian-20261123-r2`](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-fujian-20261123-r2)，第一轮的 `data-fujian-20261123` 保留；登记记录原件在 `fujian/originals/{doc_id}/`，线索材料在 `fujian/clues/`；本机路径已删除，包内 `MANIFEST.csv` 列出 SHA-256。
- 江西省原件（第二轮）：发布在 [Release `data-jiangxi-20261124`](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-jiangxi-20261124)；登记记录原件在 `jiangxi/originals/{doc_id}/`，候选与线索材料（含第二轮 146 个补文包 `R2-SOURCE-*`）在 `jiangxi/clues/`；仓库 `texts/` 只放 479 条登记记录的正文，候选正文在原件包里；本机路径已删除，包内 `MANIFEST.csv` 列出 SHA-256。
- 山东省原件：发布在 [Release `data-shandong-20261123`](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-shandong-20261123)；登记记录原件在 `shandong/originals/{doc_id}/`，线索材料在 `shandong/clues/`；本机路径已删除，包内 `MANIFEST.csv` 列出 SHA-256。
- 湖南省原件：发布在 [Release `data-hunan-20261123`](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-hunan-20261123)；登记记录原件在 `hunan/originals/{doc_id}/`，线索材料在 `hunan/clues/`；本机路径已删除，包内 `MANIFEST.csv` 列出 SHA-256。
- 广东省原件：发布在 [Release `data-guangdong-20261126`](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-guangdong-20261126)；`guangdong/originals/{doc_id}/` 为政策清单对应的 447 条来源；待定、辅库来源只在 `source_records.csv` 保留记录；一份 304 MB 的申报客户端安装包（P440000-2025-0043 附件）不是政策文本，未放入；本机路径已删除，包内 `MANIFEST.csv` 列出 SHA-256。
- 陕西省原件：发布在 [Release `data-shaanxi-20261125`](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-shaanxi-20261125)；`shaanxi/originals/{doc_id}/` 只含 223 条政策来源。登记表另有 1,101 条线索（多为媒体新闻），只在 `source_records.csv` 保留题录，正文和网页不公开；本机路径已删除，包内 `MANIFEST.csv` 列出 SHA-256。
- 检索候选题录：其中大部分来自北大法宝检索结果，不公开转载。
- 问题单和工作日志：内部过程记录，只公开汇总数字。
