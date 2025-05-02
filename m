Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAqFe-0003ij-TA
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 09:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uAo0M-0001Sn-Um
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:52:30 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uAo0K-0005e7-GQ
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:52:30 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39c31e4c3e5so1078870f8f.0
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 03:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746183147; x=1746787947; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oUVzgC11QpKdPu7ROAmRYT/NvXT7iHXXqRw9BzVHRSQ=;
 b=ATHIzmLv0OBbtqdnwvsdMsncOXUfUbwlIeoLJDEAJmCXEEmUx8OOkuyBwfW6mCTd2o
 67gEM0Eyd+RKIwcngZTgEa7+MO7H+OaxlE4n88CeQq1/caPLqd3tI5Usk+OxJXJj9rB9
 H8NiZhXzc0h4RHYecQUxTT3k5DIs4pjI2I81Ur3OHjdnCCRQAZ6PK5BxNaI3lWsdZnu7
 hLqcFb8kcbcyQhtdMbOv3WNkvlHGOEEnlPoyJOt0BxUlqBoK7v5moj2O2ndOaRHqfg/w
 QLF+kc6Tg2QAT/rSkqkfURK2ptaUh6khoHWohvghfPI6xOpuXWAXxCDnzX0aWrVtBmqr
 JoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746183147; x=1746787947;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oUVzgC11QpKdPu7ROAmRYT/NvXT7iHXXqRw9BzVHRSQ=;
 b=elPQXfB3ZJLZdSu9coPPVnKeg+KAskJrPFXHdDyrGTjN6VLzKeGoLjf/4Z9NqHJJow
 zsRtgPazkAOobgeNA062kRGMKldKMLbTBspoKBGdn6uaHSqtXtEAuWKS5bkQpyIr5lOb
 CsmP0zqbMnN6GPPraU690DCFc/3gilN21PmEGprCUvfaIkIjIW2yOfuOhKyvS8w5//G5
 6QspqF42Uo1Y0hU0Sfyq3scCPcVcIENNrAT1gfABLTmG1e+Q4LHLDB/OjZPHPbbuFLGF
 hpBFWKTEKT1dCSaSXq1iraWzp8p+tr3Yl8RZ7e5sESn/uNJdh21ThSQfkoFAAJohglJg
 CCJQ==
X-Gm-Message-State: AOJu0YwIf5+DDkmZWo25PJFNDFmQkIKyIVTlmnTPxFDdHIjRJ8G3wjOb
 INTDoUIGTO2XWx4Td5mqa32zFQy80hn0ULJtWGNNmR8u/y3PyJzoY6F2VzHoruw=
X-Gm-Gg: ASbGncvenQuGdmyZ+GaRIalM2VEQdPRSNu/7mOtEm67HDMFDSbNICh33uYqlzA5MMWh
 3xZpkbyS5oF25Bb2alQ8rLPriyaSgTNK3zggsQwm6FeLwxvA1oeHJQqMIVrA8w8bbL7JcD+UdIW
 oyQ1WaUytgbFz8S0frxQ903pxarANl9zcNw1zJo4QjvA+pQZAHmbmBEgXkqKClis05FieJRSK+C
 X841NQsQ1nQlOyCEwwPFaEqznf1500FCi//Cth6hvAYTLYnFEtT+sYMx3Uk+4hdgBuSqLL9X1g4
 J66tKlIgr+rMLkLHgQ11I51UZHM5rwwaX7dgtX24uoq96zLILH6QiVnTT0lM1F+BJ2dohIdtyX+
 UeHLJwA==
X-Google-Smtp-Source: AGHT+IHUfcQKuUH+f3wgigbmZlaM2HYe6JpbXOJ+GqesF5Kcs7jrRZHYy+pwIC4xS8fcZBIx0/9Psg==
X-Received: by 2002:a05:6000:1a89:b0:39c:30c9:822 with SMTP id
 ffacd0b85a97d-3a099add511mr1534614f8f.30.1746183146707; 
 Fri, 02 May 2025 03:52:26 -0700 (PDT)
Received: from meli-email.org (adsl-37.37.6.161.tellas.gr. [37.6.161.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae0b9fsm1783131f8f.4.2025.05.02.03.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:52:26 -0700 (PDT)
Date: Fri, 02 May 2025 13:47:32 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-rust@nongnu.org
Bcc: 
Subject: Re: [PATCH 7/9] rust: replace c_str! with c"" literals
User-Agent: meli/0.8.12
References: <20250502102323.104815-1-pbonzini@redhat.com>
 <20250502102323.104815-8-pbonzini@redhat.com>
In-Reply-To: <20250502102323.104815-8-pbonzini@redhat.com>
Message-ID: <svmrjd.2xrfuqhgty9pb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 02 May 2025 09:16:24 -0400
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
X-List-Received-Date: Fri, 02 May 2025 10:52:31 -0000

On Fri, 02 May 2025 13:23, Paolo Bonzini <pbonzini@redhat.com> wrote:
>Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>---
> docs/devel/rust.rst                    |  8 +---
> rust/Cargo.lock                        |  1 -
> rust/hw/char/pl011/src/device_class.rs | 11 +++--
> rust/hw/char/pl011/src/lib.rs          |  6 +--
> rust/hw/timer/hpet/src/hpet.rs         | 19 ++++----
> rust/hw/timer/hpet/src/lib.rs          |  4 +-
> rust/qemu-api/meson.build              |  1 -
> rust/qemu-api/src/c_str.rs             | 61 --------------------------
> rust/qemu-api/src/cell.rs              |  4 +-
> rust/qemu-api/src/lib.rs               |  1 -
> rust/qemu-api/src/vmstate.rs           |  2 +-
> rust/qemu-api/tests/tests.rs           |  9 ++--
> rust/qemu-api/tests/vmstate_tests.rs   | 15 +++----
> 13 files changed, 32 insertions(+), 110 deletions(-)
> delete mode 100644 rust/qemu-api/src/c_str.rs
>

<-snip->

>diff --git a/rust/Cargo.lock b/rust/Cargo.lock
>index 2ebf0a11ea4..13d580c693b 100644
>--- a/rust/Cargo.lock
>+++ b/rust/Cargo.lock
>@@ -108,7 +108,6 @@ version = "0.1.0"
> dependencies = [
>  "libc",
>  "qemu_api_macros",
>- "version_check",
> ]


This looks like it should go in the previous patch ("rust: remove 
offset_of replacement")

Otherwise,

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

