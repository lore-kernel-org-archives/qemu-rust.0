Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBsER-0001qQ-5B
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 05:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uBsEP-0001ps-PJ
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:35:25 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uBsEL-0002oV-KI
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:35:25 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9eb1eso6925285a12.0
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 02:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746437719; x=1747042519; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PyMWrC5qS38VUa0+bmY23Us24bG1Dv5J8ZuqIqrJ9/8=;
 b=R7M4acfmoBcR+unm7aK2bPpmGG3zcZNynZniRSk715T0/c99HwTQZcAhXVfRTs6vF9
 skomzQAvryv7ijofrqBJF3TfKqGEME8Tmivyny3utc5bMQoHDrSbNZug+WKViATiWDE3
 5Hh5WiPiqlIkbS+daj3qFY4mD4yL0xSwLLXWNK++U8ZseJSM+m+BPs4OO3VjJWqg2hoa
 KNBPLRp7l8TyROAaK0LuRw+sNOLpYAhwZGshSkEVbBcBgHKs7HEcK/93WijQrj73uXnO
 cYbRCrQHEaY9xXO0AJG4ruX0fuC7ZldGCSS60WV5S2bGM02pV+oTsujQ0/FWxXJWo0qi
 XpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746437719; x=1747042519;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PyMWrC5qS38VUa0+bmY23Us24bG1Dv5J8ZuqIqrJ9/8=;
 b=utmSb7WhvKI8gYdbqIje9U3dp6JI3WJw0a1vQQCNWehdL9oDbdwanzsBdaMvQZ3ZRx
 enDhqLupOXx/n8F4T1d3eDN7WfRp/S1vawHXMDWW1vNIOk8drNKYmhblrUivTtsU1k8z
 /AgKBZqcq/4EXEvx2pKYOuBN12kRlG8CsSK3lgZQ1UuQ/YUZkb1o7zwpo8z7RhgRT1y5
 Yj610tG7D0NV2tlaY9U0pgnnbErJIVpe3h1RlhDiCFl/uCmUA5/8jWDQQVWVVoMr6puv
 BN6yuhNWtNd87yvczrUYo6OXKLmSEGozI5X1Uwd53wsoc0QgxbxYO3GB6YQ1tqTil9GQ
 WWAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViA2yZzEbEgOjvwFIceBfL6bzxB6bgeCtfoiccqC+wfzjEhtidQLKtdAqqj0UUMPrscRdMsPaF7ds=@nongnu.org
X-Gm-Message-State: AOJu0YwMcohGvyn6Dtu8SJVRfojYNX8d1gjhbIZqYEkdJ3lVcfBHhS+n
 oCO8wHCynXKoljFixXRMPHnIL5O/mX0GADGuQkJL3M97Ot2atWuYeQ8b4ji4vN0Zl/e+ZO5fnnf
 oPNS7mptC7uKsjKNRV/XLQA6VaM2xNZjO9HDo5A==
X-Gm-Gg: ASbGncvO44uJ1Un1elGrZdH6yEQ6OYD+Id6YPZGNBlmKo9UC8CcAzlZ2CkrZxUNCYxj
 6pkrgsW0qgXmfI9LOW1VHYmhYQS1UmtkCE6Hf4hEBaRDeqpBZYTJqXkD6FdehXdMe3ihoVKBozo
 oo45ois3euMlFiKBRGOp6S
X-Google-Smtp-Source: AGHT+IFpQVE4OZB8N9SCwjdpHK5PxLl/FS0YM9tFkww/4o4H2eHARn+wPesycDPzrEGra+/ddsHzuG+zMw+fa8hkmos=
X-Received: by 2002:a05:6402:40cb:b0:5e7:8e5e:4467 with SMTP id
 4fb4d7f45d1cf-5fa7327256amr11012816a12.3.1746437719616; Mon, 05 May 2025
 02:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250505090438.24992-1-pbonzini@redhat.com>
 <20250505090438.24992-10-pbonzini@redhat.com>
In-Reply-To: <20250505090438.24992-10-pbonzini@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 5 May 2025 12:34:53 +0300
X-Gm-Features: ATxdqUGMrnMZvRn6Ty4DyAW3IuABvmsqenfr46G3u7Q57WSv2U7y5AWy7-yq9cw
Message-ID: <CAAjaMXZoOd+fyzfdhE5ewsn==e0+C2M8rCYQSvdeb5ysPA7b2w@mail.gmail.com>
Subject: Re: [PATCH 09/11] rust: remove offset_of replacement
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 05 May 2025 09:35:26 -0000

On Mon, May 5, 2025 at 12:05=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> ---
>  docs/devel/rust.rst                  |   6 -
>  rust/Cargo.lock                      |   1 -
>  rust/Cargo.toml                      |   2 +-
>  rust/hw/char/pl011/src/device.rs     |   4 +-
>  rust/hw/timer/hpet/src/hpet.rs       |   4 +-
>  rust/qemu-api-macros/src/lib.rs      |  29 +----
>  rust/qemu-api/Cargo.toml             |   3 -
>  rust/qemu-api/build.rs               |   7 --
>  rust/qemu-api/meson.build            |   4 -
>  rust/qemu-api/src/lib.rs             |   4 -
>  rust/qemu-api/src/offset_of.rs       | 168 ---------------------------
>  rust/qemu-api/src/qdev.rs            |   6 +-
>  rust/qemu-api/src/vmstate.rs         |  10 +-
>  rust/qemu-api/tests/tests.rs         |   2 -
>  rust/qemu-api/tests/vmstate_tests.rs |   5 +-
>  15 files changed, 16 insertions(+), 239 deletions(-)
>  delete mode 100644 rust/qemu-api/src/offset_of.rs
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

