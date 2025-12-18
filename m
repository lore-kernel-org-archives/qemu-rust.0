Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05697D6E2D1
	for <qemu-rust@archiver.kernel.org>; Thu, 18 Dec 2025 18:20:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vWIb0-0006X6-Ff; Thu, 18 Dec 2025 13:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWIab-0006Pc-HZ
 for qemu-rust@nongnu.org; Thu, 18 Dec 2025 13:19:07 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWIaV-00032b-03
 for qemu-rust@nongnu.org; Thu, 18 Dec 2025 13:18:56 -0500
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso4104375e9.1
 for <qemu-rust@nongnu.org>; Thu, 18 Dec 2025 10:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766081931; x=1766686731; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nPZZBApwFpp2aCgUR9OuXCPmOWKQbdSQ4X0mg+cAPjw=;
 b=WLCZZEGI2NADo2tgC9tk64WwusxKT7tjZaLNOb+ubDqSSJZ6sbUMUkX6h9e2Hsoy7u
 vJv7NJL7NTS+EQm8a62JflefeHTFmTXRUoaQHpI2Rvz/qw87v027jFCu0vQ0hkeLUgyr
 efX5zGpwXVQRusYt4v37l6tOvXAmxnEk69aYte+qFWqHWZnzLk3TUrj06sMzAgZBFCta
 mYPHguyByFFmpK2NoURK7xgoRAW3OSTvmwGOAqOwF2xkOT60TaA0pjGf/tLUHTNy5LqE
 0o79p418BcOU+ABmLwr3cdUGHbcbuVWLF3chp3gR6eQhWBlQ8wPSleVcYqyNG0pzYUt9
 39mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766081931; x=1766686731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nPZZBApwFpp2aCgUR9OuXCPmOWKQbdSQ4X0mg+cAPjw=;
 b=nJsnGJl9r2OJM+YeY4nhjP0jZy2GqRPXMAfIGxjeqXBeCKkHa6axI//vWML9Q+26bC
 RxfHckIwY1CWTGZe/SAQEgE2TosS6tI/Pkp3SML6hieYDqQBVxPg+uqMU6tnoGPuA3//
 SOZlppH1pQYSiBrUCy2Bh0xg3EzQ3fFXYCpOSPbNkNeVwED27YWBedgLfjiDGgnaj/qL
 wE1up8ARUoDGNWWrvbGZ64rGtDEqqHCvoHILL/gdZXlai7UMJ34xmMjoKNsUSqXNHpYz
 9a5tDDJGw4zfEJim6GYElOYECOC47u+jW9BVsg7ipNHz8aMs7NWncnSDLxlHe0oL3PC0
 WLAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL8w61jQG6crV10Mx83E+u9CUMiLHYdsKgKt/JiYNeEF0P0TnAQrSogON6iDogmjQ8c3jZbXhRKHM=@nongnu.org
X-Gm-Message-State: AOJu0YyZOy8grEdi+KM3N56YjBzdl3L4pLOeKAvBtTMJNxyebpaL+h0c
 g8rwPgxDjAH/6mpszYZZJO9dY7KSbEa9CyUBSxWkKartbAv5u51Hgs9WLSg6sywCHS4=
X-Gm-Gg: AY/fxX7esAH3N/1QxQkI1dcwDNWGVUHqakMo1UUR5WEEr3OX0adY9kcfAnJAmuk+FVN
 IT1MqwyvECqwdAe+59Egr7Otvm+A8d/ONIIzNfwzdikYsYuBVWL76s3qufj8AIf090Je+TBfjwz
 /KX2VkP5NI1+CvD4FjDodi8o6iOSgIdD+i4XA1XPv5tLLMoXoE4vAuS+FnbQzyMr9grqWda7HXa
 Qkkf8vW2++fWoDkxeCWotH35HGHzWBYDHMZ41K/vy9OwEo9V6fAylnUYpVqYHHNi29cKYOE/JGg
 m/VZsJ8nN9siyVM3dnircvUQtRynozqnFYFEhjTz9yUYnVqKwU3lH8S+KaXsNX69BMnDEW/f6Ll
 NVdA8SWsgajbzkxbzv2h2Vb3K295wqtOF7wyu2PPkTQQqV2cGn0o1wqp+JpQlSFjZm+OfqcKEes
 oYub1Z/Qinx8mqcUs7D5Y8Y4SY7cd/zMOcr8MSypTLAoUPZd9haVImd6THwQsN
X-Google-Smtp-Source: AGHT+IFj2uRd8hrdtFhyZ94nB8aVUnwZ0Rq4l/D4sNg/vSmct55uTd7IilnKbP4atxOhX0aO7Lktog==
X-Received: by 2002:a05:600c:1c29:b0:46e:37a7:48d1 with SMTP id
 5b1f17b1804b1-47d1959d4bamr851815e9.34.1766081931339; 
 Thu, 18 Dec 2025 10:18:51 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be27b749esm53916305e9.14.2025.12.18.10.18.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Dec 2025 10:18:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-rust@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/6] hw/char/pl011: Mark implementation as being little-endian
Date: Thu, 18 Dec 2025 19:18:10 +0100
Message-ID: <20251218181812.58363-6-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218181812.58363-1-philmd@linaro.org>
References: <20251218181812.58363-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The PL011 component is only built / used by ARM targets, which
are only built in little endianness. Thus we only ever built
as little endian, never testing the big-endian possibility of
the DEVICE_NATIVE_ENDIAN definition. Simplify by only keeping
the little endian variant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


