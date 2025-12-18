Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4E8D6E2D1
	for <qemu-rust@archiver.kernel.org>; Thu, 18 Dec 2025 18:21:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vWIaq-0006TK-NZ; Thu, 18 Dec 2025 13:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWIaB-0006O6-9m
 for qemu-rust@nongnu.org; Thu, 18 Dec 2025 13:18:40 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWIa0-0002yE-DX
 for qemu-rust@nongnu.org; Thu, 18 Dec 2025 13:18:31 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so7610775e9.0
 for <qemu-rust@nongnu.org>; Thu, 18 Dec 2025 10:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766081902; x=1766686702; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Fw9wiW8eGiYc4imf57ZBrS/UxIVjWCdGG1Tt5+MH7Y=;
 b=DK4sxOgFDcz0j3Ug6SMlaqCbOj6OJjQS4BHT7yvspOJnxB4DSQ7mEAyEX61MoBQcxN
 /ml++01sZJ+Qvd9SIAE48XpRtRZq2uz++3trcx1lxcbUc/XrfKprAn9L64uyg/vgODHb
 NtJD4isRJ46IcfSnXDJDU7bFDtzTwIS/dmZIUHHggQNa4BU7bhoEgYKqoMmOnib0PlaE
 O+qnSnGXUBEBbLa258kaos5GyHTlIcQrFrYbnUmbRA4HKJGfxRbioaF4vI6BhkVhNCqM
 ZBvTlpZ1goD7HSFv5zGFnfngUppA8r66fQeWhKFdHC2mceeKKpRCyc9W1lePyBVUO96Y
 5cmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766081902; x=1766686702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8Fw9wiW8eGiYc4imf57ZBrS/UxIVjWCdGG1Tt5+MH7Y=;
 b=GTzx8nqPCwpzZbIZneZSRguOZ6Xp8AvNIFpTJQA3iqB44hO1MILiZPHAVSbC4jBgsT
 urW9NYBF3yE2SNBVOegq5ukQ7TWsRhFGNezy4vJ4I7Xdjnno30md5ZjPN5JmbiNLri+C
 Gb8EHIZg7KvZnfR+OHPvttTdV4b9YV+/2KnM2mtNYJQ0isT6w+zWCZLFXN6r2SapQCLx
 5rQ0MOolIzHVGNYrqAeA/nw1iyQ28Wcf7s6m2vA6cZ0hpGKOxX7fkzLHUjKOzdjNz2/i
 yulySkVpFSI+B/CTjHAsR0Y7kVuuN+nMOuLIdZ1Aye9Za0ofcSEm0iDY99xdw3sSYIaD
 CgSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4rNb9Apm2n8zDDBJQ5rTt4q2UQ1qoMJScpOhFC4THdvHEOjZxjOQJmkKKEYm+II4XFDZt8w/tX2U=@nongnu.org
X-Gm-Message-State: AOJu0YwJiRUn3ItIU9PIN3WNpxCi45bM18Ce6QjtxsrZEX6WJ9/wLJHF
 X+9N7ZgMUAjYve4xzVFk+3qsmjyZQiLQDVBa2JYDEbXuh62VkFm/iwCWD+nuohpdpmdro7+3LT8
 fJphmPBA=
X-Gm-Gg: AY/fxX5ES3hvh3mn4MO0aEq6xe8KPxsUwSjXq1C2A3LB5BBb/cIaOP1xHzktg4oidpR
 NN/KWpFefQcwn/oHEUWnYnG3sM/6t/dQC/xyq9FcnCtp0wd5y6yCmbp6dfLQG4ib43hf83Wbnn/
 UPAAuVTLCmkq+KTupeWkuRNMxyQiIIPxH3t+OV65F+SFatruTFnIaFHy3jOyWVJBLd8pS6Kyjv9
 ahHB46yw45tseiJcXhTPrclvipjx8lpDnlABKIYuLuRGn9sOg/UmKseyDHMdoL4XMQJwqiqdr9y
 TGPJG8nU46DFQOdaghdRzHfmbCsJ5ZeS/kWgRRwZmyIS3Dt9JjvydtsNLG+s4SC8OIOo9ZlJOhN
 wqUxcdrTTre4KYaC852loPBuoWhoq/Fq+4oJKgIdLwOvh3GJQFm/qC17X10YFaieZoHWdosCg6Z
 0ZV6g4GKVGw0hjnk4FhJmsZOdWpGE4FCF/dqUM2Bm6SyCfONMtVWNabhqoCWDlLcgx0827EWw=
X-Google-Smtp-Source: AGHT+IHqA+vzL5VfowrzPMh4sMwFeuxieIhnO+m2qRQLOkWuGZXOGkqq7f16yyX5dRTnLIeRTkV5vg==
X-Received: by 2002:a05:600c:4e8f:b0:477:df7:b020 with SMTP id
 5b1f17b1804b1-47d1957da79mr976125e9.18.1766081901671; 
 Thu, 18 Dec 2025 10:18:21 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d19346e48sm3223475e9.2.2025.12.18.10.18.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Dec 2025 10:18:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-rust@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/6] hw/char/serial: Let compiler pick serial_mm_ops[] array
 length
Date: Thu, 18 Dec 2025 19:18:06 +0100
Message-ID: <20251218181812.58363-2-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218181812.58363-1-philmd@linaro.org>
References: <20251218181812.58363-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

No need to enforce the MemoryRegionOps array length.
We index by device_endian enum, the compiler will easily
pick the correct length. Besides, this allow further
adjustments in the device_endian enum itself.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/serial-mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/serial-mm.c b/hw/char/serial-mm.c
index 13aba780ec5..ce5b589c3fd 100644
--- a/hw/char/serial-mm.c
+++ b/hw/char/serial-mm.c
@@ -44,7 +44,7 @@ static void serial_mm_write(void *opaque, hwaddr addr,
     serial_io_ops.write(&s->serial, addr >> s->regshift, value, 1);
 }
 
-static const MemoryRegionOps serial_mm_ops[3] = {
+static const MemoryRegionOps serial_mm_ops[] = {
     [DEVICE_NATIVE_ENDIAN] = {
         .read = serial_mm_read,
         .write = serial_mm_write,
-- 
2.52.0


