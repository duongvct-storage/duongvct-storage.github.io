---
title: Y4T2-Information Retrieval Ôn tập chi tiết
keywords: [ir, information retrieval, revise, exam]
date: 2026-06-02
theme: ir
description:
  Ôn tập Truy xuất thông tin - tổng hợp lý thuyết từ slide Chương I-VII
---

# Ôn tập Truy xuất thông tin (Information Retrieval)

**Môn học:** INT14158 - **Hình thức thi:** Code

**[Đề cương và slide](/pdfs/y4t2-information-retrieval/)**

---

## Phần 1: Chương I - Khái niệm cơ bản

### 1.1 Truy xuất thông tin là gì?

**IR (Information Retrieval)** là việc tìm kiếm các tài liệu **phi cấu trúc** (thường là văn bản) thỏa mãn một nhu cầu thông tin từ các bộ sưu tập lớn.

**Ví dụ:**
- Tìm kiếm trên web (phổ biến nhất)

- Tìm kiếm E-mail

- Tìm kiếm trên máy tính xách tay

- Cơ sở tri thức doanh nghiệp

- Truy xuất thông tin pháp lý

### 1.2 Mô hình tìm kiếm cổ điển

```
User task → Info need → Query → Search engine → Results
                              ↑                       |
                              |--- Query refinement --|
```

**Vấn đề:** Người dùng có thể hiểu sai nhu cầu hoặc diễn đạt truy vấn không chính xác.

### 1.3 Đánh giá tài liệu được truy xuất

| Khái niệm | Định nghĩa |
|-----------|-----------|
| **Precision (Độ chính xác)** | Tỷ lệ các tài liệu được truy xuất thực sự liên quan đến nhu cầu thông tin |
| **Recall (Độ phủ)** | Tỷ lệ các tài liệu liên quan có trong bộ sưu tập đã được truy xuất |

### 1.4 Ma trận hiện diện thuật ngữ–tài liệu (Term-document incidence matrix)

Mỗi thuật ngữ có một **vectơ nhị phân 0/1** biểu diễn sự xuất hiện của nó trong các tài liệu.

**Ví dụ:** Truy vấn "Brutus AND Caesar AND NOT Calpurnia"
- Lấy vectơ của Brutus, Caesar và vectơ bù của Calpurnia

- Thực hiện AND bitwise

**Vấn đề:** Với N = 1 triệu tài liệu, M = 500K thuật ngữ → ma trận 500K × 1M rất thưa thớt. Giải pháp: **Chỉ ghi lại các vị trí có số 1**.

### 1.5 Chỉ mục ngược (Inverted Index)

**Cấu trúc:**
- **Dictionary:** Lưu các thuật ngữ + tần suất + con trỏ tới postings

- **Postings list:** Danh sách các docID chứa thuật ngữ đó (sắp xếp tăng dần)

**Ví dụ:**
```
Brutus  →  1, 2, 4, 11, 31, 45, 173, 174
Caesar  →  1, 2, 4, 5, 6, 16, 57, 132
Calpurnia → 2, 31, 54, 101
```

**Tại sao cần sắp xếp docID?** Để thuật toán gộp (merge) chạy tuyến tính O(x + y).

**Phân tích độ phức tạp của các phép toán trên inverted index:**

| Phép toán | Độ phức tạp | Giải thích |
|-----------|------------|-----------|
| Lưu trữ (không nén) | O(N × L) | N tài liệu, L token/tài liệu |
| Xây dựng chỉ mục | O(T log T) | Sắp xếp T token (termID, docID) |
| AND (giao) | O(x + y) | Duyệt song song hai postings list |
| OR (hợp) | O(x + y) | Tương tự AND, không loại trùng |
| NOT (bù) | O(N) | Phải duyệt toàn bộ N docID nếu postings list rỗng |
| Phrase query | O(x × avg\_pos) | Merge ở mức vị trí, worst-case bằng tích độ dài |
| Proximity (/k) | O(x × y) | Kiểm tra cặp vị trí trong danh sách, có thể cắt tỉa |

Trong đó x, y là độ dài postings list; T = N × L là tổng số token.

### 1.6 Các bước xử lý văn bản ban đầu

1. **Tokenization (Tách từ):** Cắt chuỗi ký tự thành các token. Xử lý các trường hợp đặc biệt như "John's", "state-of-the-art".

2. **Normalization (Chuẩn hóa):** Đưa văn bản và từ trong truy vấn về cùng dạng. Ví dụ: U.S.A. = USA.

3. **Stemming (Rút gọn từ):** Khớp các dạng khác nhau của cùng gốc từ. Ví dụ: authorize, authorization.

4. **Stop words (Từ dừng):** Loại bỏ các từ xuất hiện rất nhiều. Ví dụ: the, a, to, of.

**Quy trình xây dựng chỉ mục:**
1. Tài liệu → Tokenizer → Token stream

2. Token stream → Linguistic modules → Modified tokens (chuẩn hóa, stemming)

3. Modified tokens → Indexer → Inverted index

**Chi tiết:**
- **Bước 1:** Tạo chuỗi các cặp (Token đã chỉnh sửa, docID).

- **Bước 2:** Sắp xếp danh sách theo thuật ngữ (alphabet) → theo docID. Đây là bước cốt lõi.

- **Bước 3:** Gộp trùng lặp (cùng term trong cùng doc). Tách thành Dictionary và Postings. Bổ sung tần suất.

### 1.7 Xử lý truy vấn AND

**Thuật toán gộp (Merge algorithm):**
- Duyệt qua hai postings list đồng thời, thời gian tuyến tính O(x + y).

- Postings đã sắp xếp theo docID.

- **Worst-case:** O(x + y) khi không có intersection nào — vẫn phải duyệt hết cả hai list.

- **Best-case:** O(min(x, y)) khi một list là tập con của list kia (ví dụ term xuất hiện trong mọi tài liệu chứa term kia).

- **Khi dùng NOT:** cần duyệt toàn bộ hợp các postings list hoặc toàn bộ N docID, độ phức tạp lên O(N) — đây là lý do NOT thường chậm.

**Đánh đổi: Sắp xếp postings vs không sắp xếp:**
- **Sắp xếp:** Merge O(x + y) — nhanh cho AND/OR, nhưng tốn thời gian sắp xếp khi build index.

- **Không sắp xếp:** Chèn posting mới O(1), nhưng merge chậm O(x × y) nếu không có chỉ mục phụ.

**Mã giả:**
```
p1 = đầu danh sách postings của term1
p2 = đầu danh sách postings của term2
while p1 ≠ nil và p2 ≠ nil:
    if docID(p1) = docID(p2):
        thêm docID vào kết quả
        p1 ← next(p1)
        p2 ← next(p2)
    else if docID(p1) < docID(p2):
        p1 ← next(p1)
    else:
        p2 ← next(p2)
```

### 1.8 Mô hình truy vấn Boolean

- Cho phép đặt câu truy vấn dưới dạng biểu thức Boolean (AND, OR, NOT).

- Mỗi tài liệu được xem như một tập hợp các từ.

- Tính chính xác: tài liệu thỏa mãn điều kiện hoặc không.

- Là mô hình đơn giản nhất để xây dựng hệ thống IR.

- Là công cụ truy xuất thương mại chủ yếu trong suốt 3 thập kỷ.

**Ví dụ WestLaw:**
- Dịch vụ tìm kiếm pháp lý thương mại lớn nhất.

- Hàng chục terabyte dữ liệu, ~700.000 người dùng.

- Dùng toán tử khoảng cách: `LIMIT! /3 STATUTE ACTION /S FEDERAL /2 TORT /3 CLAIM`
  - `/3` = trong phạm vi 3 từ, `/S` = trong cùng một câu.
- Lưu ý: DẤU CÁCH (SPACE) là phép OR, không phải AND!

### 1.9 Tối ưu truy vấn

**Nguyên tắc:** Xử lý theo thứ tự tần suất tăng dần. Bắt đầu với tập nhỏ nhất, sau đó thu hẹp dần.

**Ví dụ:** Query: `Brutus AND Calpurnia AND Caesar`
- Frequency: Brutus (nhiều), Caesar (nhiều), Calpurnia (ít)

- Tuần tự: Brutus (128) AND Caesar (100) → ~100, AND Calpurnia (4) → 4.

- Tối ưu: Calpurnia (4) AND Brutus (128) → 4, AND Caesar (100) → 4.

- **Tiết kiệm:** ~100 lần so sánh vs 4 + 4 = 8 lần.

**Phân tích độ phức tạp:**
- **Tuần tự (theo thứ tự viết):** O(x₁ + x₂ + ... + xₙ) trong đó x₁, x₂ lớn → tập trung gian lớn.

- **Tối ưu:** O(min(x₁, ..., xₙ) × n) — đầu vào tập đầu là nhỏ nhất, các phép AND sau thao tác trên tập đã thu nhỏ.

- **Khi có OR:** ước lượng size(OR) = min(N, Σdfᵢ). Nếu ước lượng sai → chọn thứ tự sai → chậm hơn.

**Tối ưu hóa tổng quát:**
- Với truy vấn có OR: ước lượng kích thước mỗi phép OR = tổng tần suất tài liệu.

- Xử lý theo thứ tự tăng dần của kích thước các phép OR.

| Tiêu chí | Tuần tự | Tối ưu |
|----------|---------|--------|
| Thứ tự xử lý | Theo thứ tự viết | Theo kích thước ước lượng |
| Kích thước tập trung gian | Lớn | Nhỏ |
| Số phép so sánh | Nhiều | Ít |
| Bộ nhớ | Tốn | Tiết kiệm |
| Khả năng mở rộng | Kém | Tốt |

### 1.10 Truy vấn cụm từ (Phrase Queries)

**Vấn đề:** Truy vấn "stanford university" — cần tài liệu có cụm từ này liền nhau, không phải rời rạc.

**Giải pháp 1: Chỉ mục hai từ (Biword indexes)**
- Lập chỉ mục cho mỗi cặp từ liên tiếp.

- "Friends, Romans, Countrymen" → biword: "friends romans", "romans countrymen".

- Cụm từ dài hơn: tách thành truy vấn Boolean. Ví dụ "stanford university palo alto" → "stanford university" AND "university palo" AND "palo alto".

- **Hạn chế:** Dương tính giả, chỉ mục phình to, không khả thi cho cụm dài.

**Giải pháp 2: Biword mở rộng**
- Gán nhãn từ loại (POS tagging): N = danh từ, X = mạo từ/giới từ.

- Gọi chuỗi NX*N là biword mở rộng.

- Ví dụ: "catcher in the rye" → N X X N → biword mở rộng: "catcher rye".

**Giải pháp 3: Chỉ mục vị trí (Positional indexes) — là giải pháp tiêu chuẩn**
- Lưu trữ vị trí xuất hiện của mỗi thuật ngữ trong tài liệu.

- Định dạng: `<term, số lượng tài liệu; doc1: vị_trí1, vị_trí2, ...; doc2: ...>`

- Xử lý truy vấn cụm từ: trộn đệ quy ở mức tài liệu, kiểm tra mối quan hệ vị trí (liền kề, đúng thứ tự).

**Kích thước chỉ mục vị trí:**
- Cần mục cho mỗi lần xuất hiện, không chỉ mỗi tài liệu.

- Lớn gấp 2-4 lần so với chỉ mục không vị trí.

- Chiếm khoảng 35-50% dung lượng văn bản gốc.

**Lược đồ kết hợp (Hybrid schemes):**
- Kết hợp biword + positional.

- Với cụm từ phổ biến ("Michael Jackson"): không cần merge positional.

### 1.11 Tìm kiếm theo độ gần (Proximity Search)

Toán tử `/k`: "nằm trong phạm vi k từ".
- Ví dụ: `LIMIT! /3 STATUTE /3 FEDERAL /2 TORT`

- Chỉ mục vị trí có thể xử lý, chỉ mục hai từ thì không.

### 1.12 Dữ liệu phi cấu trúc, có cấu trúc và bán cấu trúc

- **Có cấu trúc:** Dữ liệu trong database (có schema cố định).

- **Phi cấu trúc:** Văn bản tự do, không có schema.

- **Bán cấu trúc:** XML, HTML — có thẻ nhưng nội dung tự do.

- Dữ liệu phi cấu trúc chiếm phần lớn dung lượng và giá trị thị trường.

---

## Phần 2: Chương II - Xây dựng chỉ mục đảo cơ bản

### 2.1 Nhắc lại quy trình xây dựng chỉ mục

1. Tài liệu → Phân tích → Các cặp (Term, docID)

2. Sắp xếp theo Term → theo docID

3. Gộp trùng lặp → Dictionary + Postings

### 2.2 Tập dữ liệu Reuters RCV1

| Ký hiệu | Thống kê | Giá trị |
|---------|----------|---------|
| N | Số tài liệu | 800.000 |
| L | Token trung bình/tài liệu | 200 |
| M | Số thuật ngữ | 400.000 |
| | Byte/token (có khoảng trắng) | 6 |
| | Byte/token (không khoảng trắng) | 4.5 |
| | Byte/thuật ngữ | 7.5 |
| | Số posting (không vị trí) | 100.000.000 |

### 2.3 Kiến thức cơ bản về phần cứng

| Ký hiệu | Thống kê | Giá trị |
|---------|----------|---------|
| s | Thời gian seek đĩa TB | 5 ms |
| b | Thời gian truyền/byte | 0.02 μs |
| | Tốc độ xung nhịp CPU | 10⁹ s⁻¹ |
| p | Thời gian phép toán mức thấp | 0.01 μs |
| | RAM | Vài GB |
| | Đĩa | 1 TB+ |

**Nguyên tắc:**
- I/O đĩa dựa trên khối (8 KB - 256 KB).

- Truyền khối lớn nhanh hơn nhiều khối nhỏ (do seek).

- RAM nhanh hơn đĩa rất nhiều.

### 2.4 BSBI (Blocked Sort-Based Indexing)

**Ý tưởng:** Sắp xếp theo khối để giảm số lần truy cập đĩa.
- Với RCV1: 100 triệu bản ghi 8 byte = (termID, docID)

- Định nghĩa khối ≈ 10 triệu bản ghi → 10 khối

**Thuật toán:**
1. Thu thập postings cho từng khối.

2. Sắp xếp khối đó trong bộ nhớ (Quicksort).

3. Ghi khối đã sắp xếp ra đĩa.

4. Trộn các khối thành thứ tự sắp xếp hoàn chỉnh.

**Phân tích độ phức tạp BSBI:**
- **Sắp xếp mỗi khối (in-memory):** O(B log B) với B = số bản ghi/khối. Dùng Quicksort: kỳ vọng O(B log B), worst-case O(B²).

- **Số khối:** K = T / B (T = tổng số bản ghi).

- **Gộp các khối (multi-way merge):**
  - Với priority queue: mỗi lần lấy O(log K), tổng O(T log K).

  - Tổng cộng: O(T log B + T log K) = O(T log T).
- **I/O cost:** Đọc mỗi bản ghi 2 lần (1 lần từ raw, 1 lần khi merge) + ghi 1 lần → 3× T × record_size I/O.

- **Với RCV1:** T = 10⁸ records × 8 byte = 800 MB. Với B = 10⁷: K = 10, O(10⁸ log 10⁸) ≈ 2.6 tỷ phép so sánh.

**Gộp các khối:**
- **Binary merge:** 2-way merge, cây log₂K tầng. Mỗi tầng đọc/ghi toàn bộ T records → 2 × log₂K × I/O.

- **Multi-way merge:** K-way merge, chỉ 1 lần đọc và 1 lần ghi → tiết kiệm I/O hơn binary merge.

### 2.5 SPIMI (Single-pass in-memory indexing)

**Ý tưởng chính:**
1. Tạo từ điển riêng cho từng khối — không cần ánh xạ term–termID giữa các khối.

2. Không sắp xếp: thêm postings trực tiếp vào postings list khi xuất hiện.

**So sánh độ phức tạp BSBI vs SPIMI:**

| Tiêu chí | BSBI | SPIMI |
|----------|------|-------|
| Sắp xếp | Quicksort mỗi khối O(B log B) | Không sắp xếp |
| Cấu trúc | Dùng (termID, docID), cần ánh xạ term→termID toàn cục | Dùng từ điển riêng mỗi khối, không cần termID toàn cục |
| Bộ nhớ | Tốn (giữ dictionary toàn cục) | Tiết kiệm hơn (từ điển nhỏ theo khối) |
| Gộp kết quả | Merge các run đã sắp xếp | Tương tự BSBI |
| Độ phức tạp | O(T log T) | O(T) cho việc tạo khối + O(T log K) cho merge |
| Thực tế | Chậm hơn do overhead sắp xếp và dictionary toàn cục | Nhanh hơn (có thể nhanh gấp 2-3 lần) |

**Lưu ý:** SPIMI tuy không sắp xếp từng khối, nhưng postings list trong mỗi khối cần được sắp xếp theo docID để merge sau này. Việc này được thực hiện bằng cách chèn vào danh sách có sắp xếp (insertion) hoặc sắp xếp toàn bộ khi đủ kích thước.

### 2.6 Lập chỉ mục phân tán (Distributed indexing)

**Tại sao cần?** Với web scale, bắt buộc phải dùng cụm máy phân tán. Máy riêng lẻ dễ gặp lỗi.

**Cấu trúc:**
- **Master machine:** Điều phối công việc, được coi là "an toàn".

- **Parsers:** Đọc split, sinh (term, doc), ghi vào j phân vùng (vd: a-f, g-p, q-z) — Map phase.

- **Inverters:** Thu thập (term, doc) trong phân vùng, sắp xếp, ghi postings list — Reduce phase.

**MapReduce:**
- `map: input → list(k, v)`

- `reduce: (k, list(v)) → output`

- Với IR: `map: documents → list(termID, docID)`, `reduce: (termID, list(docID)) → postings list`

**Phân vùng chỉ mục:**
- **Phân vùng theo term (term-partitioned):** Mỗi máy xử lý khoảng term.

- **Phân vùng theo tài liệu (document-partitioned):** Mỗi máy xử lý khoảng tài liệu. Được dùng phổ biến hơn vì cân bằng tải tốt hơn.

### 2.7 Lập chỉ mục động (Dynamic indexing)

**Vấn đề:** Tài liệu mới xuất hiện, bị xóa, chỉnh sửa liên tục.

**Cách tiếp cận đơn giản:**
- Main index "lớn" + Auxiliary index "nhỏ".

- Khi truy vấn: tìm trên cả hai, gộp kết quả.

- Xóa: dùng invalidation bit-vector.

- Định kỳ: xây dựng lại (re-index) để gộp.

**Gộp theo logarit (Logarithmic merge):**
- Duy trì dãy chỉ mục với kích thước gấp đôi nhau.

- Chỉ mục nhỏ nhất Z₀ trong bộ nhớ, các chỉ mục lớn hơn I₀, I₁... trên đĩa.

- Khi Z₀ > n: ghi ra I₀, hoặc merge với I₀ hiện có → Z₁.

- Tiếp tục như phép cộng nhị phân.

**Phân tích độ phức tạp:**

| Chiến lược | Chi phí merge (amortized) | Chi phí query |
|------------|--------------------------|---------------|
| Main + Aux | O(T² / n) — mỗi posting bị merge O(T/n) lần | O(1) — chỉ 2 index |
| Logarithmic | O(T log(T/n)) — mỗi posting bị merge O(log(T/n)) lần | O(log(T/n)) — cần merge log index |

**Cụ thể:**
- **Main + Auxiliary:** Khi auxiliary đầy (n posting), merge toàn bộ vào main. Nếu T = 10⁸, n = 10⁶, mỗi posting bị merge 100 lần → O(10¹⁰).

- **Logarithmic:** Tối đa log₂(T/n) + 1 index. Mỗi posting di chuyển lên cấp cao hơn tối đa log₂(T/n) lần → O(T log(T/n)).

- **Ví dụ:** T = 10⁸, n = 10⁶ → log₂(100) ≈ 7 lần merge/posting. Tiết kiệm ~14 lần so với Main+Aux.

**Đánh đổi:**
- **Index nhiều hơn** → query chậm hơn (cần merge O(log(T/n)) kết quả).

- **Merge ít hơn** → hệ thống chịu tải nhẹ hơn khi cập nhật.

- Thích hợp cho ứng dụng cần cập nhật thường xuyên, query chấp nhận độ trễ nhỏ.

### 2.8 Earlybird (Tìm kiếm thời gian thực tại X/Twitter)

- Gồm nhiều index segments, mỗi segment tối đa 2²³ tweet.

- Mỗi posting là 32 bit: 24 bit cho tweet ID + 8 bit cho vị trí.

- Chỉ một segment được phép ghi (đủ nhỏ để trong bộ nhớ).

- Postings được duyệt ngược lại (ưu tiên tweet mới hơn).

---

## Phần 3: Chương III - Nén chỉ mục

### 3.1 Vì sao cần nén?

- **Ít dung lượng lưu trữ hơn** → tiết kiệm chi phí.

- **Lưu nhiều dữ liệu hơn trong bộ nhớ** → tăng tốc xử lý.

- **Tăng tốc truyền dữ liệu từ đĩa vào bộ nhớ** — đọc dữ liệu nén + giải nén thường nhanh hơn đọc dữ liệu chưa nén.

### 3.2 Định luật Heaps (Heaps' Law)

$$M = kT^b$$

- M: kích thước từ vựng, T: số token.

- Với RCV1: k ≈ 44, b ≈ 0.49 (log₁₀M = 0.49 log₁₀T + 1.64).

- Từ vựng tăng khi bộ sưu tập tăng, không có cận trên cố định.

### 3.3 Định luật Zipf (Zipf's Law)

$$cf_i \propto \frac{1}{i} = \frac{K}{i}$$

- cfᵢ: tần suất collection của từ phổ biến thứ i.

- Từ phổ biến nhất ("the") xuất hiện cf₁ lần, từ thứ hai xuất hiện cf₁/2, thứ ba cf₁/3...

- Quan hệ tuyến tính giữa log cfᵢ và log i.

### 3.4 Nén từ điển

**Lưu trữ ngây thơ:** Mảng độ rộng cố định, 20 byte/term → 400K × 28 = 11.2 MB.

**Từ điển dạng chuỗi (String dictionary):**
- Lưu các term liên tiếp trong chuỗi dài.

- Dùng con trỏ đến term tiếp theo.

- 4 byte (freq) + 4 byte (postings ptr) + 3 byte (term ptr) + 8 byte (term trong chuỗi) = 19 byte/term → 7.6 MB.

**Phân khối (Blocking):**
- Lưu con trỏ tới mỗi term thứ k (vd k = 4).

- Tiết kiệm con trỏ, thêm 1 byte lưu độ dài mỗi term.

- Với k = 4: 7.1 MB.

- **Đánh đổi:** Tìm kiếm chậm hơn một chút (thêm tìm tuyến tính trong khối).

**Mã hóa tiền tố (Front-coding):**
- Các từ sắp xếp thường có chung tiền tố dài → chỉ lưu phần khác biệt.

- Ví dụ: automat → a\*1→e, 2→ic, 3→ion.

- Kết hợp blocking + front-coding → 5.9 MB.

| Kỹ thuật | Kích thước |
|----------|-----------|
| Độ dài cố định | 11.2 MB |
| String dictionary | 7.6 MB |
| + Blocking (k=4) | 7.1 MB |
| + Blocking + Front-coding | 5.9 MB |

### 3.5 Nén danh sách Postings

**Mã hóa khoảng cách (Gap encoding):**
- Lưu khoảng cách giữa các docID thay vì docID tuyệt đối.

- VD: 33, 47, 154, 159, 202 → 33, 14, 107, 5, 43.

- Từ phổ biến ("the") có gap = 1 → có thể nén rất tốt.

**Mã Unary:**
- Số n → n số 1 + 1 số 0.

- 3 → 1110, 40 → 40 số 1 + 0.

- Không tốt cho số lớn, thường dùng kết hợp.

**Mã Gamma:**
- Biểu diễn G dưới dạng cặp (length, offset):
  - **Offset:** G dạng nhị phân, bỏ bit cao nhất. VD: 13 → 1101 → 101.

  - **Length:** Độ dài của offset, mã hóa Unary. VD: độ dài = 3 → 1110.

  - Mã Gamma = length + offset. VD: 13 → 1110101.

| Số | Mã Gamma | Số bit |
|----|----------|--------|
| 1 | 0 | 1 |
| 2 | 10,0 | 3 |
| 3 | 10,1 | 3 |
| 4 | 110,00 | 5 |
| 9 | 1110,001 | 7 |
| 13 | 1110,101 | 7 |

**Đặc điểm mã Gamma:**
- Số bit: 2⌊log G⌋ + 1 (luôn lẻ).

- Gần tối ưu (sai số gấp 2 lần so với log₂G).

- Uniquely prefix-decodable.

- **Nhược điểm:** Xử lý cấp độ bit chậm, hiếm dùng trong thực tế.

**Độ phức tạp các phương pháp nén postings:**

| Phương pháp | Mã hóa | Giải mã | Số bit/G (gap G) |
|------------|--------|---------|-------------------|
| **32-bit int** | O(1) — lưu trực tiếp | O(1) — đọc 4 byte | 32 (cố định) |
| **Mã Gamma** | O(log G) — đếm số bit | O(log G) — đọc từng bit | 2⌊log G⌋ + 1 |
| **Variable Byte** | O(log G / 7) — chia 7 bit | O(log G / 7) — duyệt byte | ~8 × ⌈log₂G / 7⌉ |
| **Group VarInt** | O(4) — 4 số cùng lúc | O(1) — lookup bảng + mask | ~8 × ⌈log₂G / 8⌉ × ¼ (trung bình) |
| **Simple-9** | O(n) — thử layout phù hợp | O(1) — mask + shift | ~32 × ⌈log₂G / 28⌉ / n |

**Nhận xét:**
- Gap càng nhỏ → càng tiết kiệm bit. Với từ phổ biến (gap = 1): Gamma dùng 1 bit, VB vẫn dùng 1 byte (8 bit) → VB lãng phí 7 bit.

- Tuy nhiên, VB decode nhanh hơn Gamma 5-10 lần nhờ căn chỉnh byte → **VB được dùng phổ biến nhất**.

- Group VarInt và Simple-9 nhanh hơn VB nhờ xử lý batch và ít rẽ nhánh.

**Mã Variable Byte (VB):**
- Cơ chế: Dành 1 bit trong mỗi byte làm bit tiếp tục (continuation bit).

- G ≤ 127: 1 byte (7 bit dữ liệu + c = 1).

- G > 127: nhiều byte (c = 0 cho byte giữa, c = 1 cho byte cuối).

- **Ưu điểm:** Căn chỉnh byte, xử lý nhanh, đơn giản. **Được dùng phổ biến.**

**Mã hóa theo nhóm (Group VarInt - Google):**
- Mã hóa 4 số trong khối 5-17 byte.

- Byte đầu: 4 trường độ dài 2-bit (L₁L₂L₃L₄, mỗi Lⱼ ∈ {1,2,3,4}).

- Nhanh gấp đôi Variable Byte.

**Simple-9:**
- Đóng gói số nguyên vào word 32-bit.

- 4 bit đầu: layout (9 cách sắp xếp).

- 28 bit còn lại: dữ liệu.

- 9 layout: 28×1, 14×2, 9×3, 7×4, 5×5, 4×7, 3×9, 2×14, 1×28.

**So sánh các phương pháp nén (RCV1):**

| Phương pháp | Kích thước | Tốc độ | Đặc điểm |
|-------------|-----------|--------|----------|
| 32-bit int | 400 MB | Rất nhanh | Lãng phí |
| Mã Gamma | 101 MB | Chậm | Tỷ lệ nén tốt nhất |
| Variable Byte | 116 MB | Nhanh | Cân bằng, phổ biến |
| Simple-9/16 | ~110 MB | Rất nhanh | Tối ưu 32/64-bit |
| Group VarInt | ~115 MB | Cực nhanh | Google, ít branching |

**Tổng kết nén:**
- Chỉ mục Boolean nén chỉ ~4% tổng kích thước collection.

- ~10-15% kích thước phần văn bản.

- Với chỉ mục vị trí, mức tiết kiệm thấp hơn.

---

## Phần 4: Chương IV - Truy vấn ký tự đại diện và sửa lỗi chính tả

### 4.1 Truy vấn ký tự đại diện (Wildcard Queries)

**Ký tự `*`:**
- `mon*` (bắt đầu bằng "mon"): dễ — dùng B-tree, lấy khoảng mon ≤ w < moo.

- `*mon` (kết thúc bằng "mon"): khó — cần B-tree cho term đảo ngược.

- `pro*cent`: kết hợp cả hai.

**Permuterm Index:**
- Thêm `$` vào cuối từ.

- Xoay vòng từ và lập chỉ mục các phiên bản xoay.

- Ví dụ hello → hello$, ello$h, llo$he, lo$hel, o$hell, $hello.

- Kích thước từ điển tăng ~4 lần.

| Truy vấn | Cách tra cứu | Ví dụ |
|----------|-------------|-------|
| X | X$ | hello → hello$ |
| X* | $X* | hel* → $hel* |
| *X | X$* | *llo → llo$* |
| *X* | X* | *ell* → ell* |
| X*Y | Y$X* | h*lo → lo$h* |

**Bigram (k-gram) Index:**
- Liệt kê tất cả k-gram trong mỗi thuật ngữ.

- Xây dựng inverted index: bigram → các thuật ngữ chứa bigram đó.

- VD: "mon*" → $m AND mo AND on.

- Cần lọc sau (post-filtering) vì có thể trả về cả "moon".

- **Ưu điểm:** Nhanh, tiết kiệm không gian hơn Permuterm.

### 4.2 Sửa lỗi chính tả (Spell Correction)

**Tỷ lệ lỗi:**
- 26%: truy vấn Web.

- 13%: gõ lại văn bản.

- 1-2%: gõ văn bản thông thường.

**Các loại lỗi:**
- **Non-word:** graffe → giraffe (từ không hợp lệ).

- **Real-word:** three → there (từ hợp lệ nhưng sai ngữ cảnh).

**Sửa lỗi non-word:**
1. Phát hiện: từ nào không trong từ điển là lỗi.

2. Sinh ứng viên: từ có độ tương tự cao.

3. Chọn tốt nhất: dựa trên khoảng cách chỉnh sửa và xác suất.

**Khoảng cách Damerau–Levenshtein:**
Gồm 4 thao tác: Insertion, Deletion, Substitution, Transposition.
- 80% lỗi nằm trong edit distance = 1.

- Gần như tất cả lỗi nằm trong edit distance = 2.

**Phương pháp sinh ứng viên:**
1. Duyệt từ điển, kiểm tra edit distance từng từ.

2. Sinh tất cả từ có edit distance ≤ k, lấy giao với từ điển.

3. Dùng character k-gram index.

4. Levenshtein finite state transducer.

**Mô hình Noisy Channel:**
$$\hat{w} = \arg\max_{w \in V} P(w | x) = \arg\max_{w \in V} P(x | w)P(w)$$

- **Prior P(w):** Unigram probability từ corpus.

- **Channel model P(x|w):** Dựa trên confusion matrix (del, ins, sub, trans).

| Từ đúng | Số lần | P(w) |
|---------|--------|------|
| actress | 9,321 | 0.000023 |
| across | 120,844 | 0.000299 |
| access | 37,038 | 0.000092 |

**Add-1 smoothing cho channel model:**
$$P(x|w)_{\text{substitution}} = \frac{\text{sub}[x,w] + 1}{\text{count}[w] + |A|}$$

**Sửa lỗi real-word:**
- Với mỗi từ trong câu, sinh tập ứng viên (gồm chính nó + chỉnh sửa 1 ký tự + từ đồng âm).

- Chọn chuỗi từ tối ưu P(W | x₁...xₙ).

- Dùng **Bigram Language Model** kết hợp context.
  $$P(w_1 \ldots w_n) = P(w_1)P(w_2|w_1)\ldots P(w_n|w_{n-1})$$

**Interpolation smoothing:**
$$P_{li}(w_k|w_{k-1}) = \lambda P_{uni}(w_k) + (1-\lambda)P_{bi}(w_k|w_{k-1})$$

---

## Phần 5: Chương V - Chấm điểm, trọng số thuật ngữ và mô hình không gian vector

### 5.1 Hạn chế của mô hình Boolean

- "Feast or Famine": quá ít hoặc quá nhiều kết quả.

- AND → thường quá ít, OR → thường quá nhiều.

- Cần kỹ năng cao để tạo truy vấn vừa phải.

- Không xếp hạng — không biết tài liệu nào tốt hơn.

### 5.2 Truy xuất có xếp hạng (Ranked Retrieval)

- Trả về thứ tự sắp xếp các tài liệu.

- Truy vấn dạng văn bản tự do (free text query).

- Chỉ hiển thị top K kết quả (thường 10).

- Giả định quan trọng: Thuật toán xếp hạng hoạt động tốt.

### 5.3 Hệ số Jaccard

$$J(A,B) = \frac{|A \cap B|}{|A \cup B|}$$

**Hạn chế:**
- Không xét tần suất từ (term frequency).

- Không xét độ hiếm của từ (IDF).

- Không chuẩn hóa độ dài tài liệu.

### 5.4 Mô hình Bag of Words

- Mỗi tài liệu là vector đếm trong ℕ^M.

- Không xét thứ tự từ.

- "John is quicker than Mary" và "Mary is quicker than John" → cùng vector.

### 5.5 Tần suất thuật ngữ (Term Frequency - TF)

**TF thô (raw tf):** Số lần xuất hiện của t trong d.

**TF logarit:**
$$w_{t,d} = \begin{cases} 1 + \log_{10} tf_{t,d}, & tf_{t,d} > 0 \\ 0, & \text{otherwise} \end{cases}$$

| tf | log tf |
|----|--------|
| 0 | 0 |
| 1 | 1 |
| 2 | 1.3 |
| 10 | 2 |
| 1000 | 4 |

→ Mức độ liên quan không tăng tỉ lệ thuận với tf.

### 5.6 Tần suất tài liệu nghịch đảo (Inverse Document Frequency - IDF)

**Công thức:**
$$idf_t = \log_{10} \frac{N}{df_t}$$

Trong đó:
- N: tổng số tài liệu.

- df_t: số tài liệu chứa từ t.

**Ví dụ với N = 1 triệu:**

| Term | df_t | idf_t |
|------|------|-------|
| calpurnia | 1 | 6 |
| animal | 100 | 4 |
| sunday | 1,000 | 3 |
| fly | 10,000 | 2 |
| under | 100,000 | 1 |
| the | 1,000,000 | 0 |

→ Từ hiếm mang nhiều thông tin hơn, có idf cao hơn.

### 5.7 Trọng số TF-IDF

$$w_{t,d} = (1 + \log_{10} tf_{t,d}) \times \log_{10} \frac{N}{df_t}$$

**Tính chất:**
- Tăng khi tf trong tài liệu tăng.

- Tăng khi từ hiếm hơn trong toàn bộ collection.

**Điểm số tài liệu cho truy vấn:**
$$\text{Score}(q, d) = \sum_{t \in q \cap d} \text{tf-idf}_{t,d}$$

### 5.8 Mô hình không gian vector (Vector Space Model)

- Mỗi tài liệu là vector trong không gian |V| chiều.

- Các term là các trục của không gian.

- Số chiều rất lớn (hàng chục triệu), vector rất thưa.

- Truy vấn cũng được biểu diễn thành vector.

**Độ tương tự Cosine:**
$$\cos(\vec{q}, \vec{d}) = \frac{\vec{q} \cdot \vec{d}}{|\vec{q}| \times |\vec{d}|} = \frac{\sum_{i=1}^V q_i d_i}{\sqrt{\sum_{i=1}^V q_i^2} \sqrt{\sum_{i=1}^V d_i^2}}$$

Tại sao không dùng khoảng cách Euclid?
- Khoảng cách Euclid lớn đối với vector có độ dài khác nhau.

- Tài liệu d và d' (d nối với chính nó) có cùng nội dung nhưng khoảng cách Euclid lớn.

- Cosine phụ thuộc vào góc, không phải độ dài.

**Chuẩn hóa độ dài (L2 normalization):**
- Chia vector cho chuẩn L2: $||\vec{x}||_2 = \sqrt{\sum_i x_i^2}$.

- Biến vector thành vector đơn vị.

- Với vector đã chuẩn hóa: $\cos(\vec{q}, \vec{d}) = \vec{q} \cdot \vec{d} = \sum_i q_i d_i$.

**Độ phức tạp tính cosine trong thực tế:**

| Phương pháp | Mô tả | Độ phức tạp |
|------------|-------|------------|
| **Naive (full scan)** | Tính cos cho mọi doc trong collection | O(N × \|V\|) — không khả thi |
| **TAAT** (Term-At-A-Time) | Với mỗi term trong query, duyệt postings list, cộng dồn điểm cho từng doc | O(\|q\| × avg\_len(postings)) |
| **DAAT** (Doc-At-A-Time) | Duyệt song song postings list của tất cả term trong query, tính điểm từng doc | O(\|q\| × avg\_len(postings)) |
| **Với top-K** (dùng heap) | Chỉ duy trì heap K kết quả tốt nhất, không cần tính full | O(\|q\| × avg\_len(postings) × log K) |

Trong đó:
- $\|q\|$: số term trong truy vấn (thường nhỏ, ~2-10).

- avg\_len(postings): độ dài trung bình của postings list cho term trong query.

- **Thực tế:** với inverted index, chỉ tính cosine trên docs có chứa ít nhất 1 term của query → không phải scan toàn bộ N.

**Các tối ưu để tăng tốc scoring:**
- **Chỉ lưu tf trong posting, idf trong dictionary** → tiết kiệm bộ nhớ hơn lưu cả tf-idf.

- **Dùng heap (priority queue)** để lấy top K, heap push/pop O(log K) mỗi doc.

- **Tính sẵn độ dài doc ($\|d\|_2$)** khi build index → không cần tính lại.

### 5.9 Ký hiệu SMART (SMART Notation)

Dạng `ddd.qqq` mô tả tổ hợp phương pháp:
- Chữ cái đầu: tf weight (b: binary, l: log, n: raw, ...)

- Chữ cái thứ hai: df weight (n: none, t: idf, p: prob idf, ...)

- Chữ cái thứ ba: normalization (n: none, c: cosine, ...)

**Phổ biến: `lnc.ltc`:**
- **Document:** tf log (l) + no idf (n) + cosine norm (c)

- **Query:** tf log (l) + idf (t) + cosine norm (c)

---

## Phần 6: Chương VI - Đánh giá

### 6.1 Tại sao cần đánh giá?

Để so sánh các hệ thống IR khác nhau, cần:
1. **Tập tài liệu chuẩn** (benchmark document collection).

2. **Tập truy vấn chuẩn** (benchmark queries).

3. **Đánh giá mỗi tài liệu** là liên quan hoặc không liên quan cho từng truy vấn.

**Vấn đề:** Với 5 triệu tài liệu × 50K truy vấn → hàng trăm nghìn tỷ đánh giá → cần crowdsourcing hoặc lấy mẫu.

### 6.2 Precision và Recall

| | Liên quan | Không liên quan |
|--|-----------|----------------|
| **Được truy hồi** | tp (true positive) | fp (false positive) |
| **Không truy hồi** | fn (false negative) | tn (true negative) |

$$P = \frac{tp}{tp + fp} \quad R = \frac{tp}{tp + fn}$$

### 6.3 F1-Score

$$F_1 = 2 \times \frac{P \times R}{P + R}$$

- Precision và recall thường tỉ lệ nghịch.

- F1 là trung bình điều hòa kết hợp cả hai.

### 6.4 Precision@K (P@K)

- Đặt ngưỡng thứ hạng K.

- Tính tỷ lệ tài liệu liên quan trong top K.

- Bỏ qua tài liệu xếp hạng thấp hơn K.

### 6.5 Mean Average Precision (MAP)

**Average Precision:**
$$\text{AP} = \frac{1}{R} \sum_{k=1}^{R} \text{P@K}_k$$

Trong đó K₁, K₂, ..., K_R là vị trí của các tài liệu liên quan.

**Ví dụ:** 3 tài liệu liên quan ở vị trí 1, 3, 5:
$$\text{AP} = \frac{1}{3} \left(\frac{1}{1} + \frac{2}{3} + \frac{3}{5}\right) \approx 0.76$$

**MAP = trung bình của AP trên nhiều truy vấn.**

- Phổ biến nhất trong các bài báo nghiên cứu.

- Giả định người dùng muốn tìm nhiều tài liệu liên quan.

- Cần nhiều đánh giá độ liên quan.

**Độ phức tạp tính MAP:**
$$\text{MAP} = \frac{1}{Q} \sum_{q=1}^Q \frac{1}{R_q} \sum_{k=1}^{R_q} \text{P@K}_{k,q}$$

- Với mỗi truy vấn q: AP cần duyệt qua danh sách kết quả đã xếp hạng (K kết quả) → O(K).

- Tổng Q truy vấn → O(Q × K).

- Nếu K = N (toàn bộ collection), cần duyệt N document → O(Q × N).

### 6.6 Mean Reciprocal Rank (MRR)

- Dùng khi chỉ có một tài liệu liên quan (known-item search, navigational query).

- Reciprocal Rank = 1/K (K là vị trí tài liệu liên quan đầu tiên).

- MRR = trung bình của Reciprocal Rank trên nhiều truy vấn.

### 6.7 Discounted Cumulative Gain (DCG)

**Dùng cho đánh giá đa mức (graded relevance).**

**Cumulative Gain (CG):**
$$CG_n = r_1 + r_2 + \ldots + r_n$$

**Discounted Cumulative Gain (DCG):**
$$DCG_n = r_1 + \frac{r_2}{\log_2 2} + \frac{r_3}{\log_2 3} + \ldots + \frac{r_n}{\log_2 n}$$

**Công thức thay thế:**
$$DCG_p = \sum_{i=1}^p \frac{rel_i}{\log_2 (i+1)} \quad \text{hoặc} \quad DCG_p = \sum_{i=1}^p \frac{2^{rel_i} - 1}{\log_2 (i+1)}$$

**Ví dụ:** Độ liên quan: 3, 2, 3, 0, 0, 1, 2, 2, 3, 0
- Gain có chiết khấu: 3, 2/1, 3/1.59, 0, 0, 1/2.59, 2/2.81, 2/3, 3/3.17, 0 = 3, 2, 1.89, 0, 0, 0.39, 0.71, 0.67, 0.95, 0

- DCG: 3, 5, 6.89, 6.89, 6.89, 7.28, 7.99, 8.66, 9.61, 9.61

**Độ phức tạp DCG/NDCG:**
- DCG tại p: O(p) — cộng dồn từ đầu danh sách.

- NDCG: O(p log p) để sắp xếp ideal ranking theo độ liên quan, sau đó O(p) tính DCG ideal.

- Trong thực tế, thường chỉ tính NDCG@K với K nhỏ (10, 20) → O(K log K) rất nhanh.

**Normalized DCG (NDCG):**
- Chuẩn hóa DCG bằng DCG của xếp hạng lý tưởng.

- Cho phép so sánh các truy vấn có số lượng kết quả liên quan khác nhau.

### 6.8 Đánh giá dựa trên hành vi người dùng

**Vấn đề với đánh giá con người:**
- Tốn kém, không nhất quán.

- Giá trị giảm dần khi dữ liệu thay đổi.

**Độ lệch vị trí khi click (Position bias):**
- Vị trí cao hơn nhận được nhiều click hơn — ngay cả khi thứ tự bị đảo ngược.

- Click mang thông tin nhưng bị thiên lệch.

**So sánh tương đối:**
- So sánh cặp (pairwise): "Tài liệu A tốt hơn B" — không cần đánh giá tuyệt đối.

- Xen kẽ bảng xếp hạng (Interleaved ranking): trình bày danh sách xen kẽ từ 2 hệ thống, đếm click.

**A/B Testing:**
- Đa số người dùng dùng hệ thống cũ.

- Chuyển 0.1% lưu lượng sang thử nghiệm.

- Đo lường sự khác biệt.

---

## Phần 7: Chương VII - Cải thiện kết quả

### 7.1 Phản hồi liên quan (Relevance Feedback)

**Quy trình:**
1. Người dùng đưa ra truy vấn (thường ngắn, đơn giản).

2. Người dùng đánh dấu kết quả: liên quan / không liên quan.

3. Hệ thống tính toán biểu diễn tốt hơn cho nhu cầu thông tin.

4. Có thể lặp lại nhiều vòng.

### 7.2 Thuật toán Rocchio

**Trọng tâm (Centroid):**
$$\vec{\mu}(C) = \frac{1}{|C|} \sum_{\vec{d} \in C} \vec{d}$$

**Công thức Rocchio (thực tế):**
$$\vec{q}_m = \alpha \vec{q}_0 + \beta \frac{1}{|D_r|} \sum_{\vec{d}_j \in D_r} \vec{d}_j - \gamma \frac{1}{|D_{nr}|} \sum_{\vec{d}_j \in D_{nr}} \vec{d}_j$$

Trong đó:
- $\vec{q}_0$: vector truy vấn ban đầu.

- $D_r$: tập tài liệu liên quan.

- $D_{nr}$: tập tài liệu không liên quan.

- $\alpha, \beta, \gamma$: trọng số (thường chọn thủ công).

**Nguyên tắc:**
- Di chuyển truy vấn về phía tài liệu liên quan ($\beta > 0$).

- Tránh xa tài liệu không liên quan ($\gamma > 0$).

- Phản hồi tích cực có giá trị hơn tiêu cực → $\gamma < \beta$ (vd: $\gamma = 0.25, \beta = 0.75$).

- Nhiều hệ thống chỉ cho phép phản hồi tích cực ($\gamma = 0$).

**Độ phức tạp của Rocchio:**
- **Tính centroid:** O(|D_r| × L_avg + |D_{nr}| × L_avg) — duyệt qua tất cả doc được đánh dấu.

- **Cập nhật q_m:** O(|V|) — nếu làm đầy đủ trên toàn bộ không gian vector.

- **Trong thực tế:** chỉ tính trên |q_0| + top-k term từ centroid. Thường chọn top 20-50 term → O(20 × (|D_r| + |D_{nr}|)).

- **Query mới:** chạy lại scoring với q_m — độ phức tạp tương đương query thường nhưng với nhiều term hơn (q_m dài hơn q_0).

### 7.3 Giả định của phản hồi liên quan

**A1:** Người dùng có đủ kiến thức để đưa ra truy vấn ban đầu.
**A2:** Các tài liệu liên quan có phân phối thuật ngữ tương tự nhau; tài liệu không liên quan có phân phối khác biệt.

**Vi phạm A1:** Sai chính tả ("Brittany Speers"), truy xuất xuyên ngôn ngữ, lệch pha từ vựng ("Cosmonaut" vs "Astronaut").
**Vi phạm A2:** Nhiều "nguyên mẫu" khác nhau (Burma/Myanmar, các ngôi sao Pop từng làm việc tại Burger King).

### 7.4 Vấn đề của phản hồi liên quan

- Truy vấn dài → chậm, tốn chi phí.

- Người dùng ngại cung cấp phản hồi rõ ràng (chỉ ~4% phiên sử dụng).

- ~70% người dùng chỉ xem trang kết quả đầu tiên.

- Khó giải thích tại sao tài liệu được truy xuất sau khi áp dụng phản hồi.

### 7.5 Đánh giá phản hồi liên quan

- Không được đánh giá trên chính tài liệu đã dùng cho phản hồi ("gian lận").

- Dùng "bộ sưu tập dư thừa" (residual collection) — trừ đi tài liệu đã đánh giá.

- Tốt nhất: dùng hai bộ sưu tập riêng biệt.

### 7.6 Phản hồi liên quan giả định (Pseudo Relevance Feedback)

- Tự động hóa phần "thủ công".

- Giả định k tài liệu đứng đầu là liên quan.

- Thực hiện Rocchio trên giả định đó.

- Hoạt động tốt trung bình nhưng có thể sai lầm cho một số truy vấn.

- Nhiều vòng lặp → trôi dạt truy vấn (query drift).

### 7.7 Mở rộng truy vấn (Query Expansion)

**Khác với phản hồi liên quan:**
- Relevance feedback: đầu vào từ tài liệu (liên quan/không liên quan).

- Query expansion: đầu vào từ thuật ngữ (từ/cụm từ tốt/xấu).

**Các phương pháp:**
- **Từ điển đồng nghĩa thủ công:** MedLine: physician → doc, doctor, MD, medico. Tăng recall nhưng giảm precision với từ đa nghĩa. Chi phí tạo và cập nhật cao.

- **Tự động tạo từ điển đồng nghĩa:**
  - Dựa trên ma trận C = AAᵀ với A là ma trận thuật ngữ-tài liệu.

  - C[i][j] = số lần từ i và j cùng xuất hiện.

  - Chọn các thuật ngữ có giá trị cao nhất.
- **Phân tích cục bộ:** phân tích tài liệu trong tập kết quả.

- **Phân tích toàn cục:** dựa trên thống kê cùng xuất hiện trong toàn collection.

**Vấn đề của tự động tạo từ điển đồng nghĩa:**
- Dương tính giả: từ tương quan thống kê nhưng không liên quan.

- Âm tính giả: từ tương đồng thực sự nhưng không được phát hiện.

- "Apple computer" → "Apple red fruit computer".

---

## Tổng kết

| Chương | Nội dung chính |
|--------|---------------|
| I | Boolean retrieval, inverted index, phrase queries, proximity search |
| II | BSBI, SPIMI, MapReduce, distributed indexing, dynamic indexing (logarithmic merge) |
| III | Heaps' Law, Zipf's Law, dictionary compression (string, blocking, front-coding), postings compression (Gamma, VB, Simple-9, Group VarInt) |
| IV | Wildcard queries (Permuterm, k-gram), spelling correction (Noisy Channel, Damerau-Levenshtein) |
| V | TF-IDF, Vector Space Model, cosine similarity, SMART notation |
| VI | Precision/Recall, MAP, DCG/NDCG, MRR, A/B testing, interleaved ranking |
| VII | Relevance feedback (Rocchio), pseudo relevance feedback, query expansion, thesaurus |
