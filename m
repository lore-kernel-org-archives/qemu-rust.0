Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FFAE75453
	for <qemu-rust@archiver.kernel.org>; Wed, 24 Dec 2025 13:49:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vYPDp-0006ll-EI; Wed, 24 Dec 2025 08:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPDK-0006O1-7J
 for qemu-rust@nongnu.org; Wed, 24 Dec 2025 08:47:43 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPDG-0003kW-Mq
 for qemu-rust@nongnu.org; Wed, 24 Dec 2025 08:47:41 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42e2d02a3c9so3819034f8f.3
 for <qemu-rust@nongnu.org>; Wed, 24 Dec 2025 05:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766584057; x=1767188857; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DN3Kq8SgtAy5PtsJd1FI2a+o8ZqVooLM5lk+87PhuAI=;
 b=DA+BjPXdMKOuy7S0EEHP1rJ2OLvqinRgkAfDiMtQ2FhyuDfF/cK/y1twWG5qs4TaAQ
 0zbimQ8PMawPVUwzAypbNyoF6bSL416rxHQozwveh8/T+KbkOx3vfx90hfBD0GULz2qB
 qQ+yhgsGgJJUBO8jpPHeSAgLlKPVDg/g32drmOn962Ap4AUWMbadKzSDeEczJx/7s0MU
 vabS9oyun8rtmRfV/AwCq7/QiZJC2CMOX03weXD2UOEzWxL1s9T/cyiAf4wkgR17KFCW
 /vmPJokDuaSQX0seNxGOE7DbcQjL/8yqveO0NAjjZ7SdeiWFul++HqrpwOULeAYwmIlV
 TPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766584057; x=1767188857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DN3Kq8SgtAy5PtsJd1FI2a+o8ZqVooLM5lk+87PhuAI=;
 b=ZBMbFIstlhpeVtb1ncNM6BrGfx00KfCceKqGdXPbvt3MNP4Et5GMLASh84JYPKFRC3
 +JGGqrLU/5bG0RtAlq7gQ0CjgDK8uqphGaL7pwp3M3RZVazBTPPpmhTtga0y4yLYQU9z
 yVj6zfvACfmlZi3iBmzedWL+9TWAVzZ0KMy4NVN/Y3XdJHhLp1qdsfB9T5dEr66B/lYu
 fsdV2oetauKyZYKCcNUhJRfHI1zAVgYCdLabaPVqPR7Xh3mPJJmFKmhNzFJGmQ28+AWD
 N6ey/KRSk4SMdq7AbR+mIQzb66pZuD9HWAhsN9uTZHhLqB6Tw9hn+O7cSPjuRg9UYTSg
 IFFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM8Xv82T/qiHSnacQRuYAQTF1voQqwAqQeqRIqe+tPof+6QRXLn7Ry2hraHzkrx+6Gm+d2ZVjqZTs=@nongnu.org
X-Gm-Message-State: AOJu0Yw89vJXzZUS4nlckBWu9JovttbR7cxW9m96xO/sGKfAx2RdMLFb
 jNlyDK5/ha7ny2WOvPe9chTGbk+6Mm2bGEDReN0prYmFt7JrFuFbIJuTCLXc2eafz3o=
X-Gm-Gg: AY/fxX6B8rqqfRKf3JfsRwcwbY0DyeNy/EayMDl/Q3U87/W5JNWxL6eXmT9O9U0emaz
 O0QTc3qyDxGJMASCLk384Fs1l9mb3fAHBqndWfuicpz2CBQIQqAvsQe+gJTXz6bmAyPwoMoEQEh
 bTtwIFN0sx4g/CIe8PJr3jh6Y9uW4EJW+viQuLvCFxOnvZ5ghCOLMp70uBgzRtRGDmO7p9SgXOi
 vArgAmuFJ+dCvqETAJC8byZjRoyrg1fUlFRbhQcyx+w8Gv7BmbGv/jbsS9iQAz02JKzVBaGj0Tj
 Zy64uURF5Pu8+WX4kjKYxD/SoC6UhUwOHvcKUAhD5d2WtUatUN0TVD6llrgS/o2hvlGDtkZ/LaT
 8zG9v8mDX2So8LqO1unc+SA5aLGdhgeHcMNmvp5Mqs16r0XjfGrFbW88n2/Ky8wJNHYChi+6/rC
 anfWgfcAcJA1KV9RlXKCxQBrVKK/gh4xe+SbgAzwQwEJk/AcNgNKgN3zFcGYq/
X-Google-Smtp-Source: AGHT+IHfiJy1RzIekw7/u9Wdg8X9vE3qpfo8ZHQkIMT0x5yB0ObkCfXgkgTD+eEUQDcGw4t1lcq7jg==
X-Received: by 2002:a05:6000:1868:b0:431:5ac:1fc with SMTP id
 ffacd0b85a97d-4324e4c9bb8mr19912581f8f.14.1766584057273; 
 Wed, 24 Dec 2025 05:47:37 -0800 (PST)
Received: from localhost.localdomain (218.170.88.92.rev.sfr.net.
 [92.88.170.218]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1af20sm32276550f8f.2.2025.12.24.05.47.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Dec 2025 05:47:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-rust@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Max Filippov <jcmvbkbc@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 6/8] hw/char/pl011: Mark implementation as being
 little-endian
Date: Wed, 24 Dec 2025 14:46:42 +0100
Message-ID: <20251224134644.85582-7-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224134644.85582-1-philmd@linaro.org>
References: <20251224134644.85582-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

The PL011 component is only built / used by ARM targets, which
are only built in little endianness. Thus we only ever built
as little endian, never testing the big-endian possibility of
the DEVICE_NATIVE_ENDIAN definition. Simplify by only keeping
the little endian variant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/pl011.c                  | 2 +-
 rust/hw/char/pl011/src/device.rs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 01335d9437d..97cd9bd4c54 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -538,7 +538,7 @@ static void pl011_clock_update(void *opaque, ClockEvent event)
 static const MemoryRegionOps pl011_ops = {
     .read = pl011_read,
     .write = pl011_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .impl.min_access_size = 4,
     .impl.max_access_size = 4,
 };
diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 04155dabe1a..a6227a99f30 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -495,7 +495,7 @@ unsafe fn init(mut this: ParentInit<Self>) {
         static PL011_OPS: MemoryRegionOps<PL011State> = MemoryRegionOpsBuilder::<PL011State>::new()
             .read(&PL011State::read)
             .write(&PL011State::write)
-            .native_endian()
+            .little_endian()
             .impl_sizes(4, 4)
             .build();
 
-- 
2.52.0


