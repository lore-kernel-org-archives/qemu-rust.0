Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C20E75453
	for <qemu-rust@archiver.kernel.org>; Wed, 24 Dec 2025 13:49:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vYPDV-0006dY-6O; Wed, 24 Dec 2025 08:47:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPDA-0006Ke-Ns
 for qemu-rust@nongnu.org; Wed, 24 Dec 2025 08:47:34 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPD8-0003jC-Jc
 for qemu-rust@nongnu.org; Wed, 24 Dec 2025 08:47:32 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso24716805e9.2
 for <qemu-rust@nongnu.org>; Wed, 24 Dec 2025 05:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766584049; x=1767188849; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vEDW4pEiOQF8aZTfRkTnnN7IXm4k0EgK0HcgihEUm50=;
 b=XrhVX0ttzGoUcaMV8zurqxZEZ16jNyjqtSICZY9/hwZ3yvcb0ILHRhvNqNEMPc5OZn
 1GQY2TIA2CbWlc2WkCf6AWKtnoVUsP/Oc8AGQTvDK0TuISCkma/sqWoHygRxWhXFCnHv
 MGr6Y1zeoELCsSu1+e1rex4GJuO+wEFM5YzhehTqeVeCAWhz++x9JTJMz9uQ1mbPmvGS
 iFSHDB6JmPyRGBw5N0XlUdIB1FR0BjkzFJGix4jxY0SqGMNgETjtdBeTU2OLi37WF4jB
 QtFvCHsKUtWuI58vLpiAyWJRdnKTy17MbISxQPYXBW0/v7vbmhni1xGZF9iHjpBKYA4/
 HxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766584049; x=1767188849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vEDW4pEiOQF8aZTfRkTnnN7IXm4k0EgK0HcgihEUm50=;
 b=Vh84+QsP/5k7qTGhAjXyn7CypZU19Z+DhI0gRhb0NOJn2IElGl9ysQcwEZex00Jwrr
 QiOEsIPhRKuxhtRgZ40orMRZplK5iKHdokZQz4iEWyoLOZ2CFEM+k6fOuNx3o5J/UkCF
 hKkrmVjdk9knbCYcubDuItlTCKvtQ5kXN0S1UTuepbx8EXmk0NBwwqLjF3uPV7dzrsh1
 vY2SvPHkYykqi0qSZtaG/YgkBMgfaQXYCTXKwE8w21Ly9jxNlQ3pYS9lEPdNtHs/8hPM
 e9uz6Cj3N/s6guJqUMmrVMZtpybFJ+3SOYisCvO8wvqzKEIjAnTSIIxyZ+gY65Zd2Ln5
 lV8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvLLag61AzAPueNI+mm9u7PkqLb6cd09VJWkLdG60kxOi58dTLalE0JYzm7C7bi4wpox+molgIPGQ=@nongnu.org
X-Gm-Message-State: AOJu0YxcjbVpRFi1+OvkulCP+gNuZw6eQgqxIqJMF/p1SRA41OcmfW2D
 9+shMuJnPgff/2br2pGKSWaty+pimyuptNVRw0CI+DwXW7qc7S+aRIaZBeoIK8qjOd8=
X-Gm-Gg: AY/fxX5zGJ0rseM1JlAyICYrSEegNAqfp7Wv8cBorrcULp1uhVutHENdvgFNO45DA8H
 1spdOKuJZxsCm4oQahhDkkQ8UY2A88CGKzTWvGWHfZil4JLEmOFfjePq2M0g+by06Zp/0tYwlMd
 8pWJOOrNB0Rn4WXwVNhAfMGBGS4VpvQB1OQv6LrOGZBUEy+7HZYMbxrJTgy9Cxt86XJdcgR1B2l
 l4+LwsNLMQFPo5Qsri0KRrcxN8j8VUtdfx2mMIpkzOUufjQtad2xIw9vnekON4okbWr41f/N7b6
 3RuEN9ZxBf5dTYPHi6y9UMkz7G+iurqk+sOuATCGHTQMBfS9sH3H2oIYW2c9QhvBVe/aCUtAlrc
 9fRTIEiD6ghj25obgvBwjukACuotgial6+OjOKjQcDsnVkPlkJNgynFs5BgeMZ5bGxP+Pd8mbvR
 JO3zPrFn8ADiJuY2YYn7Am5oXvZHiKfXs5Ws+XMTLxfS+316jRbcgBTngIGENV
X-Google-Smtp-Source: AGHT+IHnqJsRELm10jBU2RIDVAqxKRtc3Jq/rf5twmbfPMauJFhpRv+bid2csAak0epOYGPiW2VxtQ==
X-Received: by 2002:a05:600c:4ece:b0:477:6d96:b3c8 with SMTP id
 5b1f17b1804b1-47d19576da2mr172053595e9.23.1766584049207; 
 Wed, 24 Dec 2025 05:47:29 -0800 (PST)
Received: from localhost.localdomain (218.170.88.92.rev.sfr.net.
 [92.88.170.218]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbc0bsm300874335e9.11.2025.12.24.05.47.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Dec 2025 05:47:28 -0800 (PST)
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
Subject: [PATCH v2 5/8] hw/timer/hpet: Mark implementation as being
 little-endian
Date: Wed, 24 Dec 2025 14:46:41 +0100
Message-ID: <20251224134644.85582-6-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224134644.85582-1-philmd@linaro.org>
References: <20251224134644.85582-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

The HPET component is only built / used by X86 targets, which
are only built in little endianness. Thus we only ever built
as little endian, never testing the big-endian possibility of
the DEVICE_NATIVE_ENDIAN definition. Simplify by only keeping
the little endian variant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/timer/hpet.c                  | 2 +-
 rust/hw/timer/hpet/src/device.rs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 1acba4fa9db..bfad626d5e1 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -648,7 +648,7 @@ static const MemoryRegionOps hpet_ram_ops = {
         .min_access_size = 4,
         .max_access_size = 8,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void hpet_reset(DeviceState *d)
diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 3564aa79c6e..4f4be84115e 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -708,7 +708,7 @@ unsafe fn init(mut this: ParentInit<Self>) {
             MemoryRegionOpsBuilder::<HPETState>::new()
                 .read(&HPETState::read)
                 .write(&HPETState::write)
-                .native_endian()
+                .little_endian()
                 .valid_sizes(4, 8)
                 .impl_sizes(4, 8)
                 .build();
-- 
2.52.0


