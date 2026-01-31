---
marp: true
theme: "gaia"
header: "みなさんﾊﾟｿｶﾀしてますか〜？私はパソ型してます。~Hindley-Milnerの理論をベースに型推論を実装する~"
footer: "UNTIL LT 0x09 2026/2/1 @reversed_R"
backgroundColor: white
<!-- headingDivider: 1 # divide pages by header 1 (# header) -->
paginate: true # display page number below
size: 16:9
math: katex
---

# みなさんﾊﾟｿｶﾀしてますか〜？私はパソ型してます。

## \~Hindley-Milnerの理論をベースに型推論を実装する\~

---

## とりあえず、自己紹介

<img src="./images/icon.jpg" width="15%">

こんにちは。
情報科学類2年のゃー(reversed_R)です。

Twitter: [@reversed_R](https://x.com/reversed_R)
GitHub: [reversed-R](https://github.com/reversed-R)
HP: [https://reversed-r.dev](https://reversed-r.dev)

---

## みなさんﾊﾟｿｶﾀしてますか？

-> 私はパソ型してます。

コンパイラを書いており、強力な型システムというのがあると良いよね、に。

-> Hindley-Milnerの型システムをベースに型推論を実装することに。

---

## 型推論とは

### 型検査

伝統的に静的型付け言語において、型は明示的に書かれてきた。

---

- Cの例

```c
int main() {
  /*
  ココ
  |
  vvv */
  int x = 0;

  return 0;
}
```

---

- Javaの例

```java
public static void main(String[] args) {
  /*
  ココ                         ココも
  |                            |
  vvvvvvvvvvvv                 vvvvvvvvvvvvvvvvv */
  List<String> arrayList = new ArrayList<String>();
}
```

---

でも型をわざわざ書くのはダルい!!

いくらなんでもわかりきっている部分に書くのは冗長。

---

一方その頃、関数型言語では...

多相型付きラムダ計算をしたいMilnerおじさんが型推論を発見(なおそれ以前にHindleyも見つけていた)、
(Standard MLやOCamlなどの祖である)MLを作り、多くの関数型言語に取り入れられていた。

---

- Standard MLの例

```ml
(* 引数の型すら書いてない
              |
              v *)
fun factorial x =
  if x = 0 then 1 else x * factorial (x-1)
(*              ^      ^^^^^^^^^^^^^^^^^^^
                |      |
            戻り値の型を推論可能
 *)
```

---

- Rustの例

```rs
let x: i32 = 0;
//     ^^^ 書いている例
let x = 0;
//   ^
//   |
// 書かなくても推論される
```

---

### 注意

動的型付け(いわゆるダックタイピング)とは違う。
明示的に型が書かれないことがあるだけでコンパイル時に推論の結果決定されている。

---

## Hindley-Milnerの理論やっていきましょう

$$
\begin{aligned}
  \tau &= \alpha \text{(variable)} \\
    &| e_{1} e_{2} \text{(application)} \\
    &| \lambda x. e \text{(abstraction)} \\
    &| \text{let} x = e_{1} \text{in} e_{2}
\end{aligned}
$$

---

# Page 1

- fuga

<img src="images/test.svg" height="60%">
