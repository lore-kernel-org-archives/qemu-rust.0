Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E54D6E2D1
	for <qemu-rust@archiver.kernel.org>; Thu, 18 Dec 2025 18:21:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vWIau-0006UL-A9; Thu, 18 Dec 2025 13:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWIae-0006Q1-DA
 for qemu-rust@nongnu.org; Thu, 18 Dec 2025 13:19:07 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWIab-000344-97
 for qemu-rust@nongnu.org; Thu, 18 Dec 2025 13:19:03 -0500
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso4206115e9.2
 for <qemu-rust@nongnu.org>; Thu, 18 Dec 2025 10:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766081938; x=1766686738; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KVD7KeNHSoZXyk7/Vq+5GFFpep3i4V4TnIDs7GSc+Ig=;
 b=PJ1fLip4iN0iWvuoPWWWMS76ALLXbphvsg/5iZeBJMvco/8GFsIYnio2t2Bi1V5w0c
 7HCtowB8DoTUxsYOacbGnBdIcWXOfHvsxUap/UfeqmhPNhxAM6hs8poQ/LvZirhuiLva
 lcyC44ERb3iEpRqOUvJiii8VVN+UmQQXO/Y0kd6fQFzyLHGtE8+1bt5/4M2BpSBfoJzs
 u3KnGApmVjc4Q/vruH23SAIu4MR6yAYRl9vDbSDvuydretMBQ8IVKb0VHjkTN05oW1Re
 lwgdIc60ejwgKtxFh1c1SzJmo62DzOZdCFBbZBGs4H1Gh32NLTLkeeT5X7o1OZkO7GM6
 9muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766081938; x=1766686738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KVD7KeNHSoZXyk7/Vq+5GFFpep3i4V4TnIDs7GSc+Ig=;
 b=GDImFTYcOVsWMO4bxcazQJQo9idrrrVHuy9VyMrfs8JHsMbrGxHoL4uyBSt32dCusr
 GzSOq+SBat7vujjN4l+cAIpcXXzKbIZZPJ8ovO1XwH6PhmV2v7swho5OmJArg+jxTLbt
 niq6O39QDXyEv6rtmXDV7I8qWtSE95q6wGeyVwN+O55SviX27bc5uYBMVHiCZMbNJdwC
 fAxJNzmrzg/fdBNzLhT9mG+TZq315teoEDFNgQz1yPwcdLQFuxPcZhxuxDGCyrr8mSgF
 +32yLnFv9GGVEks4+MiREek3e9NgYqN53B2hPWgY3T5XLDXm4DmRXMFsG6EZ5Vuffp3z
 5SvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu3DJ6f5SmelW7Eoy9ck4mYbEiGV6xyrJKpJhCFDl243OwGbcCofkDQYUg7cvtYbuRPJc/fZbRgIA=@nongnu.org
X-Gm-Message-State: AOJu0YwRVoNpz2FonI/JX7H/XhKsTpSfElKA9hj999rZEaNoPmzEGLTF
 /EJs6K5lAeCoNMmEi4Mxf+wRBdPdCZRTQdp7hNTQFlA3JY+k3uuv1hTi/YpHONh9kk4=
X-Gm-Gg: AY/fxX72i5/cbSCyBCsISRYq3RJvyW/20RLdyK62uhW71x46DG35TZg09vdNjCPWe3S
 7aqF8pLH4s3D6nk8csCy6xerPWLYdlZMD9cINg0g2XENjUNhosT80eR3sAviN7Ody68PkYao3Sf
 MOMOSRSMW0MvUxxtYuaPDGXlE3YAjdk8Z5V+3EXB4fr9RRqkGWC/Xv/q8CECQTvO1gIvGexH8WU
 l3lF8VizCwXqqJgmfSzGSJSdmwpOlBEAc6MZ072/8qkrf88JZe4gUQWq0lAStqXSYV9m4vIfn/2
 U+Wf4G37x/dqRFxAAnqDBrT767GtfdCKE4zvH9juc61lYGCxxyd0twf/2qo9tFo6dFDrFC7cbT1
 bRKhpk4xTjrz3x5s2kf2cpVT6M6Od2in26yAMQxGyl/FEnXPKdEh+SFFvQsxDRtlUBQ/qBcQmvo
 PptzsX/X3CGugMlHyAFAjb79RvKNxOgKRnncbeWb6CqsWECOmcUaeeAutEEUFT
X-Google-Smtp-Source: AGHT+IEQS04J5k9ys7VUrixvOqoIfqYL77w/GAjeUbl8nGYnPKg+ydshN38AfVjuXuWkE2AFDKoNcw==
X-Received: by 2002:a05:600c:3489:b0:479:2a09:9262 with SMTP id
 5b1f17b1804b1-47d1953dabamr1379125e9.9.1766081938576; 
 Thu, 18 Dec 2025 10:18:58 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be2723d19sm62333055e9.2.2025.12.18.10.18.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Dec 2025 10:18:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-rust@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/6] rust/system: Stop exposing bogus DEVICE_NATIVE_ENDIAN
 symbol
Date: Thu, 18 Dec 2025 19:18:11 +0100
Message-ID: <20251218181812.58363-7-philmd@linaro.org>
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

We want to remove the bogus DEVICE_NATIVE_ENDIAN definition
(by only having it explicit, either big or little one). Stop
exposing it to rust devices to avoid it spreading further.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


