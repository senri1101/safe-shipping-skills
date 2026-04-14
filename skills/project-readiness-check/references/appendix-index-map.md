# Appendix Index Map

これは読み物ではなく、AI に質問を投げるための索引です。

このファイルは、元記事の付録にあった A-M / A-1〜M-2 の観点を、repo 内で見失わないための coverage map です。
まずこの索引を眺め、関係がありそうな章を選び、次に `deep-dive-index.md` の質問へ進みます。

## 使い方

1. 自分の案件に関係しそうな章だけ選ぶ
2. 知らない用語や気になる観点を見つけたら、AI に「初心者にもわかるように教えて」と聞く
3. 実際のレビューでは `deep-dive-index.md` の質問を使う
4. すべてを毎回使わない。今日必要な 2〜3 項目から始める

## 設計レビューで見ている観点

### A. アーキテクチャ設計

#### A-1. アーキテクチャスタイル
- キーワード: レイヤードアーキテクチャ、ヘキサゴナル、オニオン、クリーンアーキテクチャ、マイクロサービス、モノリス、モジュラーモノリス、EDA、CQRS、イベントソーシング、BFF、サーバーレス
- AI への聞き方: この案件の規模と変更頻度なら、どのアーキテクチャスタイルが妥当か。過剰設計や不足は何か。

#### A-2. ドメインモデリング
- キーワード: DDD、境界づけられたコンテキスト、ユビキタス言語、エンティティ、値オブジェクト、集約、ドメインイベント、戦略的設計、戦術的設計、コンテキストマップ
- AI への聞き方: このドメインの中心概念、不変条件、境界は何か。集約や境界をどう切るべきか。

#### A-3. モジュール分割・依存関係
- キーワード: 高凝集・低結合、依存性逆転、循環依存の排除、REP、CCP、CRP、ADP、SDP、SAP、依存方向の統制、安定度と抽象度のバランス
- AI への聞き方: モジュールの責務分割は妥当か。依存方向や変更波及のリスクはどこか。

### B. データとインターフェース

#### B-1. データモデリング
- キーワード: 正規化と非正規化、ER モデリング、スタースキーマ、スノーフレークスキーマ、イミュータブルデータモデル、Event Sourcing による履歴保持、Single Source of Truth
- AI への聞き方: データ構造は将来変更に耐えるか。履歴、集計、検索、更新のトレードオフは何か。

#### B-2. API 設計
- キーワード: REST 原則、リソース指向設計、GraphQL、REST、gRPC、バージョニング、ページネーション、HATEOAS、OpenAPI / Swagger、Idempotency Key、RFC 7807 Problem Details
- AI への聞き方: この API 契約に不足はあるか。エラー形式、ページネーション、冪等性、バージョニングはどう設計すべきか。

#### B-3. 整合性・トランザクション
- キーワード: トランザクション境界、ACID、主キー、外部キー、ユニーク、CHECK、楽観ロック、悲観ロック、分散トランザクション、Saga、結果整合性、冪等性、Outbox、グレースフルシャットダウン
- AI への聞き方: 途中失敗時に何が壊れるか。二重実行、部分成功、分散整合性をどう扱うか。

#### B-4. 非同期処理
- キーワード: At-least-once、At-most-once、Exactly-once、DLQ、idempotency key、Outbox、優先度分離、フェアシェア、Visibility Timeout、Pub/Sub、メッセージキュー
- AI への聞き方: キュー処理の重複、再送、失敗隔離、優先度制御をどう設計すべきか。

#### B-5. キャッシュ
- キーワード: Strong / Eventual Consistency、cache-aside、write-through、write-back、Thundering Herd、TTL jitter、ホットキー、CDN エッジキャッシュ、マルチレイヤーキャッシュ
- AI への聞き方: キャッシュが古いと何が壊れるか。無効化と一貫性の責任分担はどうするか。

### C. UX 設計

#### C-1. ユーザーリサーチ
- キーワード: ペルソナ、カスタマージャーニーマップ、ユーザーインタビュー、エスノグラフィ、JTBD、メンタルモデル、ユーザビリティテスト、A/B テスト、定量調査、定性調査
- AI への聞き方: このプロダクトで最も困る利用者は誰か。仮説をどう検証すべきか。

#### C-2. 情報設計
- キーワード: サイトマップ、カードソーティング、ナビゲーション設計、パンくずリスト、ファセット検索、情報の階層と粒度、メンタルモデルとの整合
- AI への聞き方: 情報の並びは利用者の期待に合っているか。迷子になる箇所はどこか。

#### C-3. インタラクション設計
- キーワード: ユーザーフロー、タスクフロー、ワイヤーフレーム、低忠実度 / 高忠実度プロトタイプ、マイクロインタラクション、即時フィードバック、エラー防止、エラーリカバリー、Undo / Redo、オンボーディング、Empty State
- AI への聞き方: 完了、失敗、再試行、空状態、長時間処理の導線は十分か。

#### C-4. UX 原則・ヒューリスティクス
- キーワード: ニールセンの 10 ヒューリスティクス、ドナルド・ノーマン、アフォーダンス、シグニファイア、認知負荷、ヒックの法則、フィッツの法則、ミラーの法則、ヤコブの法則、ピーク・エンドの法則、ゲシュタルト原則
- AI への聞き方: この画面は認知負荷を上げていないか。利用者の予測を裏切っていないか。

#### C-5. アクセシビリティ
- キーワード: WCAG、WAI-ARIA、インクルーシブデザイン、ユニバーサルデザイン、スクリーンリーダー、キーボード操作、色覚多様性、認知アクセシビリティ
- AI への聞き方: 主要フローは支援技術やキーボード操作で完走できるか。

#### C-6. UX メトリクス
- キーワード: HEART、NPS、CSAT、SUS、タスク成功率、離脱率、Time on Task
- AI への聞き方: 成功と失敗を何で測るべきか。計測可能なイベント設計は何か。

### D. 非機能・運用

#### D-1. スケーラビリティ
- キーワード: 水平スケーリング、垂直スケーリング、ステートレス設計、シャーディング、レプリケーション、CAP、PACELC、ロードバランシング
- AI への聞き方: 想定負荷に対するボトルネックは何か。スケール方法は妥当か。

#### D-2. 可用性・レジリエンス
- キーワード: SPOF、サーキットブレーカー、バルクヘッド、指数バックオフ、リトライ、カナリアリリース、Blue-Green、フィーチャーフラグ、ヘルスチェック、自動復旧、カオスエンジニアリング、RTO、RPO
- AI への聞き方: 依存先障害や部分障害が起きたとき、どう degrade するか。

#### D-3. 可観測性
- キーワード: ログ、メトリクス、トレース、OpenTelemetry、構造化ログ、SLI、SLO、SLA、ゴールデンシグナル、アラート疲れ
- AI への聞き方: 障害時に原因を追えるか。アラートは埋もれないか。

#### D-4. 環境・インフラ設計
- キーワード: 開発 / ステージング / 本番分離、Terraform、Pulumi、CloudFormation、12 Factor App、Kubernetes、GitOps、サービスメッシュ
- AI への聞き方: 環境差分や手作業依存はどこか。再現可能なインフラになっているか。

#### D-5. データマイグレーション
- キーワード: expand-migrate-contract、冪等なマイグレーション、ロールバック戦略、データ整合性検証、段階的移行、メンテナンスウィンドウ、Zero-downtime deployment
- AI への聞き方: スキーマ変更とデータ移行の安全手順は何か。止めるべき場面はどこか。

### E. セキュリティ設計

#### E-1. セキュリティ原則
- キーワード: Defense in Depth、Assume Breach、Zero Trust、Least Privilege、Deny by Default、Audit Trail
- AI への聞き方: 守るべき資産、攻撃面、止血点をどう定義するか。

#### E-2. データ保護・マルチテナント
- キーワード: データ分類、機密 / 内部 / 公開、テナント隔離、AWS Well-Architected、Azure Security Benchmark
- AI への聞き方: データ分類とテナント境界をどこで担保するか。

#### E-3. LLM セキュリティ
- キーワード: 直接 / 間接プロンプトインジェクション、ツール汚染、過剰なエージェント権限、通信経路、データ保持、学習利用、オプトアウト、信頼境界、OWASP LLM Top 10
- AI への聞き方: LLM の入出力経路、保持、実行境界、権限境界にどんなリスクがあるか。

## コードレビューで見ている観点

### F. UI 設計・フロントエンド

#### F-1. ビジュアルデザイン原則
- キーワード: タイポグラフィ、カラー理論、コントラスト比、余白、密度、グリッド、視覚的階層、CRAP 原則、スキューモーフィズム、フラットデザイン、ニューモーフィズム、Material Design、HIG、Fluent
- AI への聞き方: 画面の視覚的優先順位と一貫性は適切か。

#### F-2. デザインシステム
- キーワード: デザイントークン、アトミックデザイン、Storybook、Figma、BEM、SMACSS、ブランドガイドライン、デザインツール連携
- AI への聞き方: 既存デザインシステムとの整合と再利用粒度は妥当か。

#### F-3. コンポーネント設計
- キーワード: Presentational / Container、Compound Component、Render Props、HOC、Controlled / Uncontrolled、Composition vs Configuration、Slot / Children、Props drilling、Context、State 管理
- AI への聞き方: コンポーネントの責務や契約は読みやすく保守しやすいか。

#### F-4. スタイリング
- キーワード: CSS Modules、CSS-in-JS、Tailwind CSS、BEM、SMACSS、OOCSS、FLOCSS、CSS Variables、レスポンシブ、モバイルファースト、Container Queries、ダークモード
- AI への聞き方: スタイリング方針は混線していないか。トークン化できる値は何か。

#### F-5. 状態管理
- キーワード: ローカル状態、グローバル状態、Redux、Zustand、Jotai、Recoil、React Context、TanStack Query、SWR、React Hook Form、Formik、URL 状態、Optimistic Update
- AI への聞き方: 状態の責務分離、二重保持、再取得整合性に問題はないか。

#### F-6. フロントエンドパフォーマンス
- キーワード: Core Web Vitals、LCP、FID / INP、CLS、Code Splitting、Lazy Loading、Tree Shaking、画像最適化、Virtual Scrolling、React.memo、useMemo、useCallback、SSR、SSG、ISR、CSR
- AI への聞き方: 体感速度と実測値を悪化させる箇所は何か。

#### F-7. アクセシビリティ実装
- キーワード: セマンティック HTML、ARIA、フォーカス管理、キーボードナビゲーション、スクリーンリーダーテスト、コントラスト比、フォームラベル、aria-live
- AI への聞き方: 実装レベルでのアクセシビリティ欠落はどこか。

#### F-8. アニメーション・インタラクション
- キーワード: CSS Transitions、CSS Animations、Framer Motion、GSAP、イージング、transform、opacity、prefers-reduced-motion、スケルトンスクリーン、ローディング表現
- AI への聞き方: 動きは意味を持っているか。性能とアクセシビリティを壊していないか。

### G. 設計原則とパターン

#### G-1. 設計原則
- キーワード: SOLID、SRP、OCP、LSP、ISP、DIP、DRY、KISS、YAGNI、関心の分離、最小驚き、Tell, Don't Ask、Law of Demeter、CQS、Composition over Inheritance、Fail Fast
- AI への聞き方: この責務分割は原則に照らして妥当か。単純化できる箇所はどこか。

#### G-2. デザインパターン
- キーワード: Factory Method、Abstract Factory、Builder、Singleton、Prototype、Adapter、Bridge、Composite、Decorator、Facade、Flyweight、Proxy、Chain of Responsibility、Command、Iterator、Mediator、Observer、State、Strategy、Template Method、Visitor
- AI への聞き方: パターン適用に意味があるか。むしろ複雑化していないか。

#### G-3. エンタープライズパターン
- キーワード: Repository、Unit of Work、Data Mapper、Active Record、Service Layer、Domain Model、Transaction Script、Specification、Null Object
- AI への聞き方: ドメインと永続化とサービス層の境界は妥当か。

### H. コード品質

#### H-1. クリーンコード
- キーワード: 意味のある命名、単一責務関数、少ない引数、副作用の最小化、「なぜ」を書くコメント、マジックナンバー排除、早期リターン、ブール引数排除
- AI への聞き方: 読んだ瞬間に意図がわかるか。複雑さを増やす臭いは何か。

#### H-2. リファクタリング
- キーワード: Code Smell、長すぎるメソッド、巨大クラス、Feature Envy、Data Clumps、Shotgun Surgery、God Class、Primitive Obsession、Extract Method、Extract Class、変数のインライン化 / 導入、ポリモーフィズム、ガード節
- AI への聞き方: 今直すべき臭いは何か。後回しでよいものは何か。

#### H-3. 型設計・契約
- キーワード: 型駆動設計、Make Illegal States Unrepresentable、値オブジェクト、Null 安全、Immutability、Design by Contract、Parse, don't validate
- AI への聞き方: 型と契約で防げる不正状態は何か。

#### H-4. 関数型プログラミングの考え方
- キーワード: 純粋関数、参照透過性、副作用の分離、高階関数、イミュータブルデータ構造、map / filter / reduce、Option、Either、Result
- AI への聞き方: 副作用を境界に寄せられるか。変換と I/O を分離できるか。

#### H-5. エラーハンドリング
- キーワード: 例外 vs Result、Checked / Unchecked Exception、例外握りつぶし禁止、早期リターン、Fail Fast、回復可能エラー、回復不能エラー、指数バックオフ with jitter、リトライ対象の判定
- AI への聞き方: このエラー処理は回復戦略を持っているか。誤ったリトライをしていないか。

### I. テスト

#### I-1. テスト戦略・哲学
- キーワード: テストピラミッド、テスティングトロフィー、テストダイヤモンド、テストハニカム、TDD、Red-Green-Refactor、Arrange-Act-Assert、Given-When-Then、BDD、カバレッジの罠、Flaky 対策、モックの使いすぎ問題
- AI への聞き方: どこを自動化し、どこを人が見るべきか。戦略の偏りはないか。

#### I-2. テストの種類（機能）
- キーワード: ユニットテスト、統合テスト、E2E テスト、コンポーネントテスト、インタラクションテスト、スナップショット、プロパティベーステスト、ミューテーションテスト、スモークテスト、回帰テスト、受け入れテスト、探索的テスト
- AI への聞き方: ハッピーパス以外に何を自動化すべきか。人が見るべき重要フローはどれか。

#### I-3. テストの種類（UI・ビジュアル）
- キーワード: Visual Regression、axe-core、Lighthouse、pa11y、クロスブラウザ、レスポンシブ、スクリーンショットテスト
- AI への聞き方: 画面崩れやアクセシビリティ退行をどう検知するか。

#### I-4. テストの種類（契約・境界）
- キーワード: Contract Test、Consumer-Driven Contract、API テスト、Postman、REST Assured、supertest、JSON Schema、OpenAPI 検証
- AI への聞き方: Provider / Consumer のズレやスキーマ逸脱をどう止めるか。

#### I-5. テストの種類（非機能）
- キーワード: Load Test、Stress Test、Spike Test、Soak Test、Performance Test、k6、JMeter、Gatling、Locust、SAST、DAST、IAST、ペネトレーションテスト、カオステスト、ファジング
- AI への聞き方: この案件で必要最低限の非機能テストは何か。

#### I-6. テストダブル
- キーワード: Dummy、Stub、Spy、Mock、Fake、Test Double の使い分け
- AI への聞き方: 境界だけを差し替えているか。実装詳細を固定しすぎていないか。

#### I-7. テスト設計技法
- キーワード: 同値分割、境界値分析、デシジョンテーブル、状態遷移テスト、ペアワイズテスト
- AI への聞き方: 組み合わせ爆発や境界条件をどう整理してケース化するか。

### J. 実装技術

#### J-1. 並行処理・マルチスレッド
- キーワード: スレッドセーフティ、Immutable、安全なコレクション、レースコンディション、TOCTOU、デッドロック対策、ExecutorService、スレッドプール上限、async/await、Reactive Programming
- AI への聞き方: 同時実行、再入、ロック競合、再送で壊れる箇所はどこか。

#### J-2. パフォーマンス
- キーワード: N+1、インデックス設計、EXPLAIN、Big O、メモリリーク、プロファイリング、Premature Optimization、キャッシュ戦略、バッチ処理、ストリーム処理、コネクションプール、スロークエリログ、SELECT * 回避、ページネーション性能、非同期 / 並列活用、バックプレッシャー、コールドスタート、データ転送量最適化、gzip、Brotli、Keep-Alive、CDN
- AI への聞き方: 今の実装で性能事故になる箇所はどこか。どこから測るべきか。

### K. プロセスとドキュメント

#### K-1. ドキュメンテーション
- キーワード: ADR、README、API ドキュメント、OpenAPI、JSDoc、Javadoc、C4、UML、シーケンス図、自己文書化コード
- AI への聞き方: 将来の保守者に何を残すべきか。設計理由の記録は十分か。

#### K-2. バージョン管理・開発プロセス
- キーワード: コミット粒度、Conventional Commits、Git Flow、GitHub Flow、Trunk-Based Development、PR レビュー作法、SemVer、CI/CD、フィーチャーフラグ
- AI への聞き方: 変更管理とリリース管理はチーム運用に耐えるか。

### L. セキュアコーディング

#### L-1. 脅威モデリング
- キーワード: STRIDE、NIST 攻撃者分類、Attack Surface Analysis、Trust Boundary
- AI への聞き方: 攻撃者、資産、入口、信頼境界をどう整理するか。

#### L-2. 通信の保護
- キーワード: TLS 1.2 以上、弱い暗号スイート無効化、証明書ピンニング、ホスト名検証、HSTS、CSP、X-Frame-Options、frame-ancestors、X-Content-Type-Options、Referrer-Policy、CORS
- AI への聞き方: 通信経路の保護で漏れている設定は何か。

#### L-3. 暗号化・機密情報
- キーワード: CRYPTREC、CSPRNG、bcrypt、Argon2、scrypt、ソルト、ストレッチング、IV、KMS、HSM、Vault、Secrets Manager、鍵ローテーション
- AI への聞き方: パスワード、鍵、秘密、暗号方式の扱いで危険な箇所はどこか。

#### L-4. 認証・セッション
- キーワード: Authorization Code Flow + PKCE、OIDC state / nonce / redirect_uri、アクセストークン回転、リフレッシュトークン回転、MFA、TOTP、WebAuthn、FIDO2、パスワードスプレー、Credential Stuffing、レート制限、アカウントロック、Secure / HttpOnly / SameSite、Session Fixation、JWT exp / jti
- AI への聞き方: 認証フローとセッション失効は安全か。必要な対策を省略していないか。

#### L-5. 認可・アクセス制御
- キーワード: サーバサイド権限検証、IDOR、テナント境界チェック、scope ベース権限管理、RBAC、ABAC、403 と 404 の使い分け
- AI への聞き方: 認証後の所有者確認とテナント境界検証はどこで担保するか。

#### L-6. 入力検証
- キーワード: ホワイトリスト、JSON Schema、OpenAPI、NULL バイト、制御文字、XXE、Billion Laughs、ファイルアップロード三点判定、Path Traversal、Zip Bomb、SVG サニタイズ、CSV Injection
- AI への聞き方: どの入力経路が危険か。境界検証の抜けはどこか。

#### L-7. インジェクション攻撃
- キーワード: SQL インジェクション、プリペアドステートメント、ORM の Raw クエリ、OS コマンドインジェクション、LDAP インジェクション、NoSQL インジェクション、SSTI、デシリアライズ攻撃
- AI への聞き方: 文字列連結やテンプレート評価の危険経路はどこか。

#### L-8. 出力エンコーディング
- キーワード: HTML / 属性 / JavaScript / URL / CSS の文脈別エスケープ、dangerouslySetInnerHTML、innerHTML、javascript:、data:、CRLF Injection、オープンリダイレクト
- AI への聞き方: 出力時の文脈別エスケープ漏れはどこか。

#### L-9. エラー処理（セキュリティ観点）
- キーワード: 本番でのスタックトレース非表示、一般化エラーメッセージ、機密情報をログに出さない
- AI への聞き方: エラー応答やログが攻撃者の地図になっていないか。

#### L-10. SSRF
- キーワード: ホワイトリスト URL 検証、DNS 解決後の IP 検証、CNAME チェーン、169.254.169.254 ブロック、メタデータサービス遮断、IMDSv2、DNS Rebinding、自動リダイレクト無効化
- AI への聞き方: URL を受け付ける機能が内部ネットワーク到達手段になっていないか。

#### L-11. 依存関係
- キーワード: lock ファイル、Dependabot、Snyk、Trivy、タイポスクワッティング、サプライチェーン攻撃、ライセンス互換性、EOL パッケージ、SBOM
- AI への聞き方: 依存パッケージの保守性、脆弱性、ライセンス、供給網リスクをどう点検するか。

### M. 参考書籍・フレームワーク

#### M-1. 設計・実装全般
- キーワード: Clean Architecture、Clean Code、リファクタリング、DDD、実装パターン、PoEAA、達人プログラマー、リーダブルコード
- AI への聞き方: 今回の判断を支える原則や参考文献は何か。

#### M-2. セキュリティ
- キーワード: OWASP Top 10、OWASP ASVS、OWASP Testing Guide、IPA 安全なウェブサイトの作り方、CERT Secure Coding Standards、CWE
- AI への聞き方: 今回のリスクレベルに対して、どの標準やガイドラインを最低ラインにすべきか。
