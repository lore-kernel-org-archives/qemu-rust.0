Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28432CCA476
	for <qemu-rust@archiver.kernel.org>; Fri, 10 Oct 2025 12:26:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v7CC2-00031I-N9; Fri, 10 Oct 2025 08:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1v7CBy-00030y-Uo
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 08:25:51 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1v7CBj-0000Bj-6l
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 08:25:50 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b472842981fso248609766b.1
 for <qemu-rust@nongnu.org>; Fri, 10 Oct 2025 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760099118; x=1760703918; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iJef+65pVyTbDY80dc3E9C47XCo6DR8VHYIZD9Yp23I=;
 b=dTSnIQcBEBN9l84uvwr71PISqJa7umLZEMwi78VMB+l2F5BUB8hYgDz0jThy56twWj
 l5jpIIaUk472Is1pvPzX1VOeXjHlR4ujV16y7w5NsvqdG/IGCsPzRbBlER9vgwsuM6Px
 JO6txZ4sc7LH1OXNGH6FQEwq60OoB1dQ7t6zFgPIIBjy7xupm6e55DTN5pv6RvwDFsSs
 sVVFqk4i5zwSWfYQy5ig9ACkuSKGNHWPHuQWY5mopI8r5LF3GF0vPSC2ga02syq3JiUR
 IC400Dd8iYMcAgqluVFBNIX2vdGM3tzImwcJefwfBOXNf8+syIrz9Y/qiUy8tmRuQ3El
 Sa5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760099118; x=1760703918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iJef+65pVyTbDY80dc3E9C47XCo6DR8VHYIZD9Yp23I=;
 b=VEXMCnOvJRFbDOjbtiPqKp1iAYTxTHvGjd3N89gjgnx28V8LAbegmnI8t7gmkD3pfT
 l7k9YFJ6YBG1+FyA9NQQtiSOjnhy3UANkatH2HfWdqQ44t5JxbPxbRvHRjJp24Kit7IF
 BzegaHb2k573xpFg3MPdSgDc7DVEdLhftOWjYnKmPQhtW7JUwDe33gAGpdZZb+0zEVSC
 h7WcZd2q45nOh55iasvVf+1zDNxi5+U8DSwNJcGH4cFSeIc3Tp3JizWmHgZxT7ILQUvT
 LcZkfVRzywfsDJSf3jlvcO4qJpQqjiOlnyxUP5STLi27V10Ig8N69GGiPX8UcS0tb974
 d8kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3Xc2ycqy9rBLg+SiZIV5W78p6GIe0BiNhynhX65IZ7JGzGoSU8Myb4h6hoj7Q8TuyqxnXeFy9z7U=@nongnu.org
X-Gm-Message-State: AOJu0Yxmndsd10Uh2sCQi6na2XHvMkqZsVgfMuWEMerx4fPxMgR12THc
 5REvJZxiM5KRYeayqY5xXv/Z4vKCkAPYVTqTepLRlfrGjvog3QbjTLFPdR9TdS7hNKmVPBLmHPV
 r8pViNxek7f61aQCgJEqG2svUyRgzoFYSuj3sHegvjQ==
X-Gm-Gg: ASbGncs7Wvhp35wCRiYE3aJBTvyAh6oDFshGGrEANY1OZZNCutJ38Qx/W6rx/2BhSof
 nTTHKPoaBQ6WvQ7GGXYYofM+/dNxxmWdYIaAjejhJvyPjY2C2daHeiGoWbkHbnUTpDkEmZs/rjI
 v98b9EllaY7KgXYYZxshjhUk1+2h4073XHyROizuKtUUxKZjkhO8u68ty8bKr4tzlLvqwB5EC1i
 UPf7cu9qOzqrNRaC77V7B3Y52VC9rq+3L9V8A==
X-Google-Smtp-Source: AGHT+IF656kEBXTzZ8byg7Devab5wI1Hv+Xa7n1VCnzFCHVk9ljSd3UVs7N8bOMVGxwtGbYcqq2wqERBNtdCvFNjJQU=
X-Received: by 2002:a17:907:1c91:b0:b3b:5fe6:577a with SMTP id
 a640c23a62f3a-b50aa79279fmr1224710566b.8.1760099116632; Fri, 10 Oct 2025
 05:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251009211148.642966-1-pbonzini@redhat.com>
In-Reply-To: <20251009211148.642966-1-pbonzini@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 10 Oct 2025 15:24:50 +0300
X-Gm-Features: AS18NWA7cAXZZ0OXHK_huRz8qy5i8lVmyvq7ApWiiE9yVX2dj303xnWJo8-4KAE
Message-ID: <CAAjaMXYocRnv-TFFw8nBSsLDihooVNoM_VGrFNeeq5-9YVNdSw@mail.gmail.com>
Subject: Re: [PATCH] rust: pl011: fix warning with new clippy
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On Fri, Oct 10, 2025 at 12:12=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
>
> Newer versions of clippy are able to see that all the variants in
> the PL011 word length enum end with "Bits", and complain about it.
> Allow it.
>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>


>  rust/hw/char/pl011/src/registers.rs | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/rust/hw/char/pl011/src/registers.rs b/rust/hw/char/pl011/src=
/registers.rs
> index 0c3a4d7d214..fa572811b29 100644
> --- a/rust/hw/char/pl011/src/registers.rs
> +++ b/rust/hw/char/pl011/src/registers.rs
> @@ -255,6 +255,7 @@ pub enum Mode {
>
>  #[bitsize(2)]
>  #[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
> +#[allow(clippy::enum_variant_names)]
>  /// `WLEN` Word length, field of [Line Control register](LineControl).
>  ///
>  /// These bits indicate the number of data bits transmitted or received =
in a
> --
> 2.51.0
>
>

