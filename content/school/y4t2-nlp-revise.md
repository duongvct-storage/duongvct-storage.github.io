---
title: Y4T2-NLP revise
date: 2026-04-29
keywords: [school, nlp, revise]
theme: nlp
description: Year 4 Term 2 - NLP course revision and exercises
---

# ÔN TẬP CUỐI KỲ: XỬ LÝ NGÔN NGỮ TỰ NHIÊN (NLP)

---

## MỤC LỤC

1. [PHẦN 1: Giới thiệu về NLP](#phần-1-giới-thiệu-về-nlp)
2. [PHẦN 2: Mô hình ngôn ngữ](#phần-2-mô-hình-ngôn-ngữ)
3. [PHẦN 3: Gán nhãn từ loại & HMM](#phần-3-gán-nhãn-từ-loại--hmm)
4. [PHẦN 4: Phân tích cú pháp](#phần-4-phân-tích-cú-pháp)
5. [PHẦN 5: Các chủ đề nâng cao (tóm tắt)](#phần-5-các-chủ-đề-nâng-cao-tóm-tắt)
6. [BÀI TẬP TƯƠNG TỰ SLIDE - GIẢI CHI TIẾT](#bài-tập-tương-tự-slide---giải-chi-tiết)

---

# PHẦN 1: GIỚI THIỆU VỀ NLP

## 1.1 Định nghĩa

**Xử lý ngôn ngữ tự nhiên (Natural Language Processing - NLP)** là một nhánh nghiên cứu của trí tuệ nhân tạo và ngôn ngữ học tính toán, nghiên cứu về sinh ngôn ngữ tự động và hiểu ngôn ngữ con người.

- **NLG (Natural Language Generation)**: chuyển đổi thông tin từ CSDL sang ngôn ngữ giống con người.
- **NLU (Natural Language Understanding)**: chuyển đổi từ ngôn ngữ con người sang biểu diễn dễ xử lý cho máy tính.

## 1.2 Các mức độ hiểu biết ngôn ngữ

| Mức độ | Nội dung |
|--------|----------|
| Ngữ âm học (Phonetics) | Cách con người tạo ra, truyền tải và nghe các âm thanh |
| Âm vị học (Phonology) | Hệ thống âm thanh để truyền tải ý nghĩa |
| Hình thái học (Morphology) | Cấu trúc của từ (ví dụ: re+vital+ize+ation) |
| Từ vựng (Lexicon) | Từ điển của ngôn ngữ với cách phát âm, từ loại, ý nghĩa |
| Cú pháp (Syntax) | Cách từ được tổng hợp tạo thành cụm từ và câu |
| Ngữ nghĩa (Semantics) | Ý nghĩa của từ, cụm từ và câu |
| Ngữ dụng (Pragmatics) | Mối quan hệ giữa ngôn ngữ và ngữ cảnh |
| Diễn ngôn (Discourse) | Cấu trúc văn bản lớn hơn câu đơn lẻ |

## 1.3 Lịch sử phát triển NLP

1. **Rule-Based Machine Translation (RBMT)**: Dựa trên luật ngôn ngữ học.

2. **Statistical Machine Translation (SMT)**: Dựa trên thống kê và xác suất từ dữ liệu.

3. **Neural Machine Translation (NMT)**: Sử dụng mạng nơ-ron sau (RNN, Transformer).

## 1.4 Nhập nhằng (Ambiguity)

Nhập nhằng là một trong những khó khăn lớn nhất của NLP, xuất hiện ở nhiều mức độ:

- **Mức độ từ**: "Học sinh học sinh học" - có nhiều khả năng tách từ.
- **Mức độ từ loại**: "Con ngựa đá con ngựa đá" - từ "đá" có thể là động từ hoặc tính từ.
- **Mức độ cú pháp**: Câu có nhiều cách phân tích cây cú pháp.
- **Mức độ từ vựng**: "I walked to the bank" - "bank" có thể là bờ sông hoặc ngân hàng.

## 1.5 Tính thưa thớt dữ liệu (Sparsity)

Theo **Zipf's Law**, tần suất của từ hàng r xấp xỉ tỷ lệ nghịch với r:

$$
f(w) \propto \frac{1}{rank(w)}
$$

Điều này dẫn đến phần lớn từ ít xuất hiện, gây khó khăn cho ước lượng xác suất.

## 1.6 Corpus

**Corpus** là tập hợp các văn bản thường được chú thích. Ví dụ quan trọng:

- **Penn Treebank**: 1M từ của báo Wall Street Journal.
- **Canadian Hansards**: 10M+ từ song ngữ Pháp/Anh.

---

# PHẦN 2: MÔ HÌNH NGÔN NGỮ

## 2.1 Định nghĩa

**Mô hình ngôn ngữ (Language Model - LM)** là mô hình xác suất cho phép tính xác suất của một câu (chuỗi các từ) trong một ngôn ngữ.

$$
P(W) = P(w_1, w_2, \dots, w_m) = P(w_1) \times P(w_2|w_1) \times \dots \times P(w_m|w_1 \dots w_{m-1})
$$

## 2.2 Mô hình N-gram

Sử dụng giả thuyết **Markov**: từ chỉ phụ thuộc vào n từ đứng trước.

| Mô hình | Công thức |
|---------|-----------|
| Unigram | $P(w_1 \dots w_n) \approx \prod_{i=1}^{n} P(w_i)$ |
| Bigram | $P(w_1 \dots w_n) \approx P(w_1) \prod_{i=2}^{n} P(w_i \| w_{i-1})$ |
| Trigram | $P(w_1 \dots w_n) \approx P(w_1)P(w_2\|w_1) \prod_{i=3}^{n} P(w_i \| w_{i-1}, w_{i-2})$ |

## 2.3 Ước lượng hợp lý cực đại (MLE)

Với bigram:

$$
P(w_i | w_{i-1}) = \frac{count(w_{i-1}, w_i)}{count(w_{i-1})}
$$

Với N-gram tổng quát:

$$
P(w_i | w_{i-N+1} \dots w_{i-1}) = \frac{count(w_{i-N+1} \dots w_i)}{count(w_{i-N+1} \dots w_{i-1})}
$$

## 2.4 Làm trơn xác suất (Smoothing)

### Laplace (Add-one) Smoothing

$$
P_{Laplace}(w_i | w_{i-1}) = \frac{count(w_{i-1}, w_i) + 1}{count(w_{i-1}) + V}
$$

Trong đó $V$ là kích thước từ vựng.

### Add-k Smoothing

$$
P_{add\_k}(w_i | w_{i-1}) = \frac{count(w_{i-1}, w_i) + k}{count(w_{i-1}) + kV}
$$

### Backoff

- Sử dụng trigram nếu có đủ dữ liệu.
- Nếu không, lùi xuống bigram.
- Nếu vẫn không đủ, lùi xuống unigram.

### Interpolation (Nội suy)

$$
P_{SLI}(w_n | w_{n-1}, w_{n-2}) = \lambda_1 P(w_n | w_{n-1}, w_{n-2}) + \lambda_2 P(w_n | w_{n-1}) + \lambda_3 P(w_n)
$$

Với $\sum_i \lambda_i = 1$.

## 2.5 Đánh giá mô hình - Perplexity

**Perplexity (PP)** là thước đo chuẩn để đánh giá mô hình ngôn ngữ:

$$
PP(W) = P(w_1 w_2 \dots w_N)^{-\frac{1}{N}} = \sqrt[N]{\frac{1}{\prod_{i=1}^{N} P(w_i | w_1 \dots w_{i-1})}}
$$

Với bigram:

$$
PP(W) = \sqrt[N]{\prod_{i=1}^{N} \frac{1}{P(w_i | w_{i-1})}}
$$

**PP càng nhỏ, mô hình càng tốt.**

## 2.6 Xử lý từ không biết (Unknown Words)

Thay thế các từ hiếm bằng token giả **`<UNK>`**, sau đó huấn luyện mô hình như bình thường.

---

# PHẦN 3: GÁN NHÃN TỪ LOẠI & HMM

## 3.1 Gán nhãn từ loại (POS Tagging)

**POS Tagging** là bài toán gán nhãn từ loại cho mỗi từ trong câu. Đây là bài toán khử nhập nhằng vì nhiều từ có thể thuộc nhiều từ loại khác nhau.

**Bộ nhãn Penn Treebank** được sử dụng rộng rãi, bao gồm các nhãn như: NN (danh từ số ít), NNS (danh từ số nhiều), VB (động từ nguyên thể), VBD (động từ quá khứ), JJ (tính từ), RB (trạng từ), IN (giới từ), DT (mạo từ), PRP (đại từ), MD (động từ khiếm khuyết)...

## 3.2 Mô hình Markov

**Chuỗi Markov** dựa trên nguyên lý không có bộ nhớ: xác suất chuyển sang trạng thái tiếp theo chỉ phụ thuộc vào trạng thái hiện tại.

- **Xác suất chuyển trạng thái**: $P(t_i | t_{i-1})$
- **Xác suất ban đầu**: $\pi$
- **Ma trận chuyển trạng thái**: $A$

## 3.3 Hidden Markov Model (HMM)

HMM là mô hình sinh xác suất cho dữ liệu dạng chuỗi, với:

- **Trạng thái ẩn (Hidden)**: Nhãn từ loại ($t_i$)
- **Quan sát (Observable)**: Từ xuất hiện ($w_i$)
- **Xác suất phát xạ (Emission)**: $P(w_i | t_i)$ - xác suất từ được sinh ra biết nhãn từ loại.

Ba bài toán chính của HMM:

| Bài toán | Mục tiêu | Thuật toán |
|----------|----------|------------|
| Likelihood | Tính $P(O\|\lambda)$ | Forward Algorithm |
| Decoding | Tìm chuỗi trạng thái tốt nhất | Viterbi Algorithm |
| Learning | Học tham số $\lambda = (\pi, A, B)$ | Baum-Welch (EM) |

## 3.4 Thuật toán Forward

Tính $\alpha_t(j)$ - xác suất hệ thống ở trạng thái $s_j$ sau khi quan sát $t$ quan sát đầu tiên:

**Khởi tạo:**

$$
\alpha_1(j) = \pi_j \cdot b_j(o_1), \quad 1 \leq j \leq N
$$

**Đệ quy:**

$$
\alpha_t(j) = \left[ \sum_{i=1}^{N} \alpha_{t-1}(i) \cdot a_{ij} \right] \cdot b_j(o_t), \quad 1 \leq j \leq N, \quad 1 < t \leq T
$$

**Kết thúc:**

$$
P(O\|\lambda) = \sum_{i=1}^{N} \alpha_T(i)
$$

Độ phức tạp: $O(T \cdot N^2)$.

## 3.5 Thuật toán Viterbi

Tìm chuỗi trạng thái có xác suất cao nhất. Tương tự Forward nhưng thay **Sum → Max** và lưu lại **backpointer**.

**Khởi tạo:**

$$
v_1(j) = \pi_j \cdot b_j(o_1), \quad bt_1(j) = 0
$$

**Đệ quy:**

$$
v_t(j) = \max_{1 \leq i \leq N} [v_{t-1}(i) \cdot a_{ij}] \cdot b_j(o_t)
$$

$$
bt_t(j) = \arg\max_{1 \leq i \leq N} [v_{t-1}(i) \cdot a_{ij}]
$$

**Kết thúc:**

$$
P^* = \max_{1 \leq i \leq N} v_T(i), \quad q_T^* = \arg\max_{1 \leq i \leq N} v_T(i)
$$

Sau đó truy vết ngược bằng backpointer để tìm chuỗi trạng thái tối ưu.

## 3.6 Huấn luyện HMM

- **Có giám sát (Supervised)**: Đếm tần suất trực tiếp từ dữ liệu gán nhãn.

  $$
  P(t_i | t_{i-1}) = \frac{C(t_{i-1}, t_i)}{\sum_j C(t_{i-1}, t_j)}, \quad P(w_i | t_i) = \frac{C(t_i, w_i)}{C(t_i)}
  $$

- **Không giám sát (Unsupervised)**: Sử dụng thuật toán Baum-Welch (EM).
- **Bán giám sát (Semi-supervised)**: Kết hợp cả hai.

## 3.7 Beam Search

Là chiến lược giải mã phổ biến trong các mô hình sinh ngôn ngữ:

- Ở mỗi bước, chỉ giữ lại $K$ (beam size) giả thuyết tốt nhất.
- Cân bằng giữa độ phức tạp $O(K \cdot T)$ và chất lượng.
- Tốt hơn Greedy Search (chỉ chọn từ tốt nhất tại mỗi bước) nhưng ít tốn kém hơn Exhaustive Search.

---

# PHẦN 4: PHÂN TÍCH CÚ PHÁP

## 4.1 Định nghĩa

**Phân tích cú pháp (Parsing)** là bài toán xác định thông tin về cấu trúc của một câu - mối quan hệ giữa các thành phần.

- **Đầu vào**: Xâu các từ + văn phạm.
- **Đầu ra**: Cây cú pháp (parse tree).

## 4.2 Hai tiếp cận chính

1. **Phân tích thành phần (Constituency Parsing)**: Tổ chức các từ thành các cụm (phrases) lồng nhau.

2. **Phân tích phụ thuộc (Dependency Parsing)**: Phân tích mối quan hệ phụ thuộc có hướng giữa các từ.

Các nhãn phụ thuộc phổ biến: `nsubj` (chủ ngữ), `dobj` (tân ngữ), `det` (mạo từ), `amod` (tính từ bổ nghĩa), `aux` (trợ động từ).

## 4.3 Văn phạm (Grammar)

Một văn phạm sinh là hệ thống $G = (T, N, S, R)$:

- $T$: Tập ký hiệu kết thúc (terminal)
- $N$: Tập ký hiệu không kết thúc (non-terminal)
- $S$: Ký hiệu khởi đầu
- $R$: Tập luật sản xuất ($\alpha \rightarrow \beta$)

## 4.4 Văn phạm phi ngữ cảnh (CFG)

Là văn phạm mà mọi luật có dạng $X \rightarrow \gamma$, trong đó:

- $X$ là ký hiệu không kết thúc.
- $\gamma$ là chuỗi các ký hiệu kết thúc và không kết thúc (có thể rỗng).

## 4.5 Treebank

**Treebank** là tập ngữ liệu mà mỗi câu được chú giải cú pháp bằng tay thành các cây chuẩn. Có thể trích xuất các luật CFG trực tiếp từ cây.

## 4.6 Đánh giá Parser

- **Precision**: $P = \frac{\text{Số trường hợp hệ thống gán đúng}}{\text{Tổng số trường hợp hệ thống gán}}$
- **Recall**: $R = \frac{\text{Số trường hợp hệ thống gán đúng}}{\text{Tổng số trường hợp đúng}}$
- **F1-score**: $F_1 = \frac{2PR}{P+R}$

Đánh giá dựa trên các thành phần (constituents): nhãn, điểm bắt đầu, điểm kết thúc.

## 4.7 Dạng chuẩn Chomsky (CNF)

Mọi luật trong CNF chỉ có 2 dạng:

1. $A \rightarrow B\ C$ (2 non-terminals)
2. $A \rightarrow a$ (1 terminal)

Mục đích: Đảm bảo cây cú pháp luôn là cây nhị phân, dễ dàng chia đoạn câu làm 2 phần trong lập trình động.

## 4.8 Thuật toán CKY (Cocke-Kasami-Younger)

Là thuật toán phân tích cú pháp từ dưới lên dựa trên lập trình động:

- Độ phức tạp: $O(n^3 |G|)$.
- Bắt buộc sử dụng văn phạm dạng CNF.
- Xây dựng ma trận $(n+1) \times (n+1)$, chỉ sử dụng phần tam giác trên.

**Các bước:**

1. **Khởi tạo**: Duyệt đường chéo (span = 1), điền các non-terminal sinh ra từng từ vào ô $[j-1, j]$.

2. **Đệ quy**: Với ô $[i, j]$, duyệt điểm cắt $k$ ($i < k < j$). Nếu ô $[i, k]$ chứa $B$, ô $[k, j]$ chứa $C$, và có luật $A \rightarrow B\ C$, thì điền $A$ vào ô $[i, j]$.

3. **Kết thúc**: Nếu ô $[0, n]$ chứa $S$, câu đúng ngữ pháp.

## 4.9 Văn phạm phi ngữ cảnh xác suất (PCFG)

Gắn xác suất vào mỗi luật để xử lý nhập nhằng:

$$
P(\tau) = \prod_{r \in \tau} P(r)
$$

Với mọi non-terminal $X$:

$$
\sum_{\alpha} P(X \rightarrow \alpha | X) = 1
$$

**Viterbi CKY**: Lưu thêm xác suất lớn nhất tại mỗi ô để phục hồi cây có xác suất cao nhất.

---

# PHẦN 5: CÁC CHỦ ĐỀ NÂNG CAO (TÓM TẮT)

## 5.1 Tiền xử lý văn bản (Week 5)

Các bước tiền xử lý: tách từ (tokenization), chuẩn hóa (normalization), loại bỏ stopwords, tách câu (sentence segmentation).

## 5.2 Phân tích cảm xúc (Sentiment Analysis)

Phân loại văn bản theo cảm xúc: tích cực, tiêu cực, trung tính. Sử dụng các phương pháp từ lexicon-based đến deep learning.

## 5.3 Mô hình Neural Network (Week 6)

| Mô hình | Đặc điểm |
|---------|----------|
| RNN | Xử lý chuỗi, nhưng yếu vấn đề gradient biến mất |
| LSTM/GRU | Có cổng (gates) để kiểm soát thông tin, giảm vấn đề gradient |
| Seq2Seq | Encoder-Decoder cho dịch máy, tóm tắt văn bản |
| Attention | Tập trung vào phần quan trọng của đầu vào |
| Transformer | Self-attention, song song hóa, nền tảng của BERT/GPT |

## 5.4 Ngữ nghĩa từ vựng (Week 7 - Lexical Semantics)

Nghĩa của từ, mối quan hệ đồng nghĩa, trái nghĩa, hạ vị, toàn vị, word embeddings (Word2Vec, GloVe).

## 5.5 Trích xuất thông tin (Week 8)

Nhận dạng thực thể có tên (NER), trích xuất quan hệ, trích xuất sự kiện.

## 5.6 Hỏi đáp (Week 9)

Các hệ thống hỏi đáp từ dựa trên retrieval đến generative QA (sử dụng LLM).

---

# BÀI TẬP TƯƠNG TỰ SLIDE - GIẢI CHI TIẾT

---

## BÀI TẬP CHƯƠNG 1: GIỚI THIỆU NLP

### Bài 1.1

**Đề bài:** Phân tích các mức độ nhập nhằng trong câu sau: "I walked to the bank to get money, but it was near the river bank."

**Lời giải:**

1. **Mức độ từ vựng (Lexical ambiguity)**: Từ "bank" xuất hiện 2 lần với 2 nghĩa khác nhau:
   - "bank" lần 1: ngân hàng (nơi lấy tiền)
   - "bank" lần 2: bờ sông (near the river)

2. **Mức độ cú pháp**: Không có nhập nhằng cú pháp rõ ràng trong câu này.

3. **Mức độ ngữ nghĩa**: Mối quan hệ nguyên nhân - kết quả ("to get money") tạo ra sự mong đợi về nghĩa ngân hàng cho "bank" đầu tiên. Người đọc dùng ngữ cảnh để phân giải nghĩa.

4. **Mức độ ngữ dụng**: Sự chuyển đổi từ "bank" (ngân hàng) sang "bank" (bờ sông) tạo ra yếu tố bất ngờ, dựa trên kiến thức thế giới về vị trí của các tòa nhà ngân hàng so với sông.

---

### Bài 1.2

**Đề bài:** Giải thích sự khác biệt giữa NLP và Computational Linguistics.

**Lời giải:**

| Tiêu chí | NLP | Computational Linguistics |
|----------|-----|---------------------------|
| **Mục tiêu** | Phát triển chương trình giải quyết các vấn đề thực tế của ngôn ngữ | Sử dụng công nghệ để hỗ trợ/hiện thực hóa ngôn ngữ học |
| **Câu hỏi chính** | Làm sao để máy tính hiểu/sinh ngôn ngữ hiệu quả? | Làm sao để hiểu được ngôn ngữ? Làm sao để sinh ngôn ngữ? |
| **Ứng dụng** | Dịch máy, nhận dạng giọng nói, chatbot, phân tích cảm xúc | Mô hình hóa lý thuyết ngôn ngữ, nghiên cứu nhận thức |
| **Tính chất** | Hướng ứng dụng, công nghiệp | Hướng lý thuyết, học thuật |

---

## BÀI TẬP CHƯƠNG 2: MÔ HÌNH NGÔN NGỮ

### Bài 2.1 (Tương tự slide Week 2 - Bài tập bigram)

**Đề bài:** Cho tập dữ liệu văn bản gồm các câu sau:

```
<s> cô ấy dạy môn tin học </s>
<s> anh dạy môn toán </s>
<s> cô ấy học toán anh ấy dạy </s>
<s> môn toán môn tin đều hay </s>
<s> anh ấy dạy môn toán hay môn tin </s>
```

**Yêu cầu:**

a) Xây dựng mô hình ngôn ngữ unigram và bigram (tính xác suất).

b) Tính xác suất của câu `<s> cô ấy học môn tin </s>` bằng mô hình bigram.

**Lời giải:**

**Bước 1: Thống kê tần suất**

Tách token đơn giản theo khoảng trắng:

- Câu 1: `<s>`, `cô`, `ấy`, `dạy`, `môn`, `tin`, `học`, `</s>`
- Câu 2: `<s>`, `anh`, `dạy`, `môn`, `toán`, `</s>`
- Câu 3: `<s>`, `cô`, `ấy`, `học`, `toán`, `anh`, `ấy`, `dạy`, `</s>`
- Câu 4: `<s>`, `môn`, `toán`, `môn`, `tin`, `đều`, `hay`, `</s>`
- Câu 5: `<s>`, `anh`, `ấy`, `dạy`, `môn`, `toán`, `hay`, `môn`, `tin`, `</s>`

Tổng số token: 8 + 6 + 9 + 8 + 10 = 41 token

**a) Mô hình Unigram:**

| Từ | Count | P(từ) = count/41 |
|-----|-------|------------------|
| cô | 2 | 2/41 |
| ấy | 3 | 3/41 |
| dạy | 4 | 4/41 |
| môn | 5 | 5/41 |
| tin | 3 | 3/41 |
| học | 2 | 2/41 |
| anh | 2 | 2/41 |
| toán | 4 | 4/41 |
| đều | 1 | 1/41 |
| hay | 2 | 2/41 |
| <s> | 5 | 5/41 |
| </s> | 5 | 5/41 |

**Mô hình Bigram:**

Bảng tần suất bigram (một số cặp quan trọng):

| Bigram | Count |
|--------|-------|
| (<s>, cô) | 2 |
| (<s>, anh) | 2 |
| (<s>, môn) | 1 |
| (cô, ấy) | 2 |
| (ấy, dạy) | 2 |
| (ấy, học) | 1 |
| (dạy, môn) | 3 |
| (môn, tin) | 3 |
| (môn, toán) | 2 |
| (tin, học) | 1 |
| (tin, đều) | 1 |
| (học, </s>) | 1 |
| (học, toán) | 1 |
| (anh, dạy) | 1 |
| (anh, ấy) | 1 |
| (toán, </s>) | 2 |
| (toán, anh) | 1 |
| (toán, hay) | 1 |
| (đều, hay) | 1 |
| (hay, </s>) | 1 |
| (hay, môn) | 1 |

Xác suất bigram: $P(w_i|w_{i-1}) = \frac{count(w_{i-1}, w_i)}{count(w_{i-1})}$

Ví dụ:

- $P(cô | <s>) = 2/5 = 0.4$
- $P(ấy | cô) = 2/2 = 1.0$
- $P(dạy | ấy) = 2/3 \approx 0.667$
- $P(môn | dạy) = 3/4 = 0.75$
- $P(tin | môn) = 3/5 = 0.6$

**b) Tính xác suất câu: `<s> cô ấy học môn tin </s>`**

Sử dụng bigram:

$$
\begin{aligned}
P(\text{câu}) &= P(cô | <s>) \times P(ấy | cô) \times P(học | ấy) \\
&\quad \times P(môn | học) \times P(tin | môn) \times P(</s> | tin) \\
&= \frac{2}{5} \times \frac{2}{2} \times \frac{1}{3} \times \frac{0}{2} \times \frac{3}{5} \times \frac{1}{3}
\end{aligned}
$$

*Vấn đề: Bigram (học, môn) không xuất hiện trong tập huấn luyện! Count = 0 → xác suất = 0.*

**Xử lý bằng Laplace Smoothing:**

Kích thước từ vựng V = 12 (các token độc nhất).

Với Laplace:

$$
P_{Laplace}(môn | học) = \frac{count(học, môn) + 1}{count(học) + V} = \frac{0 + 1}{2 + 12} = \frac{1}{14} \approx 0.0714
$$

Tính lại toàn bộ với Laplace:

$$
\begin{aligned}
P(cô | <s>) &= \frac{2+1}{5+12} = \frac{3}{17} \\
P(ấy | cô) &= \frac{2+1}{2+12} = \frac{3}{14} \\
P(học | ấy) &= \frac{1+1}{3+12} = \frac{2}{15} \\
P(môn | học) &= \frac{0+1}{2+12} = \frac{1}{14} \\
P(tin | môn) &= \frac{3+1}{5+12} = \frac{4}{17} \\
P(</s> | tin) &= \frac{1+1}{3+12} = \frac{2}{15}
\end{aligned}
$$

$$
P(\text{câu}) = \frac{3}{17} \times \frac{3}{14} \times \frac{2}{15} \times \frac{1}{14} \times \frac{4}{17} \times \frac{2}{15} \approx 0.00000284
$$

---

### Bài 2.2 (Tương tự slide Week 2 - Perplexity)

**Đề bài:** Cho một mô hình bigram đã được tính toán trên tập kiểm tra có 100 từ với xác suất trung bình mỗi từ là $P(w_i|w_{i-1}) = 0.1$. Tính perplexity của mô hình này.

**Lời giải:**

$$
PP(W) = \left( \prod_{i=1}^{N} \frac{1}{P(w_i|w_{i-1})} \right)^{\frac{1}{N}} = \left( \frac{1}{0.1^{100}} \right)^{\frac{1}{100}} = \left( 10^{100} \right)^{0.01} = 10
$$

**Ý nghĩa:** Mô hình này có perplexity bằng 10, tức là tại mỗi bước nó phải "chọn" giữa khoảng 10 từ có khả năng xuất hiện như nhau.

---

### Bài 2.3 (Tương tự slide Week 2 - Tính toán xác suất câu)

**Đề bài:** Cho một số cặp bigram đã được chuẩn hóa:

- $P(I | <s>) = 0.25$
- $P(want | I) = 0.33$
- $P(english | want) = 0.0011$
- $P(food | english) = 0.5$
- $P(</s> | food) = 0.68$

Tính xác suất câu: "I want English food"

**Lời giải:**

$$
\begin{aligned}
P(\text{câu}) &= P(I|<s>) \times P(want|I) \times P(english|want) \times P(food|english) \times P(</s>|food) \\
&= 0.25 \times 0.33 \times 0.0011 \times 0.5 \times 0.68 \\
&= 0.00003069 \approx 3.069 \times 10^{-5}
\end{aligned}
$$

---

## BÀI TẬP CHƯƠNG 3: HMM & POS TAGGING

### Bài 3.1 (Tương tự slide Week 3 - Chuỗi Markov)

**Đề bài:** Cho một mẫu thời tiết với 3 trạng thái: Hot (H), Cold (C), Mild (M). Xác suất ban đầu và ma trận chuyển trạng thái như sau:

$$
\pi = [0.5, 0.3, 0.2]
$$

Ma trận chuyển trạng thái A:

|   | H   | C   | M   |
|---|-----|-----|-----|
| **H** | 0.6 | 0.2 | 0.2 |
| **C** | 0.3 | 0.5 | 0.2 |
| **M** | 0.4 | 0.3 | 0.3 |

Tính xác suất của chuỗi thời tiết: **H - M - C - H**

**Lời giải:**

Áp dụng công thức xác suất chuỗi Markov:

$$
\begin{aligned}
P(H, M, C, H) &= P(H) \times P(M|H) \times P(C|M) \times P(H|C) \\
&= \pi_H \times A_{H,M} \times A_{M,C} \times A_{C,H} \\
&= 0.5 \times 0.2 \times 0.3 \times 0.3 \\
&= 0.009
\end{aligned}
$$

---

### Bài 3.2 (Tương tự slide Week 3 - Bài tập HMM Forward)

**Đề bài:** Jason ăn kem mỗi ngày với số lượng tùy thuộc vào thời tiết. Có 2 trạng thái thời tiết ẩn: Hot (H) và Cold (C). Jason quan sát số kem ăn được: 1, 2, hoặc 3 cây.

Tham số mô hình HMM:

- $\pi = [P(H)=0.8, P(C)=0.2]$
- Ma trận chuyển trạng thái A:

|   | H   | C   |
|---|-----|-----|
| **H** | 0.6 | 0.4 |
| **C** | 0.5 | 0.5 |

- Ma trận phát xạ B (xác suất ăn số kem biết thời tiết):

|   | 1   | 2   | 3   |
|---|-----|-----|-----|
| **H** | 0.2 | 0.4 | 0.4 |
| **C** | 0.5 | 0.4 | 0.1 |

Tính xác suất để Jason ăn chuỗi kem: **O = (3, 1, 3)** sử dụng thuật toán Forward.

**Lời giải:**

**Bước 1: Khởi tạo (t = 1, $o_1 = 3$)**

$$
\begin{aligned}
\alpha_1(H) &= \pi_H \times P(3|H) = 0.8 \times 0.4 = 0.32 \\
\alpha_1(C) &= \pi_C \times P(3|C) = 0.2 \times 0.1 = 0.02
\end{aligned}
$$

**Bước 2: Đệ quy (t = 2, $o_2 = 1$)**

$$
\begin{aligned}
\alpha_2(H) &= [\alpha_1(H) \times P(H|H) + \alpha_1(C) \times P(H|C)] \times P(1|H) \\
&= [0.32 \times 0.6 + 0.02 \times 0.5] \times 0.2 \\
&= [0.192 + 0.01] \times 0.2 \\
&= 0.202 \times 0.2 = 0.0404
\end{aligned}
$$

$$
\begin{aligned}
\alpha_2(C) &= [\alpha_1(H) \times P(C|H) + \alpha_1(C) \times P(C|C)] \times P(1|C) \\
&= [0.32 \times 0.4 + 0.02 \times 0.5] \times 0.5 \\
&= [0.128 + 0.01] \times 0.5 \\
&= 0.138 \times 0.5 = 0.069
\end{aligned}
$$

**Bước 3: Đệ quy (t = 3, $o_3 = 3$)**

$$
\begin{aligned}
\alpha_3(H) &= [\alpha_2(H) \times P(H|H) + \alpha_2(C) \times P(H|C)] \times P(3|H) \\
&= [0.0404 \times 0.6 + 0.069 \times 0.5] \times 0.4 \\
&= [0.02424 + 0.0345] \times 0.4 \\
&= 0.05874 \times 0.4 = 0.023496
\end{aligned}
$$

$$
\begin{aligned}
\alpha_3(C) &= [\alpha_2(H) \times P(C|H) + \alpha_2(C) \times P(C|C)] \times P(3|C) \\
&= [0.0404 \times 0.4 + 0.069 \times 0.5] \times 0.1 \\
&= [0.01616 + 0.0345] \times 0.1 \\
&= 0.05066 \times 0.1 = 0.005066
\end{aligned}
$$

**Bước 4: Kết thúc**

$$
P(O|\lambda) = \alpha_3(H) + \alpha_3(C) = 0.023496 + 0.005066 = 0.028562
$$

**Kết luận:** Xác suất Jason ăn chuỗi kem (3, 1, 3) là khoảng **0.0286** (khoảng 2.86%).

---

### Bài 3.3 (Tương tự slide Week 3 - Thuật toán Viterbi)

**Đề bài:** Sử dụng lại mô hình HMM ở Bài 3.2. Tìm chuỗi thời tiết ẩn khả thi nhất nếu Jason ăn chuỗi kem **O = (3, 1, 3)**.

**Lời giải:**

**Bước 1: Khởi tạo (t = 1, $o_1 = 3$)**

$$
\begin{aligned}
v_1(H) &= \pi_H \times P(3|H) = 0.8 \times 0.4 = 0.32, \quad bt_1(H) = \text{null} \\
v_1(C) &= \pi_C \times P(3|C) = 0.2 \times 0.1 = 0.02, \quad bt_1(C) = \text{null}
\end{aligned}
$$

**Bước 2: Đệ quy (t = 2, $o_2 = 1$)**

Với H:

$$
\begin{aligned}
v_2(H) &= \max[v_1(H) \times P(H|H), v_1(C) \times P(H|C)] \times P(1|H) \\
&= \max[0.32 \times 0.6, 0.02 \times 0.5] \times 0.2 \\
&= \max[0.192, 0.01] \times 0.2 \\
&= 0.192 \times 0.2 = 0.0384
\end{aligned}
$$

$bt_2(H) = H$ (vì đường đi từ H có xác suất lớn hơn)

Với C:

$$
\begin{aligned}
v_2(C) &= \max[v_1(H) \times P(C|H), v_1(C) \times P(C|C)] \times P(1|C) \\
&= \max[0.32 \times 0.4, 0.02 \times 0.5] \times 0.5 \\
&= \max[0.128, 0.01] \times 0.5 \\
&= 0.128 \times 0.5 = 0.064
\end{aligned}
$$

$bt_2(C) = H$ (vì đường đi từ H có xác suất lớn hơn)

**Bước 3: Đệ quy (t = 3, $o_3 = 3$)**

Với H:

$$
\begin{aligned}
v_3(H) &= \max[v_2(H) \times P(H|H), v_2(C) \times P(H|C)] \times P(3|H) \\
&= \max[0.0384 \times 0.6, 0.064 \times 0.5] \times 0.4 \\
&= \max[0.02304, 0.032] \times 0.4 \\
&= 0.032 \times 0.4 = 0.0128
\end{aligned}
$$

$bt_3(H) = C$ (vì đường đi từ C có xác suất lớn hơn)

Với C:

$$
\begin{aligned}
v_3(C) &= \max[v_2(H) \times P(C|H), v_2(C) \times P(C|C)] \times P(3|C) \\
&= \max[0.0384 \times 0.4, 0.064 \times 0.5] \times 0.1 \\
&= \max[0.01536, 0.032] \times 0.1 \\
&= 0.032 \times 0.1 = 0.0032
\end{aligned}
$$

$bt_3(C) = C$

**Bước 4: Kết thúc**

$$
P^* = \max[v_3(H), v_3(C)] = \max[0.0128, 0.0032] = 0.0128
$$

Chuỗi trạng thái tối ưu bắt đầu từ H tại t=3.

**Truy vết ngược:**

- t=3: H -> $bt_3(H) = C$
- t=2: C -> $bt_2(C) = H$
- t=1: H

**Chuỗi thời tiết tối ưu: H - C - H**

---

### Bài 3.4 (Tương tự slide Week 3 - Huấn luyện HMM có giám sát)

**Đề bài:** Cho tập dữ liệu gán nhãn như sau (chỉ xét các nhãn: DT, NN, VB):

```
<s> the cat sat </s>    -> DT NN VB
<s> the dog ran </s>    -> DT NN VB
<s> a cat ran </s>      -> DT NN VB
```

Tính các xác suất chuyển trạng thái và phát xạ.

**Lời giải:**

**Xác suất chuyển trạng thái:**

Đếm các cặp nhãn liên tiếp (thêm `<s>` và `</s>`):

Các chuỗi nhãn: `<s> DT NN VB </s>` (x3)

| Cặp nhãn | Count |
|----------|-------|
| (<s>, DT) | 3 |
| (DT, NN) | 3 |
| (NN, VB) | 3 |
| (VB, </s>) | 3 |

Tần suất nhãn: `<s>`:3, DT:3, NN:3, VB:3, `</s>`:3`

$$
\begin{aligned}
P(DT | <s>) &= 3/3 = 1.0 \\
P(NN | DT) &= 3/3 = 1.0 \\
P(VB | NN) &= 3/3 = 1.0 \\
P(</s> | VB) &= 3/3 = 1.0
\end{aligned}
$$

**Xác suất phát xạ:**

| Từ | Nhãn | Count |
|-----|------|-------|
| the | DT | 2 |
| a | DT | 1 |
| cat | NN | 2 |
| dog | NN | 1 |
| sat | VB | 1 |
| ran | VB | 2 |

$$
\begin{aligned}
P(\text{the} | DT) &= 2/3 \\
P(\text{a} | DT) &= 1/3 \\
P(\text{cat} | NN) &= 2/3 \\
P(\text{dog} | NN) &= 1/3 \\
P(\text{sat} | VB) &= 1/3 \\
P(\text{ran} | VB) &= 2/3
\end{aligned}
$$

---

## BÀI TẬP CHƯƠNG 4: PHÂN TÍCH CÚ PHÁP

### Bài 4.1 (Tương tự slide Week 4 - Xác định ngôn ngữ của văn phạm)

**Đề bài:** Cho văn phạm $G = (\{a, b\}, \{X\}, X, \{X \rightarrow \varepsilon, X \rightarrow aXb, X \rightarrow XX\})$. Xác định ngôn ngữ $L(G)$.

**Lời giải:**

Phân tích các luật:

- $X \rightarrow \varepsilon$: sinh chuỗi rỗng.
- $X \rightarrow aXb$: sinh các cặp a và b cân bằng, a đứng trước b.
- $X \rightarrow XX$: phép ghép (concatenation) của hai chuỗi con sinh từ X.

Thực hiện suy diễn:

- $n=0$: $X \Rightarrow \varepsilon$
- $n=1$: $X \Rightarrow aXb \Rightarrow a\varepsilon b = ab$
- $n=2$: $X \Rightarrow aXb \Rightarrow aaXbb \Rightarrow aabb$
- $n=3$: $X \Rightarrow XX \Rightarrow aXb \cdot aXb \Rightarrow ab \cdot ab = abab$

Chuỗi sinh từ $aXb$ đảm bảo số lượng $a$ và $b$ bằng nhau và mọi $a$ nằm bên trái $b$ tương ứng. Phép $XX$ cho phép nối các chuỗi loại $a^n b^n$ lại với nhau.

**Kết luận:**

$$
L(G) = \{w \in \{a, b\}^* \mid \text{mọi tiền tố của } w \text{ có số } a \geq \text{số } b, \text{ và tổng số } a = \text{tổng số } b\}
$$

Hoặc có thể viết đơn giản hơn: tập hợp các chuỗi có thể phân tích thành các đoạn dạng $a^n b^n$ ($n \geq 0$) nối tiếp nhau.

---

### Bài 4.2 (Tương tự slide Week 4 - Vẽ cây cú pháp nhập nhằng)

**Đề bài:** Cho văn phạm:

```
S  -> NP VP
VP -> V NP
VP -> VP PP
PP -> P NP
NP -> NP PP
NP -> 'I' | 'sushi' | 'chopsticks'
V  -> 'eat'
P  -> 'with'
```

Và câu: "I eat sushi with chopsticks"

Vẽ ít nhất 2 cây cú pháp thành phần khả thi và tính xác suất mỗi cây với PCFG có:

- $P(S \rightarrow NP\ VP) = 1.0$
- $P(VP \rightarrow V\ NP) = 0.7$
- $P(VP \rightarrow VP\ PP) = 0.3$
- $P(PP \rightarrow P\ NP) = 1.0$
- $P(NP \rightarrow NP\ PP) = 1.0$
- Xác suất các luật sinh từ vựng (terminal) = 1.0.

**Lời giải:**

**Cây 1:** `[[I] [eat [sushi] [with [chopsticks]]]]` - VP -> V NP, rồi NP -> NP PP.

Cấu trúc đúng hơn:

```
              S
            /   \
          NP     VP
          |     /|\
          I    V  NP  PP
               |  |  /|\
              eat sushi P  NP
                     |   |
                   with chopsticks
```

Cây này tương ứng với: "tôi ăn sushi (mà sushi được ăn bằng đũa)" hoặc "tôi ăn sushi cùng với đũa" - nghĩa là "sushi with chopsticks" là 1 NP.

Các luật sử dụng:

- $S \rightarrow NP\ VP$ (1.0)
- $VP \rightarrow V\ NP$ (0.7)
- $NP \rightarrow NP\ PP$ (1.0)
- $PP \rightarrow P\ NP$ (1.0)
- Các luật sinh từ vựng: I, eat, sushi, with, chopsticks.

$$
P(\tau_1) = 1.0 \times 0.7 \times 1.0 \times 1.0 \times 1.0 = 0.7
$$

**Cây 2:** `[[I] [[eat sushi] [with chopsticks]]` - VP -> VP PP.

Cấu trúc chi tiết:

```
              S
            /   \
          NP     VP
          |     /|\
          I    VP  PP
              /|\  /|\
             V  NP P  NP
             |  |  |   |
            eat sushi with chopsticks
```

Các luật sử dụng:

- $S \rightarrow NP\ VP$ (1.0)
- $VP \rightarrow VP\ PP$ (0.3)
- $VP \rightarrow V\ NP$ (0.7)
- $PP \rightarrow P\ NP$ (1.0)

$$
P(\tau_2) = 1.0 \times 0.3 \times 0.7 \times 1.0 = 0.21
$$

**So sánh:** $P(\tau_1) = 0.7 > P(\tau_2) = 0.21$, nên bộ phân tích sẽ chọn **Cây 1**.

---

### Bài 4.3 (Tương tự slide Week 4 - Thuật toán CKY)

**Đề bài:** Cho văn phạm CNF:

```
S  -> NP VP
NP -> DT NN
NP -> NN
VP -> VB NP
VP -> VB
DT -> 'the'
NN -> 'cat' | 'dog'
VB -> 'chased' | 'sat'
```

Phân tích câu: "the cat sat" bằng thuật toán CKY. Điền bảng CKY và xác định câu có đúng ngữ pháp không.

**Lời giải:**

Câu có 3 từ: "the" (w1), "cat" (w2), "sat" (w3). Ma trận CKY kích thước $4 \times 4$.

**Bước 1: Khởi tạo đường chéo (span = 1)**

- Ô [0,1]: "the" -> DT
- Ô [1,2]: "cat" -> NN
- Ô [2,3]: "sat" -> VB

Bảng sau bước khởi tạo:

| i\j | 1   | 2   | 3   |
|-----|-----|-----|-----|
| **0** | DT  |     |     |
| **1** |     | NN  |     |
| **2** |     |     | VB  |

**Bước 2: Điền span = 2**

- Ô [0,2]: "the cat" - xét k=1
  - [0,1] chứa DT, [1,2] chứa NN
  - Có luật NP -> DT NN -> Điền **NP** vào [0,2]

- Ô [1,3]: "cat sat" - xét k=2
  - [1,2] chứa NN, [2,3] chứa VB
  - Không có luật nào có vế phải là NN VB -> Ô trống

| i\j | 1   | 2   | 3   |
|-----|-----|-----|-----|
| **0** | DT  | NP  |     |
| **1** |     | NN  |     |
| **2** |     |     | VB  |

**Bước 3: Điền span = 3 (ô [0,3])**

Ô [0,3]: "the cat sat" - xét k=1 và k=2.

- k=1: [0,1]={DT}, [1,3]={} -> Không có luật
- k=2: [0,2]={NP}, [2,3]={VB}
  - Có luật VP -> VB NP? Không, luật là VP -> VB NP (VB trước NP).
  - [2,3] = VB, [0,2] = NP. Không khớp vì thứ tự bị đảo.

*Vậy không có cách nào sinh S từ [0,3]?*

Hãy kiểm tra lại: thứ tự trong câu là "the cat sat". Nếu VP -> VB thì chỉ có [2,3]=VB. Khi đó S -> NP VP cần NP ở [0,2] và VP ở [2,3]. [0,2] = NP và [2,3] = VB. Nhưng VB không phải VP.

Ta cần luật VP -> VB. Giả sử thêm luật `VP -> VB` vào văn phạm (như trong phiên bản chuẩn):

- [2,3] = VB, áp dụng VP -> VB -> [2,3] có thêm VP
- Bây giờ tại k=2: [0,2]={NP}, [2,3]={VP} -> S -> NP VP -> Điền **S** vào [0,3]

**Kết quả cuối cùng:**

| i\j | 1   | 2   | 3   |
|-----|-----|-----|-----|
| **0** | DT  | NP  | **S** |
| **1** |     | NN  |     |
| **2** |     |     | VB, VP|

**Kết luận:** Câu "the cat sat" **đúng ngữ pháp** vì ô [0,3] chứa S.

---

### Bài 4.4 (Tương tự slide Week 4 - Chuyển đổi sang CNF)

**Đề bài:** Chuyển văn phạm sau về dạng chuẩn Chomsky (CNF):

```
S  -> NP VP PP
NP -> DT NN | 'John'
VP -> V NP | V
PP -> P NP
DT -> 'the'
NN -> 'cat'
V  -> 'chased' | 'sat'
P  -> 'on'
```

**Lời giải:**

Trong CNF, mọi luật chỉ có 2 dạng: $A \rightarrow B\ C$ hoặc $A \rightarrow a$.

Các luật cần sửa:

1. $S \rightarrow NP\ VP\ PP$ (3 non-terminals)
2. $NP \rightarrow DT\ NN$ (đã đúng - giữ nguyên)
3. $VP \rightarrow V\ NP$ (đã đúng)
4. $VP \rightarrow V$ (đã đúng nếu coi V là terminal? Không, V là non-terminal)

**Cách chuyển đổi:**

**1. Xử lý luật S -> NP VP PP:**

Thêm non-terminal tạm thời, ví dụ VP1:

```
S   -> NP VP1
VP1 -> VP PP
```

**2. Xử lý luật VP -> V:**

Nếu V chỉ dẫn đến terminal (chased, sat), ta có thể thay trực tiếp:

```
VP -> 'chased' | 'sat'
```

Hoặc nếu V cần được giữ làm non-terminal cho tính tổng quát:

```
VP -> V
V  -> 'chased' | 'sat'
```

Luật $VP \rightarrow V$ có vế phải 1 non-terminal. Cần sửa lại: hoặc giữ nguyên nếu hệ thống cho phép, hoặc thay bằng các luật terminal trực tiếp.

**Văn phạm sau khi chuyển đổi CNF:**

```
S   -> NP VP1
VP1 -> VP PP
NP  -> DT NN
NP  -> 'John'
VP  -> 'chased'
VP  -> 'sat'
PP  -> P NP
DT  -> 'the'
NN  -> 'cat'
P   -> 'on'
```

Kiểm tra:

- $S \rightarrow NP\ VP1$: 2 non-terminals -> hợp lệ
- $VP1 \rightarrow VP\ PP$: 2 non-terminals -> hợp lệ
- $NP \rightarrow DT\ NN$: 2 non-terminals -> hợp lệ
- $NP \rightarrow John$: 1 terminal -> hợp lệ
- Các luật còn lại đều dạng $A \rightarrow a$ -> hợp lệ

**Kết luận:** Văn phạm đã chuyển đổi thành công về CNF.

---

## BÀI TẬP TỔNG HỢP

### Bài 5.1:

**Đề bài:** So sánh mô hình N-gram và Neural Language Model. Trong trường hợp nào mỗi mô hình phù hợp hơn?

**Lời giải:**

| Tiêu chí | N-gram | Neural Language Model |
|----------|--------|---------------------|
| **Độ phức tạp** | Đơn giản, dễ cài đặt | Phức tạp, cần nhiều tính toán |
| **Dữ liệu** | Cần nhiều dữ liệu để ước lượng tin cậy | Có thể học từ dữ liệu vừa phải nhờ embedding |
| **Tổng quát hóa** | Kém, không biết từ tương tự | Tốt, hiểu được từ tương tự qua embedding |
| **Phụ thuộc xa** | Chỉ nhìn n từ trước | RNN/Transformer có thể bắt phụ thuộc xa |
| **Giải thích** | Dễ giải thích | Khó giải thích (hộp đen) |
| **Ứng dụng** | Hệ thống nhỏ, real-time, baseline | Hệ thống hiện đại, chất lượng cao |

**Phù hợp:**

- **N-gram**: Hệ thống cần tính toán nhanh, nguồn lực hạn chế, hoặc làm baseline.
- **Neural LM**: Ứng dụng yêu cầu chất lượng cao, có đủ tài nguyên tính toán, hoặc cần hiểu ngữ cảnh dài.

---

### Bài 5.2:

**Đề bài:** Trong HMM cho POS tagging, tại sao ta không đơn giản là gán cho mỗi từ nhãn có tần suất cao nhất trong từ điển (most frequent tag)?

**Lời giải:**

Gán nhãn dựa trên tần suất đơn lẻ (baseline greedy) có độ chính xác khoảng 90% nhờ sử dụng thống kê unigram, nhưng thất bại trong các trường hợp:

1. **Nhập nhằng từ vựng**: Từ "book" có thể là NN hoặc VB tùy ngữ cảnh.
   - "I want to **book** a flight" -> VB
   - "I read a **book**" -> NN

2. **Phụ thuộc ngữ cảnh**: HMM (và Viterbi) xét cả chuỗi nhãn, không chỉ từng từ riêng lẻ.
   - Xác suất chuyển trạng thái $P(t_i | t_{i-1})$ giúp hạn chế các nhãn không hợp lý về mặt cú pháp.
   - Ví dụ: sau mạo từ DT thì rất khó có động từ VB, mà thường là danh từ NN.

3. **Tối ưu toàn cục**: Viterbi tìm chuỗi nhãn có xác suất đồng thời cao nhất cho CÂU, không phải chọn tốt nhất cục bộ cho từng TỪ. Có thể một từ gán nhãn "sai" cục bộ nhưng giúp chuỗi tổng thể tốt hơn.

---

## TÀI LIỆU THAM KHẢO

- Speech and Language Processing, Daniel Jurafsky & James H. Martin, 3rd ed. (draft).
- Foundations of Statistical Natural Language Processing, Manning & Schutze, 2001.
- Neural Network Methods in Natural Language Processing, Yoav Goldberg, 2017.
- Slide bài giảng Khoa Trí tuệ Nhân tạo - ThS. Võ Ngọc Bích Uyên.
