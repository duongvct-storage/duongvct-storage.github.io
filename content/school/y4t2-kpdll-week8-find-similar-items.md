---
title: MMDS - Finding similar items
keywords: [big-data, locality-sensitive-hashing, find-similar-items]
date: 2026-03-16
theme: big-data
description:
  Year 4 Term 2 - Mining of massive datasets - Finding similar items: Locality sensitive hashing
---
Mining of massive datasets - Finding similar items: Locality sensitive hashing


# Y4T2-KPDLL-WEEK8 Finding similar items - locality sensitive hashing

## A-Priori:
Quan sát rằng để tìm được 1 cặp a-b xuất hiện n lần thì cả a và b đều phải xuất hiện n lần

Các bước:

- đếm số lần xuất hiện của từng item
- Lọc những item mà số lần xuất hiện $\gt \lambda$  -> lấy k items ( k <<<< n)
- duyệt và đếm số cặp trong K item(O($K^2$))

Điểm yếu của thuật toán: do giả định nếu i và j xuất hiện nhiều lần thì i và j sẽ cùng nhau xuất hiện nhiều lần -> không hoàn toàn đúng trong thực tế

Cải thiện -> PCY

## PCY

# References

- [PCY Algorithm and Friends (Medium Article)](https://medium.com/weekly-data-science/the-pcy-algorithm-and-its-friends-ecba67216190)
- [Finding Similar Items (Lecture Notes PDF - Click to View)](http://mmds.org/mmds/v2.1/ch03-lsh.pdf)

- [Information Retrieval books](/pdfs/y4t2-information-retrieval/intro_information_retrieval.pdf)


