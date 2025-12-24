Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AED4E75458
	for <qemu-rust@archiver.kernel.org>; Wed, 24 Dec 2025 13:49:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vYPDl-0006ip-Gx; Wed, 24 Dec 2025 08:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPDT-0006b0-0L
 for qemu-rust@nongnu.org; Wed, 24 Dec 2025 08:47:52 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPDQ-0003lW-17
 for qemu-rust@nongnu.org; Wed, 24 Dec 2025 08:47:49 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso46722535e9.0
 for <qemu-rust@nongnu.org>; Wed, 24 Dec 2025 05:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766584066; x=1767188866; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YVNa2eAoUvaGlMzA9uAofR7bmorBdrtqrTMlhne7wfM=;
 b=CUTWK+RyDBM+/p5NCXnY7ncwRX72tbnATTQ9wz+++3yBY0xKbNTrlKgaoBGVm0ytmM
 km6eX0VKdhN6y1T95KoxacrRMxktXvBeI4wjey9Fh5HcsQcYknmJK1N9Gb84kVzxN8Uc
 6bWeUmmELAQQqdSFcXqOYoGMoKvhrsMMIAAqouCY5kDzoLB5FxwDrphqNrGIXc0jL7UU
 DBdXkLv0UM+h04i6NmRirKGQbg7FF9vviKqzvI0Tsw9bE6opjAL9gmT7rLo0Rf9GnDsQ
 Vi9A/Jun6AgIGe6aHFy4X02Uk4lF//kD/5NkAWS49hg38EQQIzG5iPJyKPLciSHyVGIN
 HnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766584066; x=1767188866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YVNa2eAoUvaGlMzA9uAofR7bmorBdrtqrTMlhne7wfM=;
 b=eB+Bui0x5d9+F1TPZDYsUgf4Sgb5q+0pIjsVEsDIY36S8K93eAcwXA/PiYOZBd3QTZ
 gSL5AFQj3ppJdd+sgqGINl+gAHqPsNjwLlnKh1EUKKd73YnbO3PgSA1JSgByJe+0/nI2
 awSe+NSIoH6RO+vQhcDKeQn9PJs46TX2A6Y+TYdkXFNhvBpuShp8tuOuoZ3OGP/0ug8I
 Hq/2kbDTZafGT7qXvh0zjH5+wSX5HWhpp/1c+Z806KJirH/Dm4QeM0OBXaUxJQEeJAa7
 tBNfHd2UYNSQFxqP+R3jRjQuPa21mf8n1n70lUXIn5SOe8/66KvTwmu2aj+BDhmShvvF
 i78w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN24sJApvDsfIUNBL2EF7IUmSS40CAuHRnT3RN/1sHDX7CGjCAsqN5+3xRPPGasFK756XD6+lz7hw=@nongnu.org
X-Gm-Message-State: AOJu0Yy55E7VI0wY1AWzdEiqap0VTLr3Lpf9ABDCh1Eu8qF3UQgLWPNN
 m0Fi3gEgEBII/5y3fnC0EfX3ZNKvXBciA4nbRcC9SbUjAUF2RfBfU3C6I3OGTz/ZUIE=
X-Gm-Gg: AY/fxX5hHslbCmmTbEidHmWMi2T4ambeBi7HDqlAWiP5xxluzIt49i2C9YOTat4uDJk
 loSCP07wLPipoieBEnHloDrzhS9GN+UzD8HcWcMKbb8o0qMOIEH2djB36sgz+wGyGSvFAiY605T
 91OJXE9Hbf/YY0W2KKTFVfOAnazaYD8SFxjRbMXrJu3kmBfjUrrjOEf7s8vBPK1Tu2PqkvM9Df4
 NPNfCW7CTgfjv7I4vK0cIQhw3YW0o5p8RtsvgvVNZnyTJH3XwU7gt1fKZCRqK5QRgIIcEtgSsqx
 xPEC/949atDTJjGVi4y99wVYDpoJ7/5WAFreAn6bTvXJBH9FKicuru95mJxtiBEzPJZgLY/2U/2
 B7gKKcA6VkEQ8rIqn2a/2zBoF78vhtbaDj3luX8/QZn5EvaJVyQgLUD2+Gjmpb8So7nRZU2qdWw
 JUV2YtH45AHw/d9s2lg0vX8VhPX1MMJwZHBgcFQow0kn3QU4ac/c6rp1XLBCDY
X-Google-Smtp-Source: AGHT+IHXDwUHzpRL+TDil5DrS9Vl85n+PZugR84+0Eb1SFFlUSrkua5NwGAaCqdyd0s9porZQyyTRw==
X-Received: by 2002:a05:600c:8718:b0:477:9d88:2da6 with SMTP id
 5b1f17b1804b1-47d18b0ad6fmr172243755e9.0.1766584065962; 
 Wed, 24 Dec 2025 05:47:45 -0800 (PST)
Received: from localhost.localdomain (218.170.88.92.rev.sfr.net.
 [92.88.170.218]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be2723d19sm376208935e9.2.2025.12.24.05.47.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Dec 2025 05:47:45 -0800 (PST)
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
Subject: [PATCH v2 7/8] rust/system: Stop exposing bogus DEVICE_NATIVE_ENDIAN
 symbol
Date: Wed, 24 Dec 2025 14:46:43 +0100
Message-ID: <20251224134644.85582-8-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224134644.85582-1-philmd@linaro.org>
References: <20251224134644.85582-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

We want to remove the bogus DEVICE_NATIVE_ENDIAN definition
(by only having it explicit, either big or little one). Stop
exposing it to rust devices to avoid it spreading further.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 rust/system/src/memory.rs | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/rust/system/src/memory.rs b/rust/system/src/memory.rs
index 4b3316bf767..4e06c16a0b5 100644
--- a/rust/system/src/memory.rs
+++ b/rust/system/src/memory.rs
@@ -78,12 +78,6 @@ pub const fn little_endian(mut self) -> Self {
         self
     }
 
-    #[must_use]
-    pub const fn native_endian(mut self) -> Self {
-        self.0.endianness = device_endian::DEVICE_NATIVE_ENDIAN;
-        self
-    }
-
     #[must_use]
     pub const fn valid_sizes(mut self, min: u32, max: u32) -> Self {
         self.0.valid.min_access_size = min;
-- 
2.52.0


