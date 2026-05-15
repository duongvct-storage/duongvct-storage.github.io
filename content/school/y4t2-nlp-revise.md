---
title: Y4T2-NLP Ôn tập chi tiết
keywords: [nlp, revise, exam]
date: 2026-05-12
theme: nlp
description:
  Ôn tập xử lý ngôn ngữ tự nhiên - giải chi tiết đề cương
---

# Ôn tập Xử lý ngôn ngữ tự nhiên

**Hình thức:** Tự luận - **Thời gian:** 90ph - **Cấu trúc:** 2 câu lý thuyết + 2 câu bài tập



## Phần 1: Lý thuyết (4đ)

### Chương 1: Giới thiệu NLP

**Câu 1. NLP là gì? Kể tên 3 ứng dụng phổ biến của NLP trong đời sống hiện nay.**

**NLP (Natural Language Processing)** là một nhánh của trí tuệ nhân tạo và ngôn ngữ học tính toán, nghiên cứu về vấn đề sinh ngôn ngữ tự động và hiểu ngôn ngữ con người. NLP bao gồm hai mảng chính:

- **NLU (Natural Language Understanding):** Chuyển đổi ngôn ngữ con người thành biểu diễn để máy tính xử lý.
- **NLG (Natural Language Generation):** Chuyển đổi thông tin từ cơ sở dữ liệu thành ngôn ngữ giống con người.

**3 ứng dụng phổ biến:**

1. **Dịch máy (Machine Translation):** Google Translate, ChatGPT dịch văn bản giữa các ngôn ngữ.
2. **Trợ lý ảo/Chatbot:** ChatGPT, Google Assistant, Alexa, Siri — hiểu và phản hồi hội thoại.
3. **Phân tích quan điểm (Sentiment Analysis):** Phân loại đánh giá sản phẩm thành tích cực/tiêu cực trên các nền tảng thương mại điện tử.



**Câu 2. Tại sao sự nhập nhằng lại là thách thức lớn nhất của NLP? Cho ví dụ về nhập nhằng từ vựng trong tiếng Việt.**

**Nhập nhằng (Ambiguity)** là hiện tượng một câu/cụm từ có nhiều cách hiểu khác nhau. Đây là thách thức lớn nhất của NLP vì:

- Ngôn ngữ con người nhập nhằng ở nhiều mức độ khác nhau.
- Cùng một câu có thể có nhiều cách phân tích hợp lệ, nhưng chỉ một cách đúng trong ngữ cảnh cụ thể.
- Máy tính không có tri thức nền tảng như con người để khử nhập nhằng.
- Nhập nhằng xuất hiện ở hầu hết mọi bài toán NLP: tách từ, POS tagging, parsing, dịch máy.

**Các mức độ nhập nhằng trong NLP (theo slide bài giảng):**

**1. Nhập nhằng mức từ (Word segmentation ambiguity):**

Một câu có thể có n khả năng tách từ, nhưng chỉ 1 trong chúng là đúng.

- "Học_sinh học_sinh_học" (học sinh học môn sinh học)
- "Học_sinh học sinh_học" (học sinh học tập sinh học)

**2. Nhập nhằng trong gán nhãn từ loại (POS tagging ambiguity):**

"Con ngựa đá con ngựa đá."
- Con_ngựa / đá / con_ngựa / đá
  DT     ĐgT   DT

"Ông già đi nhanh quá."
- Cách 1: Ông / già / đi / nhanh / quá
          ĐaT  TT   PT   TT     trạng_từ
- Cách 2: Ông_già / đi / nhanh / quá
            DT     ĐgT   TT     trạng_từ

**3. Nhập nhằng ở mức độ âm thanh (Phonetic ambiguity):**

- "… a computer that understands you **like** your mother"
- "… a computer that understands you **lie cured** mother"

**4. Nhập nhằng ở mức độ cú pháp (Syntactic ambiguity):**

Một câu có thể có nhiều cấu trúc cú pháp khác nhau.

**5. Nhập nhằng ở mức độ từ vựng (Lexical ambiguity):**

- "I walked to the bank …"
  - … of the river. (bờ sông)
  - … to get money. (ngân hàng)

- "I work for John Hancock …"
  - … and he is a good boss. (tên người)
  - … which is a good company. (tên công ty)

**Ví dụ nhập nhằng từ vựng trong tiếng Việt:**

- "Con ngựa đá con ngựa đá" có thể hiểu là: "Con_ngựa đá con_ngựa đá" (con ngựa dùng chân đá con ngựa đang đá).
- "Học_sinh học sinh_học" (học sinh học môn sinh học) vs "Học_sinh học_sinh học" (học sinh học tập sinh học).
- "Ông già đi nhanh quá" có thể là "Ông_già đi nhanh quá" (DT ĐgT TT) hoặc "Ông già đi nhanh quá" (ĐaT TT PT).



### Chương 2: Gán nhãn từ loại & HMM

**Câu 3. Gán nhãn từ loại (POS Tagging) là gì? Tại sao cần gán nhãn từ loại? Nêu ít nhất 01 ứng dụng thực tế.**

**Định nghĩa:**

POS Tagging (Part-of-Speech tagging) là quá trình gán cho mỗi từ trong câu một nhãn từ loại tương ứng (danh từ, động từ, tính từ,...).

- **Input:** 1 đoạn văn bản đã tách từ + tập nhãn (tagset)
- **Output:** cách gán nhãn chính xác nhất cho mọi token

**Bản chất — bài toán khử nhập nhằng:**

POS tagging là một bài toán khử nhập nhằng (disambiguation): mỗi từ có thể thuộc nhiều từ loại khác nhau, mục tiêu là tìm ra nhãn đúng trong ngữ cảnh cụ thể.

Ví dụ từ "that" trong tiếng Anh (theo slide):

- "Book **that** fight" → **verb** (động từ)
- "Hand me **that** book" → **determiner** (mạo từ)
- "Does **that** flight serve dinner?" → **determiner** (mạo từ)
- "I thought **that** your flight was earlier" → **complementizer** (bổ ngữ)

**Lớp từ (Word classes) — kiến thức nền tảng:**

Theo slide bài giảng, từ được chia làm 2 lớp chính:

| Lớp | Đặc điểm | Ví dụ |
|-----|---------|-------|
| **Lớp đóng (Closed class)** — từ chức năng | Số lượng cố định, từ ngắn, xuất hiện thường xuyên, có chức năng ngữ pháp | Giới từ (on, under, over), mạo từ (a, an, the), đại từ (I, you, she), liên từ, trợ động từ |
| **Lớp mở (Open class)** — từ nội dung | Có thể thêm từ mới | Danh từ, động từ, tính từ, trạng từ (vd: iPhone) |

**Tại sao cần POS tagging?** (theo slide)

1. **Dễ thực hiện:** có thể thực hiện bằng nhiều phương pháp khác nhau; các phương pháp sử dụng ngữ cảnh có thể đem lại kết quả tốt.
2. **Dễ đánh giá:** đếm số thẻ được gán nhãn đúng.
3. **Là bước tiền xử lý quan trọng** cho hầu hết các tác vụ NLP khác.

**Ứng dụng thực tế** (theo slide):

- **Text-to-speech:** Phân biệt cách phát âm dựa vào từ loại. VD: "record" là danh từ (ˈrekɔːd) hay động từ (rɪˈkɔːd); "lead" là danh từ (led) hay động từ (liːd).
- **Tiền xử lý cho phân tích cú pháp (Parsing):** PTCP thực hiện việc gán nhãn tốt hơn nhưng đắt hơn.
- **Nhận dạng tiếng nói (Speech Recognition), tìm kiếm (Search), trích xuất thông tin.**

**Bộ nhãn phổ biến:**

Penn Treebank POS tagset — bộ nhãn được sử dụng rộng rãi, gồm tập các nhãn đại diện cho từng từ loại hoặc phạm trù ngữ pháp, được xây dựng để chú giải tập ngữ liệu tiếng Anh lớn với thông tin cú pháp và cấu trúc.



**Câu 4. Mô hình Markov ẩn (HMM) bao gồm những thành phần nào khi áp dụng cho bài toán POS tagging? Mô tả ý nghĩa từng thành phần.**

HMM cho POS tagging gồm 3 thành phần chính:

| Thành phần | Ký hiệu | Ý nghĩa |
|-----------|---------|---------|
| Xác suất khởi đầu | π = $P(t₁)$ | Xác suất một nhãn từ loại xuất hiện ở đầu câu |
| Ma trận chuyển trạng thái | A = $P(t_i | t_{i-1})$ | Xác suất nhãn hiện tại khi biết nhãn trước đó |
| Ma trận phát xạ | B = $P(w_i | t_i)$ | Xác suất một từ được sinh ra khi biết nhãn của nó |

Ngoài ra còn có:

- **Q:** Tập các trạng thái ẩn (các nhãn từ loại) — không quan sát được.
- **O:** Chuỗi quan sát (các từ trong câu) — quan sát được.

**Công thức HMM cho POS tagging:**
```
P(t₁..tₙ, w₁..wₙ) = P(t₁) × ∏ P(tᵢ|tᵢ₋₁) × P(wᵢ|tᵢ)
```



**Câu 5. Phân biệt từ lớp mở (open class) với lớp đóng (closed class). Tại sao sự phân chia này quan trọng trong POS tagging?**

| Tiêu chí | Open Class (Lớp mở) | Closed Class (Lớp đóng) |
|----------|--------------------|------------------------|
| Khả năng thêm từ mới | Có thể (VD: iPhone, selfie) | Cố định, ít thay đổi |
| Chức năng | Mang nội dung chính (content words) | Chức năng ngữ pháp (function words) |
| Số lượng | Nhiều, tăng theo thời gian | Hạn chế |
| Độ dài từ | Thường dài hơn | Thường ngắn |
| Ví dụ | Danh từ, động từ, tính từ, trạng từ | Giới từ, mạo từ, đại từ, liên từ |

**Tầm quan trọng trong POS tagging:**

- Closed class có số lượng nhỏ và ổn định → dễ xây dựng từ điển, dự đoán chính xác hơn.
- Open class có số lượng lớn và biến động → khó xử lý từ mới (OOV), cần các kỹ thuật đặc biệt.
- Hỗ trợ khử nhập nhằng: một từ có thể vừa là open vừa là closed → dựa vào ngữ cảnh để quyết định.



**Câu 6. Tại sao backpointer là cần thiết cho thuật toán Viterbi? Nếu bỏ backpointer đi, thuật toán có thể tính được xác suất cao nhất không?**

**Vai trò của backpointer:**

- Thuật toán Viterbi tìm chuỗi trạng thái có xác suất cao nhất Q\* = argmax $P(O, Q|λ)$.
- **v-table:** lưu xác suất tối đa đến trạng thái j tại thời điểm t: $v_j(t) = \max P(q_1,\ldots,q_{t-1}, o_1,\ldots,o_t, q_t=j)$
- **Backpointer (bp-table):** lưu trạng thái trước đó (tại t-1) dẫn đến trạng thái j tại t có xác suất max.
- Sau khi tính forward pass (v-table), backpointer cho phép **truy vết ngược (backtrace)** để khôi phục lại chuỗi trạng thái tối ưu.

**Nếu bỏ backpointer:**

- Vẫn tính được **giá trị xác suất** của chuỗi trạng thái tốt nhất (P\* = max v_T(i)).
- Nhưng **không thể khôi phục** chuỗi trạng thái cụ thể nào đã đạt được xác suất đó.
- Trong POS tagging, ta cần biết nhãn cụ thể cho từng từ → backpointer là bắt buộc.



**Câu 7. Phân tích nguyên nhân "unknown words" gây vấn đề trong HMM và đề xuất phương pháp xử lý.**

**Nguyên nhân:**

- HMM dùng ước lượng MLE: $P(w_i|t_i) = \operatorname{count}(t_i, w_i) / \operatorname{count}(t_i)$.
- Nếu từ w không xuất hiện với nhãn t nào trong tập huấn luyện → $P(w|t)$ = 0 với mọi t.
- Khi gặp unknown word ở test, tất cả các chuỗi nhãn đều có xác suất = 0.
- HMM không có cơ chế tận dụng thông tin hình thái (hậu tố, tiền tố) của từ.

**Phương pháp xử lý:**

1. **Thay thế từ hiếm bằng `<UNK>`:** Trong tập train, thay các từ xuất hiện ≤ k lần bằng token `<UNK>`. Huấn luyện HMM với `<UNK>` như một từ bình thường. Ở test, unknown word được xem là `<UNK>`.
2. **Làm trơn (Smoothing):** Cộng thêm một lượng nhỏ vào mọi xác suất phát xạ để tránh xác suất = 0.
3. **Dùng đặc trưng hình thái:** Xây dựng bộ phân loại phụ dựa vào hậu tố (-tion → danh từ, -ly → trạng từ) để đoán nhãn khả dĩ cho unknown word.
4. **Dùng mô hình mạnh hơn:** CRF, RNN/LSTM có thể học đặc trưng từ ký tự (character-level features) để xử lý OOV tốt hơn.



### Chương 3: Mô hình ngôn ngữ

**Câu 8. Mô hình N-gram là gì? Công thức tính xác suất của câu sử dụng bigram, trigram.**

**Mô hình N-gram** là mô hình ngôn ngữ xác suất, tính xác suất một câu W = w₁w₂...wₙ dựa trên giả định Markov bậc N-1 (từ thứ i chỉ phụ thuộc vào N-1 từ trước nó).

**Bigram (N=2):**
```
P(w₁w₂...wₙ) = P(w₁|<s>) × P(w₂|w₁) × P(w₃|w₂) × ... × P(wₙ|wₙ₋₁) × P(</s>|wₙ)
```
hay tổng quát:
```
P(w₁w₂...wₙ) ≈ ∏ P(wᵢ | wᵢ₋₁)
```

**Trigram (N=3):**
```
P(w₁w₂...wₙ) = P(w₁|<s><s>) × P(w₂|<s>w₁) × P(w₃|w₁w₂) × ... × P(wₙ|wₙ₋₂wₙ₋₁) × P(</s>|wₙ₋₁wₙ)
```

**Công thức MLE cho bigram:**
```
P(wᵢ | wᵢ₋₁) = count(wᵢ₋₁, wᵢ) / count(wᵢ₋₁)
```



**Câu 9. Phát biểu giả thuyết Markov bậc n trong mô hình ngôn ngữ N-gram. Tại sao giả thuyết này quan trọng?**

**Giả thuyết Markov bậc n:** Xác suất của một từ chỉ phụ thuộc vào n từ đứng ngay trước nó, không cần xét toàn bộ lịch sử.

```
P(wₘ | w₁w₂...wₘ₋₁) ≈ P(wₘ | wₘ₋ₙ...wₘ₋₁)
```

- **Unigram** = Markov bậc 0 (không phụ thuộc từ nào)
- **Bigram** = Markov bậc 1 (phụ thuộc 1 từ trước)
- **Trigram** = Markov bậc 2 (phụ thuộc 2 từ trước)

**Tầm quan trọng:**

- Nếu không có giả thuyết này, phải ước lượng $P(w_m | w_1...w_{m-1})$ với số lượng lịch sử khổng lồ (Vᵐ cách).
- Giả thuyết Markov làm giảm độ phức tạp từ O(Vᵐ) xuống O(Vⁿ⁺^{1}) — khả thi để tính toán.
- Giúp mô hình ngôn ngữ có thể học từ dữ liệu hữu hạn.



**Câu 10. Giải thích cơ chế làm trơn Laplace (Add-one smoothing). Tại sao phương pháp này đôi khi "quá tay" với tập dữ liệu lớn?**

**Cơ chế:** Cộng 1 vào mọi giá trị đếm của bigram để đảm bảo không có bigram nào có xác suất = 0.

```
P_Laplace(wᵢ | wᵢ₋₁) = (count(wᵢ₋₁, wᵢ) + 1) / (count(wᵢ₋₁) + V)
```
Trong đó V là kích thước từ vựng.

**Vấn đề "quá tay":**

- Với tập dữ liệu lớn, V rất lớn (hàng chục nghìn từ).
- Mỗi bigram xuất hiện được cộng 1, nhưng phải chia cho ($\operatorname{count}(w_{i-1})$ + V).
- Bigram xuất hiện nhiều (VD: count = 200) bị giảm xác suất mạnh (từ 200/200 → 201/(200+V)).
- Lượng xác suất bị lấy đi từ các bigram đã xuất hiện là rất lớn, phân bổ cho hàng chục nghìn bigram chưa xuất hiện → gây sai lệch nghiêm trọng.

→ **Giải pháp:** Dùng **Add-k smoothing** (cộng k nhỏ như 0.01, 0.001) hoặc các phương pháp phức tạp hơn (Backoff, Interpolation).



**Câu 11. Định nghĩa chỉ số perplexity (PP). Mối quan hệ giữa xác suất tập kiểm tra và perplexity?**

**Perplexity** là thước đo đánh giá chất lượng mô hình ngôn ngữ. PP là nghịch đảo của xác suất trên tập test, được chuẩn hóa theo số từ:

```
PP(W) = P(w₁w₂...wₙ)^{-1/N}
      = (∏ P(wᵢ | w₁...wᵢ₋₁))^{-1/N}
```

**Với bigram:**
```
PP(W) = (∏ P(wᵢ | wᵢ₋₁))^{-1/N}
```

**Mối quan hệ:**

- PP tỉ lệ nghịch với xác suất tập test: xác suất càng cao → PP càng thấp → mô hình càng tốt.
- PP phản ánh số lượng lựa chọn trung bình cho từ tiếp theo. PP = k nghĩa là mô hình "phân vân" giữa trung bình k từ ở mỗi bước.
- Giảm thiểu perplexity = tối đa hóa xác suất.



**Câu 12. Phân biệt đánh giá trong (intrinsic evaluation) và đánh giá ngoài (extrinsic evaluation).**

| Tiêu chí | Intrinsic Evaluation | Extrinsic Evaluation |
|----------|---------------------|---------------------|
| Cách đo | Trực tiếp trên mô hình ngôn ngữ (perplexity) | Qua tác vụ cụ thể (sửa lỗi, dịch máy,...) |
| Dữ liệu | Test set độc lập | Hệ thống ứng dụng |
| Ưu điểm | Nhanh, rẻ, dễ so sánh | Đo được giá trị thực tế |
| Nhược điểm | Không phản ánh hiệu quả thực tế | Tốn thời gian, tài nguyên |
| Ví dụ | Tính PP trên test set | Dùng mô hình cho spell checking, đo % lỗi sửa đúng |



**Câu 13. Tại sao xác suất mô hình ngôn ngữ thường được tính và lưu dưới dạng Log-probability?**

**2 lý do chính:**

1. **Tránh underflow số học:** Xác suất thô luôn ≤ 1, tích của nhiều xác suất rất nhỏ → dễ về 0 do giới hạn biểu diễn floating-point. Log-probability là số âm có độ lớn vừa phải.
2. **Cộng nhanh hơn nhân:** $\log(a \times b) = \log(a) + \log(b)$. Cộng nhanh hơn nhân trong tính toán.

```
log P(câu) = Σ log P(wᵢ | wᵢ₋₁)
```



### Chương 4: Phân tích quan điểm & Trích xuất đặc trưng

**Câu 14. Giải thích sự khác biệt giữa Term Frequency (TF) và TF-IDF.**

| Đặc trưng | TF (Term Frequency) | TF-IDF |
|-----------|--------------------|--------|
| Công thức | $\operatorname{count}(t, d)$ | $\operatorname{count}(t, d)$ × log(N/df(t)) |
| Ý nghĩa | Tần suất từ trong văn bản | Tần suất từ, điều chỉnh bởi độ hiếm trong toàn corpus |
| Vấn đề | Thiên lệch về văn bản dài, từ phổ biến | Giảm trọng số từ phổ biến khắp nơi |
| Công thức IDF | — | IDF(t) = log(N / df(t)) với N = tổng số văn bản, df(t) = số văn bản chứa t |

TF-IDF cân bằng giữa:

- **TF:** từ xuất hiện nhiều trong văn bản → quan trọng với văn bản đó.
- **IDF:** từ xuất hiện ở nhiều văn bản → không có giá trị phân biệt → giảm trọng số.



**Câu 15. Phân tích quan điểm là gì? Lấy 03 ứng dụng thực tế.**

**Phân tích quan điểm (Sentiment Analysis)** là quá trình phát hiện thái độ (tích cực, tiêu cực, trung tính) của người viết đối với một đối tượng, sự kiện hoặc con người.

**3 ứng dụng thực tế:**

1. **Đánh giá sản phẩm/dịch vụ:** Phân loại review trên Shopee, Lazada, Amazon thành tích cực/tiêu cực để tổng hợp đánh giá.
2. **Đo lường tâm lý công chúng:** Phân tích tweet về ứng viên chính trị, dự đoán xu hướng bầu cử.
3. **Dự đoán thị trường tài chính:** Phân tích tin tức, bài báo để dự đoán xu hướng chứng khoán.



**Câu 16. So sánh Count Vectorization và TF-IDF. Khi nào nên dùng TF-IDF thay vì Count?**

| Tiêu chí | Count Vectorization | TF-IDF |
|----------|-------------------|--------|
| Giá trị | Số đếm raw count | TF × IDF |
| Trọng số từ phổ biến | Cao (càng nhiều càng cao) | Giảm (do IDF nhỏ) |
| Trọng số từ hiếm | Thấp (nếu ít xuất hiện) | Tăng (do IDF lớn) |
| Khả năng phân biệt | Kém (từ "the" có count lớn) | Tốt (từ "the" bị giảm) |

**Khi nào dùng TF-IDF:**

- Dữ liệu có nhiều từ dừng (stop words) xuất hiện phổ biến khắp nơi.
- Cần giảm ảnh hưởng của các từ không mang nhiều ý nghĩa phân loại.
- Bài toán phân loại văn bản, tìm kiếm thông tin (information retrieval).

**Khi nào dùng Count:**

- Dữ liệu đã được lọc stop word kỹ.
- Muốn giữ nguyên tần suất thực tế (VD: đếm số lần xuất hiện).
- Bài toán đơn giản, muốn tốc độ tính toán nhanh.



**Câu 17. Bạn đang xây dựng mô hình phân loại quan điểm. Liệt kê ít nhất 3 kỹ thuật tiền xử lý cơ bản và 3 loại đặc trưng có thể dùng.**

**3 kỹ thuật tiền xử lý:**

1. **Chuẩn hóa (Normalization):** Chuyển chữ hoa → thường, xóa thẻ HTML/URL, chuẩn hóa từ viết tắt.
2. **Loại bỏ stop word:** Xóa các từ không mang ý nghĩa cảm xúc ("và", "là", "của", "the", "a").
3. **Tách từ (Tokenization):** Chia câu thành các token (unigram/bigram/n-gram).

**3 loại đặc trưng:**

1. **Bag of Words (BoW) / Unigram:** Tần suất từng từ xuất hiện trong văn bản.
2. **TF-IDF:** Tần suất từ có điều chỉnh theo độ hiếm.
3. **Từ thể hiện quan điểm (Lexicon-based features):** Đếm số từ tích cực, tiêu cực dựa trên từ điển sentiment kết hợp với từ phủ định (VD: "không tốt" → đảo ngược sentiment).



### Chương 5: Phân tích cú pháp

**Câu 18. Trình bày định nghĩa văn phạm phi ngữ cảnh (CFG) và 5 thành phần cấu thành.**

**CFG (Context-Free Grammar)** là văn phạm cấu trúc đoạn, gồm 5 thành phần:

| Thành phần | Ký hiệu | Mô tả | Ví dụ |
|-----------|---------|-------|-------|
| Tập ký hiệu kết thúc | T | Các từ thực tế | {John, saw, the, dog} |
| Tập ký hiệu không kết thúc | N | Các cụm ngữ pháp | {S, NP, VP, Det, N, V} |
| Ký hiệu khởi đầu | S | Điểm bắt đầu | S |
| Tập luật sinh | R | Luật dạng A → γ | S → NP VP, VP → V NP |
| Ký hiệu tiền kết thúc | P ⊂ N | Viết lại thành từ | N → "dog", V → "saw" |

**Dạng luật:** A → γ, trong đó A ∈ N, γ ∈ (T ∪ N)*.



**Câu 19. Phân biệt constituency parsing và dependency parsing.**

| Tiêu chí | Constituency Parsing | Dependency Parsing |
|----------|--------------------|--------------------|
| Đầu vào | Câu + CFG | Câu |
| Đầu ra | Cây cấu trúc đoạn (phrase structure tree) | Cây phụ thuộc (dependency tree) |
| Đơn vị | Các cụm từ (NP, VP, PP) lồng nhau | Mối quan hệ trực tiếp giữa các từ |
| Số nút | Nhiều nút trung gian (phrases) | N nút (mỗi từ là 1 nút) |
| Quan hệ | Cấu trúc: "What goes with what" | Phụ thuộc: "What depends on what" |
| Nhãn | Nhãn cụm từ (NP, VP...) | Nhãn quan hệ (nsubj, dobj...) |

**Khác biệt cốt lõi:**

1. Constituency gom từ thành cụm → cụm lớn hơn; Dependency nối trực tiếp các từ bằng quan hệ phụ thuộc.
2. Constituency cần CFG + cây nhị phân; Dependency chỉ cần từ và nhãn quan hệ.



**Câu 20. So sánh top-down và bottom-up trong phân tích cú pháp. Thuật toán CKY thuộc chiến lược nào?**

| Tiêu chí | Top-down | Bottom-up |
|----------|---------|-----------|
| Hướng tìm kiếm | Từ S (gốc) xuống từ/câu | Từ câu lên S (gốc) |
| Khởi đầu | Ký hiệu S | Xâu từ cần phân tích |
| Cách hoạt động | Viết lại ký hiệu đích bằng luật | Khớp vế phải luật → thay bằng vế trái |
| Văn phạm đệ quy trái | Bất lợi, dễ loop vô hạn | Không bị ảnh hưởng |
| Điểm mạnh | Có định hướng, biết mục tiêu | Xử lý được đệ quy trái |
| Điểm yếu | Dễ loop với đệ quy trái, lãng phí khi khởi tạo sai | Có thể sinh nhiều cấu trúc vô nghĩa |

**CKY:** Thuộc chiến lược **bottom-up + dynamic programming**.

- CKY khắc phục nhược điểm của bottom-up thuần bằng cách **lưu kết quả trung gian vào bảng** → tránh tính toán lặp lại.
- Yêu cầu văn phạm ở dạng CNF (Chomsky Normal Form): A → BC (2 non-terminal) hoặc A → a (1 terminal).
- Độ phức tạp O(n^{3}|G|).



**Câu 21. Phân biệt CKY Recognition và CKY Parsing.**

| Tiêu chí | CKY Recognition | CKY Parsing |
|----------|----------------|-------------|
| Mục tiêu | "Câu có đúng ngữ pháp không?" (Yes/No) | "Cấu trúc câu thế nào?" (Vẽ cây) |
| Thông tin lưu | Tập non-terminal có thể sinh chuỗi con | Non-terminal + backpointer đến ô con |
| Bảng CKY | Chỉ lưu nhãn | Lưu nhãn + con trỏ backpointer |
| Khai thác kết quả | Kiểm tra S ∈ cell[0, n] | Truy vết ngược từ cell[0, n] → cây |

**Khi nào dùng:**

- **Recognition:** Kiểm tra hợp lệ ngữ pháp, tối ưu bộ nhớ (không cần lưu backpointer).
- **Parsing:** Cần hiển thị cây cú pháp, xử lý nhập nhằng (nhiều cây).



### Chương 6: Word Embeddings & Ngữ nghĩa từ vựng

**Câu 22. Giải thích thuật toán word2vec. Trong word2vec, một từ có một vector duy nhất hay nhiều vector phụ thuộc ngữ cảnh?**

**Word2Vec:** Là phương pháp học word embedding (vector từ dày đặc) từ corpus lớn. Có 2 kiến trúc:

1. **CBOW (Continuous Bag of Words):** Dự đoán từ trung tâm từ các từ ngữ cảnh xung quanh.
   - Input: các từ ngữ cảnh (one-hot) → embedding → trung bình → dự đoán từ trung tâm.
   - Nhanh, tốt với từ phổ biến.

2. **Skip-gram:** Dự đoán các từ ngữ cảnh từ từ trung tâm.
   - Input: từ trung tâm → embedding → dự đoán từ ngữ cảnh.
   - Tốt với tập nhỏ, biểu diễn tốt từ hiếm.
   - Thường dùng Negative Sampling để giảm chi phí tính toán.

**Một từ có một vector duy nhất trong word2vec.** Đây là hạn chế: từ "bank" (bờ sông/ngân hàng) chỉ có một vector dù mang nghĩa khác nhau theo ngữ cảnh. Các mô hình hiện đại như ELMo, BERT giải quyết vấn đề này bằng **contextual embeddings** (vector động phụ thuộc ngữ cảnh).



**Câu 23. Ngữ nghĩa từ vựng nghiên cứu vấn đề gì? Phân biệt "nghĩa của từ" (word sense) với "từ" (word form).**

**Ngữ nghĩa từ vựng (Lexical Semantics)** nghiên cứu:

- Quan hệ từ vựng: sự liên hệ ngữ nghĩa giữa các từ (đồng nghĩa, trái nghĩa,...).
- Ràng buộc về lựa chọn (selectional restrictions): cấu trúc ngữ nghĩa bên trong từ.
- Phân loại và phân rã nghĩa của từ.
- Sự khác biệt cấu trúc từ vựng - ngữ nghĩa giữa các ngôn ngữ.

**Phân biệt:**

- **Word form (từ):** Hình thức (âm thanh/chữ viết) của từ. VD: "bank" là một word form.
- **Word sense (nghĩa của từ):** Một khía cạnh ý nghĩa riêng biệt. VD: "bank" có các senses: (1) bờ sông, (2) ngân hàng, (3) nghiêng máy bay.

Một word form có thể có nhiều word senses (hiện tượng đa nghĩa/đồng âm).



**Câu 24. Trình bày 4 hiện tượng quan hệ nghĩa cơ bản: đồng âm, đa nghĩa, đồng nghĩa, trái nghĩa. Lấy ví dụ.**

| Hiện tượng | Định nghĩa | Đặc điểm | Ví dụ |
|-----------|-----------|---------|-------|
| **Đồng âm (Homonymy)** | Từ giống hình thức, khác nghĩa, không liên quan | Nghĩa không có mối liên hệ lịch sử | "cá" (động vật) & "cá" (cá cược); "saw" (cưa) & "saw" (thấy - quá khứ) |
| **Đa nghĩa (Polysemy)** | Một từ nhiều nghĩa có liên quan | Nghĩa có chung gốc, mở rộng | "đi" (di chuyển) & "đi" (chết); "mặt trời" (thiên thể) & "mặt trời" (nguồn sáng) |
| **Đồng nghĩa (Synonymy)** | Từ khác nhau về âm, tương đồng về nghĩa | Có thể thay thế trong một số ngữ cảnh | "car" & "automobile"; "cố" & "gắng" |
| **Trái nghĩa (Antonymy)** | Nghĩa đối lập trên cùng đặc điểm | Đối lập nhị phân hoặc hai đầu thang đo | "hot" & "cold"; "tối" & "sáng" |



### Chương 7: Trích xuất thông tin

**Câu 25. Trình bày bài toán NER: đầu vào, đầu ra, các loại thực thể phổ biến và nhãn tương ứng.**

**NER (Named Entity Recognition):** Định vị và phân loại thực thể có tên trong văn bản.

- **Đầu vào:** Văn bản chưa gán nhãn + tập nhãn.
- **Đầu ra:** Văn bản đã gán nhãn với các thực thể được đánh dấu.

**Các loại thực thể và nhãn (theo lược đồ BIO):**

| Thực thể | Nhãn B (Begin) | Nhãn I (Inside) | Ví dụ |
|----------|---------------|-----------------|-------|
| Người (Person) | B-PER | I-PER | B-PER Nguyễn I-PER Văn I-PER A |
| Tổ chức (Organization) | B-ORG | I-ORG | B-ORG Google I-ORG LLC |
| Địa điểm (Location) | B-LOC | I-LOC | B-LOC Hà I-LOC Nội |
| Thời gian (Date) | B-DATE | I-DATE | B-DATE 12/ I-DATE 05/ I-DATE 2026 |
| O (Outside) | O (không phải thực thể) | O | Các từ thông thường |

**Ví dụ:**
```
Hà Nội là thủ đô của Việt Nam
B-LOC  O  O    O     B-LOC
```



**Câu 26. Trích xuất thông tin (IE) là gì? Nêu sự khác biệt giữa IE và IR.**

**IE (Information Extraction):** Tự động tìm và trích chọn thông tin có cấu trúc từ văn bản phi cấu trúc. Mục tiêu: xây dựng biểu diễn có cấu trúc (database) phục vụ máy tính phân tích.

**Khác biệt IE và IR:**

| Tiêu chí | IE (Trích xuất) | IR (Truy xuất) |
|----------|----------------|----------------|
| Mục tiêu | Trích thông tin cụ thể, có cấu trúc | Tìm văn bản/tài liệu liên quan |
| Đầu ra | Thông tin có cấu trúc (quan hệ, thực thể) | Danh sách tài liệu |
| Độ sâu xử lý | Phân tích sâu (POS, parsing, NER) | So khớp từ khóa/ngữ nghĩa bề mặt |
| Ví dụ | "Apple được thành lập năm 1976" → (ORG, founded_year, 1976) | Tìm kiếm "lịch sử Apple" → danh sách trang web |



### Chương 8: Hỏi đáp & RAG

**Câu 27. Trình bày bài toán hỏi đáp tự động. Lấy ví dụ 3 dạng câu hỏi, trả lời tương ứng.**

**Hỏi đáp tự động (Question Answering):** Xây dựng hệ thống tự động trả lời câu hỏi bằng ngôn ngữ tự nhiên dựa trên nguồn thông tin (văn bản, CSDL, CSTT).

**3 dạng câu hỏi và trả lời:**

| Dạng | Ví dụ câu hỏi | Câu trả lời |
|------|--------------|-------------|
| **Factoid (WH)** | "Thủ đô của Việt Nam là gì?" | "Hà Nội" |
| **Yes/No** | "Paris có phải thủ đô nước Pháp không?" | "Có" |
| **Định nghĩa** | "Bệnh bạch cầu là gì?" | "Bệnh bạch cầu là một loại ung thư máu..." |



**Câu 28. Mô tả kiến trúc hai giai đoạn Retriever-Reader. Nêu rõ đầu vào, đầu ra và nhiệm vụ của từng thành phần.**

```
Input: Large document set D + Question Q
                    ↓
          ┌─────────┴─────────┐
          │    RETRIEVER      │  Nhiệm vụ: Tìm K đoạn văn có liên quan
          └─────────┬─────────┘
                    ↓
          ┌─────────┴─────────┐
          │      READER       │  Nhiệm vụ: Đọc hiểu, trích câu trả lời
          └─────────┬─────────┘
                    ↓
          Output: Answer A
```

| Thành phần | Đầu vào | Đầu ra | Nhiệm vụ chính |
|-----------|---------|--------|---------------|
| **Retriever** | Tập tài liệu D + Câu hỏi Q | K đoạn văn liên quan nhất (P₁,...,P_K) | Tìm kiếm nhanh các đoạn có khả năng chứa câu trả lời (VD: TF-IDF, DPR) |
| **Reader** | Câu hỏi Q + K đoạn văn | Câu trả lời A | Đọc hiểu, trích xuất/spans câu trả lời chính xác từ đoạn văn (VD: BiDAF, BERT) |



**Câu 29. Trình bày các đặc điểm chính của bộ dữ liệu SQuAD.**

| Đặc điểm | Mô tả |
|----------|-------|
| Tên đầy đủ | Stanford Question Answering Dataset |
| Quy mô | ~100,000 mẫu (đoạn văn, câu hỏi, câu trả lời đã gán nhãn) |
| Nguồn gốc | English Wikipedia, mỗi đoạn ~100-150 từ |
| Định dạng câu trả lời | Xâu ngắn (span) trích từ đoạn văn |
| Số câu trả lời/câu hỏi | 3 đáp án mẫu (do nhiều người gán nhãn) |
| Hạn chế | Không phải mọi câu hỏi đều có câu trả lời dạng span → giới hạn cho QA ngoài miền |



**Câu 30. Trình bày ba bước cơ bản của hệ thống Naive RAG.**

**RAG (Retrieval-Augmented Generation)** kết hợp truy hồi và sinh văn bản để cải thiện chất lượng LLM.

| Bước | Đầu vào | Đầu ra | Kỹ thuật chính |
|------|---------|--------|---------------|
| **1. Indexing** | Tập tài liệu gốc | Chỉ mục (index) có thể truy vấn | Chunking văn bản → Embedding → Lưu vào Vector DB |
| **2. Retrieval** | Câu hỏi Q + Index | K đoạn văn liên quan | Embed câu hỏi → Tìm K-NN trong Vector DB |
| **3. Generation** | Câu hỏi Q + K đoạn văn | Câu trả lời hoàn chỉnh | Prompt = Question + Context → LLM sinh câu trả lời |



## Phần 2: Bài tập (6đ)

### Bài tập 1: HMM cho POS Tagging

**Đề:** Cho corpus gồm 4 câu đã được gán nhãn từ loại (POS tags). Mỗi câu gồm một chuỗi **từ** (quan sát được) và một chuỗi **nhãn** (trạng thái ẩn):

| # | Câu (chuỗi từ) | Nhãn tương ứng (chuỗi trạng thái) |
|---|----------------|-----------------------------------|
| 1 | `<s>` she likes fish `</s>` | `<s>` PRO VERB NOUN `</s>` |
| 2 | `<s>` he eats rice `</s>` | `<s>` PRO VERB NOUN `</s>` |
| 3 | `<s>` she eats fish `</s>` | `<s>` PRO VERB NOUN `</s>` |
| 4 | `<s>` he likes rice `</s>` | `<s>` PRO VERB NOUN `</s>` |

Trong đó:
- **Từ vựng (observations):** V = {she, he, likes, eats, fish, rice}
- **Trạng thái ẩn (hidden states):** Q = {PRO, VERB, NOUN, `<s>`, `</s>`}
  - PRO = đại từ (pronoun), VERB = động từ, NOUN = danh từ
  - `<s>` = bắt đầu câu, `</s>` = kết thúc câu

**a) Tính ma trận chuyển trạng thái A (bao gồm `<s>` và `</s>`).**

Ma trận A chứa xác suất chuyển từ nhãn này sang nhãn tiếp theo: $P(t_i | t_{i-1})$.

Đếm số lần xuất hiện các cặp (nhãn trước, nhãn sau) trong 4 câu:

| Nhãn trước → Nhãn sau | `<s>` | PRO | VERB | NOUN | `</s>` |
|----------------------|-------|-----|------|------|--------|
| `<s>` | 0 | 4 | 0 | 0 | 0 |
| PRO | 0 | 0 | 4 | 0 | 0 |
| VERB | 0 | 0 | 0 | 4 | 0 |
| NOUN | 0 | 0 | 0 | 0 | 4 |
| `</s>` | 0 | 0 | 0 | 0 | 0 |

Giải thích:
- `<s>` xuất hiện 4 lần (đầu mỗi câu), và sau `<s>` luôn là nhãn PRO → P(PRO|`<s>`) = $4/4 = 1$
- PRO xuất hiện 4 lần, sau PRO luôn là VERB → $P(VERB|PRO)$ = $4/4 = 1$
- VERB xuất hiện 4 lần, sau VERB luôn là NOUN → $P(NOUN|VERB)$ = $4/4 = 1$
- NOUN xuất hiện 4 lần, sau NOUN luôn là `</s>` → P(`</s>`|NOUN) = $4/4 = 1$

**Ma trận A:**
```
         PRO   VERB  NOUN  <s>   </s>
PRO       0     1     0     0     0
VERB      0     0     1     0     0
NOUN      0     0     0     0     1
<s>       1     0     0     0     0
</s>      0     0     0     0     0
```

Xác suất khởi đầu π: P(PRO|`<s>`) = 1 (từ đầu tiên của mọi câu luôn là PRO)

**b) Tính ma trận phát xạ B.**

Ma trận B chứa xác suất một **từ** (quan sát) được sinh ra khi biết **nhãn** (trạng thái): $P(w_i | t_i)$.

Đếm số lần mỗi từ xuất hiện với mỗi nhãn:

| Từ | PRO | VERB | NOUN |
|----|-----|------|------|
| she | 2 | 0 | 0 |
| he | 2 | 0 | 0 |
| likes | 0 | 2 | 0 |
| eats | 0 | 2 | 0 |
| fish | 0 | 0 | 2 |
| rice | 0 | 0 | 2 |

Mỗi nhãn xuất hiện 4 lần:

- PRO gặp "she" 2 lần, "he" 2 lần → $P(she|PRO) = 2/4 = 0.5$, $P(he|PRO) = 2/4 = 0.5$
- VERB gặp "likes" 2 lần, "eats" 2 lần → $P(likes|VERB) = 2/4 = 0.5$, $P(eats|VERB) = 2/4 = 0.5$
- NOUN gặp "fish" 2 lần, "rice" 2 lần → $P(fish|NOUN) = 2/4 = 0.5$, $P(rice|NOUN) = 2/4 = 0.5$

**Ma trận B:**
```
        she    he     likes  eats   fish   rice
PRO     0.5    0.5     0      0      0      0
VERB     0      0     0.5    0.5     0      0
NOUN     0      0      0      0     0.5    0.5
```

**c) Tính xác suất đồng thời của câu "he likes rice" với chuỗi nhãn "PRO VERB NOUN".**

$$
\begin{aligned}
P(\text{"he likes rice"}, \text{"PRO VERB NOUN"}) = &\; P(PRO|\langle s\rangle) \\
&\times P(he|PRO) \\
&\times P(VERB|PRO) \\
&\times P(likes|VERB) \\
&\times P(NOUN|VERB) \\
&\times P(rice|NOUN) \\
&\times P(\langle/s\rangle|NOUN) \\
= &\; 1 \times 0.5 \times 1 \times 0.5 \times 1 \times 0.5 \times 1 \\
= &\; 0.125
\end{aligned}
$$

**d) Viterbi: tìm chuỗi nhãn tối ưu cho câu "she eats rice".**

Từ vựng: V = {she, he, likes, eats, fish, rice}
Trạng thái: PRO, VERB, NOUN (bỏ `<s>`, `</s>` trong vòng lặp)

**Khởi tạo (t=1, từ "she"):**

$$
\begin{aligned}
v_1(PRO) &= P(PRO|\langle s\rangle) \times P(she|PRO) = 1 \times 0.5 = 0.5 \\
v_1(VERB) &= P(VERB|\langle s\rangle) \times P(she|VERB) = 0 \times 0 = 0 \\
v_1(NOUN) &= P(NOUN|\langle s\rangle) \times P(she|NOUN) = 0 \times 0 = 0
\end{aligned}
$$

**Đệ quy (t=2, từ "eats"):**

$$
\begin{aligned}
v_2(PRO) &= \max\{v_1(PRO) \times P(PRO|PRO),\; v_1(VERB) \times P(PRO|VERB),\; v_1(NOUN) \times P(PRO|NOUN)\} \times P(eats|PRO) \\
        &= \max\{0.5 \times 0,\; 0 \times 0,\; 0 \times 0\} \times 0 = 0 \\[4pt]
v_2(VERB) &= \max\{v_1(PRO) \times P(VERB|PRO),\; v_1(VERB) \times P(VERB|VERB),\; v_1(NOUN) \times P(VERB|NOUN)\} \times P(eats|VERB) \\
         &= \max\{0.5 \times 1,\; 0 \times 0,\; 0 \times 0\} \times 0.5 = 0.5 \times 0.5 = 0.25 \\
         &\quad bp_2(VERB) = PRO \\[4pt]
v_2(NOUN) &= \max\{v_1(PRO) \times P(NOUN|PRO),\; v_1(VERB) \times P(NOUN|VERB),\; v_1(NOUN) \times P(NOUN|NOUN)\} \times P(eats|NOUN) \\
         &= \max\{0.5 \times 0,\; 0 \times 1,\; 0 \times 0\} \times 0 = 0
\end{aligned}
$$

**Đệ quy (t=3, từ "rice"):**

$$
\begin{aligned}
v_3(PRO) &= \max\{v_2(PRO) \times P(PRO|PRO),\; v_2(VERB) \times P(PRO|VERB),\; v_2(NOUN) \times P(PRO|NOUN)\} \times P(rice|PRO) \\
        &= \max\{0 \times 0,\; 0.25 \times 0,\; 0 \times 0\} \times 0 = 0 \\[4pt]
v_3(VERB) &= \max\{v_2(PRO) \times P(VERB|PRO),\; v_2(VERB) \times P(VERB|VERB),\; v_2(NOUN) \times P(VERB|NOUN)\} \times P(rice|VERB) \\
         &= \max\{0 \times 1,\; 0.25 \times 0,\; 0 \times 0\} \times 0 = 0 \\[4pt]
v_3(NOUN) &= \max\{v_2(PRO) \times P(NOUN|PRO),\; v_2(VERB) \times P(NOUN|VERB),\; v_2(NOUN) \times P(NOUN|NOUN)\} \times P(rice|NOUN) \\
         &= \max\{0 \times 0,\; 0.25 \times 1,\; 0 \times 0\} \times 0.5 = 0.25 \times 0.5 = 0.125 \\
         &\quad bp_3(NOUN) = VERB
\end{aligned}
$$

**Kết thúc:**

$$
P^* = \max_{1\le i\le N} v_3(i) = v_3(NOUN) = 0.125
$$
$$
q_3^* = NOUN
$$

**Truy vết ngược (backtrace):**

- t=3: NOUN, backpointer → VERB (t=2)
- t=2: VERB, backpointer → PRO (t=1)
- t=1: PRO

**Kết luận:** Chuỗi nhãn tối ưu cho câu "she eats rice" là **PRO → VERB → NOUN**.
Xác suất của chuỗi trạng thái này: **0.125**.



### Bài tập 2: N-gram Language Model

**Đề:** Corpus gồm 4 câu:
```
<s> em yêu học NLP </s>
<s> anh học NLP rất vui </s>
<s> em học rất chăm </s>
<s> anh yêu NLP </s>
```
Từ vựng V = {em, yêu, học, NLP, anh, rất, vui, chăm, `</s>`}, |V| = 9.

**a) Xây dựng mô hình unigram và bigram (không làm trơn).**

**Unigram:**

| Từ | Count | P |
|----|-------|---|
| em | 2 | 2/22 = 0.0909 |
| yêu | 2 | 2/22 = 0.0909 |
| học | 2 | 2/22 = 0.0909 |
| NLP | 3 | 3/22 = 0.1364 |
| anh | 2 | 2/22 = 0.0909 |
| rất | 2 | 2/22 = 0.0909 |
| vui | 1 | 1/22 = 0.0455 |
| chăm | 1 | 1/22 = 0.0455 |
| `<s>` | 4 | 4/22 = 0.1818 |
| `</s>` | 3 | 3/22 = 0.1364 |
| **Tổng** | **22** | **1** |

**Bigram:** Đếm số lần xuất hiện các cặp từ:

| | `</s>` | em | yêu | học | NLP | anh | rất | vui | chăm |
|---|--------|----|-----|-----|-----|-----|-----|-----|------|
| `<s>` | 0 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | 0 |
| em | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| yêu | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
| học | 2 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0 |
| NLP | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| anh | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| rất | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 |
| vui | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| chăm | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |

Xác suất bigram (MLE): $P(w_i|w_{i-1}) = \operatorname{count}(w_{i-1}, w_i) / \operatorname{count}(w_{i-1})$

Ví dụ:

- P(em|`<s>`) = 2/4 = 0.5
- P(anh|`<s>`) = 2/4 = 0.5
- $P(yêu|em)$ = 1/2 = 0.5
- $P(học|em)$ = 1/2 = 0.5
- $P(học|yêu)$ = 1/2 = 0.5
- $P(NLP|yêu)$ = 1/2 = 0.5
- ... (các xác suất khác tính tương tự)

**b) Tính P(`<s>` anh chăm học `</s>`) bằng bigram không làm trơn.**

```
P(<s> anh chăm học </s>)
= P(anh|<s>) × P(chăm|anh) × P(học|chăm) × P(</s>|học)
= 0.5 × P(chăm|anh) × P(học|chăm) × 2/?

P(chăm|anh) = count(anh, chăm) / count(anh) = 0/2 = 0
```

**Kết quả = 0.** Đây là vấn đề **zero probability**: bigram "anh chăm" và "chăm học" chưa xuất hiện trong tập huấn luyện → xác suất bằng 0.

**c) Unigram với làm trơn Laplace.**

Với V = 9:
```
P_Laplace(em) = (2+1)/(22+9) = 3/31 = 0.0968
P_Laplace(yêu) = (2+1)/31 = 3/31 = 0.0968
P_Laplace(học) = (2+1)/31 = 3/31 = 0.0968
P_Laplace(NLP) = (3+1)/31 = 4/31 = 0.1290
P_Laplace(anh) = (2+1)/31 = 3/31 = 0.0968
P_Laplace(rất) = (2+1)/31 = 3/31 = 0.0968
P_Laplace(vui) = (1+1)/31 = 2/31 = 0.0645
P_Laplace(chăm) = (1+1)/31 = 2/31 = 0.0645
P_Laplace(</s>) = (3+1)/31 = 4/31 = 0.1290
```

**d) Bigram với làm trơn Laplace cho P(`<s>` anh chăm học `</s>`).**

Công thức Laplace cho bigram:
```
P_Laplace(wᵢ|wᵢ₋₁) = (count(wᵢ₋₁, wᵢ) + 1) / (count(wᵢ₋₁) + V)
```
với V = 9.

```
P_Laplace(anh|<s>) = (count(<s>,anh) + 1) / (count(<s>) + 9) = (2+1)/(4+9) = 3/13 ≈ 0.2308

P_Laplace(chăm|anh) = (count(anh,chăm) + 1) / (count(anh) + 9) = (0+1)/(2+9) = 1/11 ≈ 0.0909

P_Laplace(học|chăm) = (count(chăm,học) + 1) / (count(chăm) + 9) = (0+1)/(1+9) = 1/10 = 0.1

P_Laplace(</s>|học) = (count(học,</s>) + 1) / (count(học) + 9) = (0+1)/(2+9) = 1/11 ≈ 0.0909
```

```
P(<s> anh chăm học </s>) = 3/13 × 1/11 × 1/10 × 1/11
                         = 3 / (13 × 11 × 10 × 11) = 3 / 15730 ≈ 0.00019
```

**e) Perplexity của mô hình bigram đã làm trơn trên câu "anh chăm học".**

Câu: `<s>` anh chăm học `</s>` (N = 4 từ, bỏ `<s>` vì là start token, tính từ sau `<s>`)

Perplexity cho bigram:
```
PP(W) = (P(w₁|<s>) × P(w₂|w₁) × P(w₃|w₂) × P(</s>|w₃))^(-1/N)
      = (3/13 × 1/11 × 1/10 × 1/11)^(-1/4)
      = (3/15730)^(-1/4)
      = (15730/3)^(1/4)
      = (5243.33)^(1/4)
      ≈ 8.52
```



### Bài tập 3: TF-IDF & Naive Bayes

**Đề:**
```
Positive: "good quality product" | "great value and quality"
Negative: "bad product poor value" | "very poor quality"
Test: "great quality product"
```

**a) Tính TF-IDF của "quality" trong D1 = "good quality product".**

4 documents: d1="good quality product", d2="great value and quality", d3="bad product poor value", d4="very poor quality"

- TF(quality, d1) = 1/3
- IDF(quality) = $\log(N/df) = \log(4/3) \approx \log(1.333) \approx 0.125$ (log base 10, hoặc ln)
- TF-IDF(quality, d1) = (1/3) × $\log(4/3)$ ≈ 0.333 × 0.125 ≈ 0.0416

**b) Naive Bayes (Laplace smoothing) phân loại câu test "great quality product".**

Từ vựng V = {good, quality, product, great, value, and, bad, poor, very} → |V| = 9

**Prior:**
$P(Pos)$ = 2/4 = 0.5
$P(Neg)$ = 2/4 = 0.5

**Likelihood (Laplace smoothing):** $P(w|c) = (\operatorname{count}(w, c) + 1) / (\sum \operatorname{count}(w', c) + |V|)$

Class Positive:

- Tổng số từ trong Pos = 7 (good, quality, product, great, value, and, quality)
- $P(good|Pos)$ = (1+1)/(7+9) = 2/16 = 0.125
- $P(quality|Pos)$ = (2+1)/(7+9) = 3/16 = 0.1875
- $P(product|Pos)$ = (1+1)/(7+9) = 2/16 = 0.125

Class Negative:

- Tổng số từ trong Neg = 7 (bad, product, poor, value, very, poor, quality)
- $P(great|Neg)$ = (0+1)/(7+9) = 1/16 = 0.0625
- $P(quality|Neg)$ = (1+1)/(7+9) = 2/16 = 0.125
- $P(product|Neg)$ = (1+1)/(7+9) = 2/16 = 0.125

**Tính posterior:**

$P(Pos|test)$ ∝ $P(Pos)$ × $P(great|Pos)$ × $P(quality|Pos)$ × $P(product|Pos)$
            ∝ 0.5 × 0.125 × 0.1875 × 0.125
            ∝ 0.5 × 0.00293 = 0.001465

$P(Neg|test)$ ∝ $P(Neg)$ × $P(great|Neg)$ × $P(quality|Neg)$ × $P(product|Neg)$
            ∝ 0.5 × 0.0625 × 0.125 × 0.125
            ∝ 0.5 × 0.000977 = 0.000488

**Kết luận:** $P(Pos|test)$ > $P(Neg|test)$ → Phân loại là **Positive**.

**c) Nếu câu test là "not a great quality product", nhận xét.**

Với "not a great quality product":

- "not" và "a" là unknown words (không xuất hiện trong train).
- Với Laplace smoothing, mỗi unknown word có $P(unk|c)$ = 1/16 = 0.0625 cho cả 2 lớp.
- Lớp Negative vẫn có $P(product|Neg) = P(quality|Neg)$, nhưng $P(great|Pos) > P(great|Neg)$.

Tuy nhiên, "not" thường đảo ngược nghĩa: "not great" → negative. Mô hình Naive Bayes không hiểu điều này vì nó chỉ dựa trên tần suất từ.

**Đề xuất:** Thêm kỹ thuật xử lý **phủ định (negation handling)**: khi gặp "not" (hoặc "no", "never"), thêm tiền tố "NOT_" vào từ theo sau (VD: "not great" → "NOT_great") để mô hình học được rằng "NOT_great" có xu hướng tiêu cực.



### Bài tập 4: CFG, CNF và CKY Parsing

**Đề:**
```
S → NP VP | VP
NP → Det N | NP PP | N
VP → V | V NP | VP PP
PP → P NP
Det → "một" | "con"
N → "mèo" | "chuột" | "bẫy"
V → "bắt" | "thấy"
P → "trong"
```

**a) Vẽ cây cú pháp cho "con mèo bắt con chuột trong bẫy".**

Cây 1 (VP → V NP, NP → NP PP - "bắt" kết hợp với "con chuột trong bẫy"):
```
         S
       /   \
     NP     VP
    / \    / | \
  Det  N  V  NP     PP
  |   |   | / \   /  \
  con mèo bắt NP  PP  P  NP
             / \ / \  |  |
           Det N P  NP trong bẫy
            |   |   |
            con chuột  N
                       |
                      bẫy
```
→ "con mèo bắt (con chuột trong bẫy)" — con chuột nằm trong bẫy

Cây 2 (VP → VP PP - PP bổ nghĩa cho VP "bắt con chuột"):
```
         S
       /   \
     NP     VP
    / \    / | \
  Det  N  VP PP  P  NP
  |   |  / \ / \ |  |
  con mèo V  NP P NP trong bẫy
          |  |  |  |
          bắt Det N  N
              |   |  |
              con  N bẫy
                   |
                 chuột
```
→ "con mèo (bắt con chuột) trong bẫy" — con mèo ở trong bẫy

**Hiện tượng nhập nhằng (PP attachment ambiguity):** PP "trong bẫy" có thể bổ nghĩa cho NP "con chuột" (chuột ở trong bẫy) hoặc VP "bắt con chuột" (hành động bắt diễn ra trong bẫy).

**b) Chuyển văn phạm con sang CNF:**
```
S → VP | NP VP
VP → V NP | V NP PP | ε
PP → P NP
```

**Bước 1: Loại ε-production (VP → ε)**
Thay VP bằng ε trong các luật có VP:

- S → VP | NP VP → S → ε | NP (do VP → ε)
- VP → V NP | V NP PP | ε

Thêm luật mới:
```
S → ε | NP
```
Giữ nguyên S → VP cho trường hợp VP không rỗng.

**Bước 2: Loại unit production (S → VP, S → NP)**

- S → VP: thay VP bằng các luật của VP → S → V NP | V NP PP
- S → NP: đã có

**Bước 3: Chuyển luật > 2 non-terminal về CNF**
VP → V NP PP → tạo non-terminal mới: VP → X PP, X → V NP

**Kết quả CNF:**
```
S → V NP | V NP PP | ε | NP
NP → N
VP → V NP | V NP PP
PP → P NP
V → "bắt"
N → "mèo" | "chuột"
P → "trong"
```

**c) CKY cho "mèo bắt chuột" với CNF rút gọn:**

Văn phạm CNF:
```
S → NP VP
NP → N
VP → V NP
N → "mèo" | "chuột"
V → "bắt"
```

Câu: w₁=mèo, w₂=bắt, w₃=chuột

Bảng CKY 3×3 (tam giác trên):

```
            j=1          j=2          j=3
            (mèo)        (bắt)        (chuột)
i=0          N            —             S
i=1            —          V             VP
i=2                         —           N
```

**Điền chi tiết:**

| cell[0,1] | w₁=mèo: N → "mèo" → {N} |
| cell[1,2] | w₂=bắt: V → "bắt" → {V} |
| cell[2,3] | w₃=chuột: N → "chuột" → {N} |
| cell[0,2] | Xét cell[0,1]={N}, cell[1,2]={V}: không có luật A → N V → rỗng |
| cell[1,3] | Xét cell[1,2]={V}, cell[2,3]={N}: có luật VP → V N → {VP} |
| cell[0,3] | Xét cell[0,1]={N}, cell[1,3]={VP}: có luật S → NP VP → {S} |

Kết luận: **S ∈ cell[0,3]** → Câu đúng ngữ pháp ✓

**d) PCFG — Chọn cây nào cho "con mèo bắt chuột trong bẫy"?**

Xác suất cây (dựa trên các luật chính):

Cây 1 (PP gắn vào NP "con chuột"):
```
S → NP VP → ...
NP → Det N → "con mèo"
VP → V NP → "bắt" + NP
NP → NP PP → "con chuột" + PP (P=0.25)
PP → P NP → "trong" + "bẫy" (P=1.0)
```
$P(cây 1)$ ∝ 0.25 × 1.0 = 0.25 × các xác suất luật còn lại

Cây 2 (PP gắn vào VP):
```
VP → VP PP → "bắt con chuột" + PP (P=0.3)
PP → P NP → "trong" + "bẫy" (P=1.0)
```
P(cây 2) ∝ 0.3 × 1.0 = 0.3 × các xác suất luật còn lại

→ Cây 2 có xác suất cao hơn → bộ phân tích ưu tiên cách hiểu PP bổ nghĩa cho VP (hành động bắt diễn ra trong bẫy).



### Bài tập 5: Cosine Similarity & Word Embeddings

**Đề:** Ma trận đồng xuất hiện (cửa sổ ±2):

| Từ | market | price | trade | river | mountain | forest |
|----|--------|-------|-------|-------|----------|--------|
| stock | 15 | 12 | 8 | 0 | 0 | 1 |
| peak | 2 | 3 | 1 | 4 | 14 | 6 |
| bond | 10 | 9 | 11 | 0 | 0 | 0 |

**a) Cosine similarity giữa "stock" và "bond".**

V(stock) = [15, 12, 8, 0, 0, 1]
V(bond) = [10, 9, 11, 0, 0, 0]

cos(stock, bond) = (15×10 + 12×9 + 8×11 + 0×0 + 0×0 + 1×0) / (||stock|| × ||bond||)

Tử số = 150 + 108 + 88 + 0 + 0 + 0 = 346

||stock|| = √(15^{2} + 12^{2} + 8^{2} + 0^{2} + 0^{2} + 1^{2}) = √(225+144+64+0+0+1) = √434 ≈ 20.83
||bond|| = √(10^{2} + 9^{2} + 11^{2} + 0^{2} + 0^{2} + 0^{2}) = √(100+81+121) = √302 ≈ 17.38

cos(stock, bond) = 346 / (20.83 × 17.38) = 346 / 362.03 ≈ **0.956**

**Nhận xét:** stock và bond rất gần nhau về vector (cos ≈ 0.96). Cả hai đều là thuật ngữ tài chính, xuất hiện với các từ ngữ cảnh tương tự (market, price, trade) và không xuất hiện với từ địa lý (river, mountain).

**b) Cosine similarity giữa "stock" và "peak".**

V(peak) = [2, 3, 1, 4, 14, 6]

cos(stock, peak) = (15×2 + 12×3 + 8×1 + 0×4 + 0×14 + 1×6) / (||stock|| × ||peak||)
= (30 + 36 + 8 + 0 + 0 + 6) / (20.83 × ||peak||)
= 80 / (20.83 × ||peak||)

||peak|| = √(4+9+1+16+196+36) = √262 ≈ 16.19

cos(stock, peak) = 80 / (20.83 × 16.19) = 80 / 337.24 ≈ **0.237**

**So sánh:** cos(stock, bond)=0.956 >> cos(stock, peak)=0.237. Stock và bond gần nhau hơn nhiều vì cả hai đều thuộc lĩnh vực tài chính - kinh tế, trong khi peak có thể mang nghĩa địa lý (đỉnh núi).

**c) "Peak" mang hai nghĩa: đỉnh núi, đỉnh cao → hiện tượng gì?**

Đây là hiện tượng **đa nghĩa (polysemy)**. Word2Vec sẽ biểu diễn "peak" bằng **một vector duy nhất** — đây là hạn chế vì vector này là trung bình của cả hai nghĩa, không thể hiện chính xác nghĩa nào trong ngữ cảnh cụ thể.

**d) Ước tính vector "Nhật Bản" theo công thức tương tự hóa.**

Cho:

- V(Hà Nội) = [0.8, 1.2, -0.5]
- V(Việt Nam) = [0.6, 1.0, -0.3]
- V(Tokyo) = [0.9, -0.5, 1.1]

Quan hệ: Hà Nội là thủ đô của Việt Nam, Tokyo là thủ đô của Nhật Bản.

V(Nhật Bản) = V(Việt Nam) + (V(Tokyo) - V(Hà Nội))
             = [0.6, 1.0, -0.3] + ([0.9, -0.5, 1.1] - [0.8, 1.2, -0.5])
             = [0.6, 1.0, -0.3] + [0.1, -1.7, 1.6]
             = **[0.7, -0.7, 1.3]**



### Bài tập 6: NER với BIO

**Đề:** "Ngày 08 tháng 4 năm 2026, tại Hà Nội, đồng chí Vũ Hải Quân được phê chuẩn giữ chức Bộ trưởng Bộ Khoa học và Công nghệ nhiệm kỳ 2026-2031."

Tập nhãn: {B-PER, I-PER, B-ORG, I-ORG, B-LOC, I-LOC, B-DATE, I-DATE, O}

**a) Bảng token-nhãn:**

| Token | Nhãn |
|-------|------|
| Ngày | O |
| 08 | B-DATE |
| tháng | I-DATE |
| 4 | I-DATE |
| năm | I-DATE |
| 2026 | I-DATE |
| , | O |
| tại | O |
| Hà | B-LOC |
| Nội | I-LOC |
| , | O |
| đồng | O |
| chí | O |
| Vũ | B-PER |
| Hải | I-PER |
| Quân | I-PER |
| được | O |
| phê | O |
| chuẩn | O |
| giữ | O |
| chức | O |
| Bộ | B-ORG |
| trưởng | I-ORG |
| Bộ | I-ORG |
| Khoa | I-ORG |
| học | I-ORG |
| và | I-ORG |
| Công | I-ORG |
| nghệ | I-ORG |
| nhiệm | O |
| kỳ | O |
| 2026-2031 | B-DATE |
| . | O |

**b) Tính Precision, Recall, F1 micro-average.**

Gold: PER=40, ORG=30, LOC=30 → Tổng gold = 100
Dự đoán: PER=35, ORG=28, LOC=32 → Tổng pred = 95
Đúng: PER=32, ORG=22, LOC=27 → Tổng đúng = 81

**Micro-average:**
```
Precision = Tổng đúng / Tổng dự đoán = 81/95 = 0.8526 (85.26%)
Recall = Tổng đúng / Tổng gold = 81/100 = 0.81 (81%)
F1 = 2 × P × R / (P + R) = 2 × 0.8526 × 0.81 / (0.8526 + 0.81) = 1.381 / 1.6626 ≈ 0.8307 (83.07%)
```

**Per-entity type:**

| Loại | Gold | Pred | Đúng | Precision | Recall | F1 |
|------|------|------|------|-----------|--------|-----|
| PER | 40 | 35 | 32 | 32/35=91.43% | 32/40=80% | 0.8571 |
| ORG | 30 | 28 | 22 | 22/28=78.57% | 22/30=73.33% | 0.7586 |
| LOC | 30 | 32 | 27 | 27/32=84.38% | 27/30=90% | 0.8709 |

ORG có F1 thấp nhất (75.86%). Nguyên nhân có thể: tổ chức thường có cấu trúc phức tạp, nhiều token, dễ sai ranh giới (VD: "Bộ trưởng Bộ Khoa học và Công nghệ" — ranh giới bắt đầu/kết thúc của ORG dễ nhầm).



### Bài tập 7: QA Evaluation

**Đề:** Câu hỏi "PTIT được thành lập năm nào?"
Dự đoán: "năm 1997"
Đáp án mẫu: Ref1="1997", Ref2="năm 1997", Ref3="được thành lập năm 1997"

**a) Exact Match (EM):**

- Ref1: "năm 1997" ≠ "1997" → không match
- Ref2: "năm 1997" = "năm 1997" → **match**
- Ref3: "năm 1997" ≠ "được thành lập năm 1997" → không match

**EM = 1/3** (chỉ match với Ref2)

**b) Token-level F1:**

**Với Ref1: "1997":**

- Gold tokens: {1997}
- Pred tokens: {năm, 1997}
- Common: {1997} → 1
- Precision = 1/2 = 0.5
- Recall = 1/1 = 1.0
- F1 = 2 × 0.5 × 1.0 / (0.5 + 1.0) = 1.0/1.5 = 0.6667

**Với Ref2: "năm 1997":**

- Gold tokens: {năm, 1997}
- Pred tokens: {năm, 1997}
- Common: {năm, 1997} → 2
- Precision = 2/2 = 1.0
- Recall = 2/2 = 1.0
- F1 = 1.0

**Với Ref3: "được thành lập năm 1997":**

- Gold tokens: {được, thành, lập, năm, 1997}
- Pred tokens: {năm, 1997}
- Common: {năm, 1997} → 2
- Precision = 2/2 = 1.0
- Recall = 2/5 = 0.4
- F1 = 2 × 1.0 × 0.4 / (1.0 + 0.4) = 0.8/1.4 = 0.5714

**F1 max:**
max(0.6667, 1.0, 0.5714) = **1.0**
