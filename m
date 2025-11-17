Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9ACCEACEF
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 08:03:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKuDD-0003Gg-G9; Mon, 17 Nov 2025 03:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1vKuD0-0003F5-S4
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 03:03:36 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1vKuCz-0000cD-7q
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 03:03:34 -0500
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-4ed7a7ddc27so38240781cf.2
 for <qemu-rust@nongnu.org>; Mon, 17 Nov 2025 00:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763366611; x=1763971411; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fjFReJ1BvPs1hCi3Zf26yZK75FTL99oEHwatPqkodao=;
 b=hoxUGV6YI/xia+PEEowoHzZ44DbzyJhl4sFEMqTQUftIGmLr5qakQsY/sp0xQ2OlI7
 uV69ZkYJ2AYCKnEWjZkxSkjLgnNuoPnBGO2qqnb2x7Kg/l8afYFfrksEav9vMgsJf9Ps
 w3zWgDeczDEYvPBV60l4SUtIGnsC9fi2HShMJ7XEEsaSK2V8tSMTeeG+Kp6VMSqxb8ss
 bTdEPxz/WQrzisc/G40iQSA1kvpU67GQySMkKJUu+kw+Nta+2a9MoWgE5n3Lmj5Bu7KS
 RiA7SRWmUK7dwL8befILRhiLHpIOx6lAaDlThQFztfqVUBfNUXvGEgL0slmsGZXXOGtg
 eZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763366611; x=1763971411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fjFReJ1BvPs1hCi3Zf26yZK75FTL99oEHwatPqkodao=;
 b=w5XG0yPPlp0NUeORjQS3XfxWn9QhUElgjwCjvN4txFTZ4JniZNsKpxHr5xles56gp0
 cA9PvcfoUlKH6qqox7dHizbibAUNGnNsM8K9Z5JwxK6sY3D/IGVrnzwh3Omz1MhENd0S
 B+bnyPKfMumFP/DdQzVCi4Z1UDn4SwlZvMMB34UDpe6pTNfFDL1StpZIMAywMPVsW1pJ
 a9ldr1rCZZc7v6tAW5M5H2OdO8B5prGAlZvq9FCVz1RYd6i9BNGNNpXF43OZ/UWyVqh+
 6Sq3zXzTs/mIA8xsjX8EUhnstznF1hg5QirUU9kJe2eKDNPd45ZLWOT3F3mSbqIAiR81
 2qzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLhPAW8fp8tzL415KTWiiAImS4m53GTbsUlJpAc2aIrNCghYwXE9Bz1Nt7+RuFcnnMwI1pgc3hYSw=@nongnu.org
X-Gm-Message-State: AOJu0YxjlZkCRaO2YDo6AGZ0HrbjAZHhTrmhqGw9/ffW2961IddwoyvR
 xEfq338ZEYOCLxIIKQdepRw0NYR4n3+nXy45XPWVnVYb8vuLKONW+Dsn4CNuph6LKGbumDhJMfI
 1jMKAGDMmU982J52/TYlLIFhQU0T9c4E=
X-Gm-Gg: ASbGncvP4hc052W3seg+6UUL/QksTFM39FTxuKNBoMk/qIFmwFhcXDk/DIgB9lhY2DT
 BDpJLaukGM4krm2Zk9vV6Ly8tBd5YF4FdxEiuOL1gIqcdNfQZnO6oFlrZY4e0n0YN4RlvRzaZm0
 te7/nQxBAiCADi03qXmCGJ54o5Yn1uKXTAAbGPeMZvSvGxuJTY6UqaSAW8Dtg3X8eG+z966KfC+
 p/1u9eujaMw/HLZ4VjumK+Xr+gkgt2+uetDLiPZz3LjOdFQzQhoJzKqDm1MgCiimffrHtJ022y7
 i0iVk5m5X+HTXcUU1rLb7urE0PmrgZlKZchAxg==
X-Google-Smtp-Source: AGHT+IEGdohugtR2sb53+frPUxwa7GRUs9J6xVF0AE8w1j/27wyTjC07rYDFt9AdZzKF1BYEYiKeI8EPFnRyu/xt1yk=
X-Received: by 2002:ac8:5d05:0:b0:4e8:aff9:a7a8 with SMTP id
 d75a77b69052e-4edf20ece1dmr167518001cf.52.1763366611104; Mon, 17 Nov 2025
 00:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20251117074239.190424-1-pbonzini@redhat.com>
In-Reply-To: <20251117074239.190424-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 17 Nov 2025 12:03:19 +0400
X-Gm-Features: AWmQ_blJ8Dh6cFlaacYtNgW9LxgrUL2vN5MfkWtzj1cufTPkvVTAlZB0sqjEIMY
Message-ID: <CAJ+F1C+B1amkaS0ZVJZFp42g1e9shdhnmjQYx8CDuv3vQ+Jzwg@mail.gmail.com>
Subject: Re: [PATCH 0/8] rust: add preludes to all crates
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi

On Mon, Nov 17, 2025 at 11:43=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
>
> This series adds a prelude module to all crates, so that
> it becomes possible to import from each crate with either
> of the following
>
>    use XYZ::prelude::*;
>    use XYZ::{self, prelude::*};
>
> The latter is used for items that have a "too common"
> name to be put in the prelude: util::Error, util::Result,
> migration::Infallible.

In my experience, "preludes" are not so ubiquitous (except the std
library). The use of wildcard imports is not encouraged, and may
result in conflicts. Also, it's often subjective what you put there or
not.

I don't think we should encourage it, having explicit import of what
is used is often clearer.

>
> Thanks,
>
> Paolo
>
> Paolo Bonzini (8):
>   util: add prelude
>   common: add prelude
>   hwcore: add prelude
>   migration: add prelude
>   chardev: add prelude
>   bql: add prelude
>   system: add prelude
>   qom: add more to the prelude
>
>  rust/bql/meson.build              |  1 +
>  rust/bql/src/lib.rs               |  5 +++++
>  rust/bql/src/prelude.rs           |  4 ++++
>  rust/chardev/meson.build          |  1 +
>  rust/chardev/src/chardev.rs       |  2 +-
>  rust/chardev/src/lib.rs           |  5 +++++
>  rust/chardev/src/prelude.rs       |  5 +++++
>  rust/common/meson.build           | 13 +------------
>  rust/common/src/lib.rs            |  5 +++++
>  rust/common/src/prelude.rs        |  9 +++++++++
>  rust/hw/char/pl011/src/device.rs  | 22 ++++++++--------------
>  rust/hw/core/meson.build          |  1 +
>  rust/hw/core/src/lib.rs           |  5 +++++
>  rust/hw/core/src/prelude.rs       | 14 ++++++++++++++
>  rust/hw/core/src/qdev.rs          |  2 +-
>  rust/hw/core/src/sysbus.rs        |  2 +-
>  rust/hw/core/tests/tests.rs       |  8 ++++----
>  rust/hw/timer/hpet/src/device.rs  | 26 +++++++++-----------------
>  rust/hw/timer/hpet/src/fw_cfg.rs  |  2 +-
>  rust/migration/meson.build        |  1 +
>  rust/migration/src/lib.rs         |  5 +++++
>  rust/migration/src/migratable.rs  |  2 +-
>  rust/migration/src/prelude.rs     | 19 +++++++++++++++++++
>  rust/qom/src/prelude.rs           |  4 ++++
>  rust/system/meson.build           |  1 +
>  rust/system/src/lib.rs            |  5 +++++
>  rust/system/src/prelude.rs        |  8 ++++++++
>  rust/tests/tests/vmstate_tests.rs |  7 +++----
>  rust/util/meson.build             |  1 +
>  rust/util/src/lib.rs              |  5 +++++
>  rust/util/src/prelude.rs          | 11 +++++++++++
>  31 files changed, 145 insertions(+), 56 deletions(-)
>  create mode 100644 rust/bql/src/prelude.rs
>  create mode 100644 rust/chardev/src/prelude.rs
>  create mode 100644 rust/common/src/prelude.rs
>  create mode 100644 rust/hw/core/src/prelude.rs
>  create mode 100644 rust/migration/src/prelude.rs
>  create mode 100644 rust/system/src/prelude.rs
>  create mode 100644 rust/util/src/prelude.rs
>
> --
> 2.51.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

