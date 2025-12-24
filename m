Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DFEE75453
	for <qemu-rust@archiver.kernel.org>; Wed, 24 Dec 2025 13:48:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vYPD1-0006Fj-1b; Wed, 24 Dec 2025 08:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPCu-0006DV-19
 for qemu-rust@nongnu.org; Wed, 24 Dec 2025 08:47:16 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPCs-0003hK-HW
 for qemu-rust@nongnu.org; Wed, 24 Dec 2025 08:47:15 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso49216285e9.3
 for <qemu-rust@nongnu.org>; Wed, 24 Dec 2025 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766584033; x=1767188833; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mzJWK1Pwrz6pQgzGHNT2SkE91x5BTAmZmkQLDY1djl8=;
 b=yuWtnNVk/QEW//KsTPyLWokD5+V1NVxlELmtPAT/RYO9KqqpM36ggK2i3nqhVwlmOp
 MRWi5fPINios6HrWKXeNwUTo52IfX45gFrExHqiwFCrcpXQvgd+z/nuY0XLBL65VJ7Nr
 GYoPXtIrHOV3f6n17UFuWHJaiMUw+FPbWExIFXlEaskmcbuqvlP+C4ryY402SJApnCz4
 icl+FGJn5Ouz5aPQL7TWEbA509DUBeU77t0Jo/p1p27/vsrICzw4vU/1NZEMwoVWustW
 GDW1c5FDT8wLK9RKtTCRbPrPPt5gtRaePT4RWYpsTYpSSUYlMjanKLToAUCfNDEMiHuE
 ZgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766584033; x=1767188833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mzJWK1Pwrz6pQgzGHNT2SkE91x5BTAmZmkQLDY1djl8=;
 b=t9oiGExYVjLJGkPB2cU4f1NZUS3UsJiubEgM7khJsrlPSzHBpgcBAT08ayWINl/yVX
 jKAK4etINvpvbF9CGbAvRNHsi1YXs/xKv5Hnf0TWHT2ywY8vlcaGW7xw8ZSJogQ5cMIG
 bL07YWsGyaw0tx1mfE8L369DxGTRLnpQU9v2rezZ04IOfV0yHTX9YY7guehBPn/dyk3/
 imkA+MyRARhiLiWBQtM3DvrMuDPxX79zMk1GnQnK0QH8cOo0nNT9R+P+DkkIElZ7UMQO
 wJIvIH6bRopV5pO8UNTMIXGqJYpg0qOZV19QCyY/QQaI/ZzUlABsu8rzRWz2hjI/nIZG
 QQMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqfTee5vt1ApCwngKNB8GvOtHVpZUBDSDKD3iR3wqEhwsdnJZ6Eau+LC6MXYCK/AC3j6EVDgjTXJw=@nongnu.org
X-Gm-Message-State: AOJu0YyoKp+nRvI2H7RUo5PmZg21wP3ebex0D9Sas0VBZHeriLdkTb2K
 3ATBzyp7+bm7Yj5OFCCcm9YsBH0ShGT/rcqVDELukGpGvZOW6p/AkVPASGQEXZXOiyc=
X-Gm-Gg: AY/fxX5sygvl32CHRKYMYsuqcWSUvbiVonrf/yb2yv6a06VhfQfZYcQVEB+xFI4f0np
 7UrJ1VtpAdYk9TEQWm/+/5o603unHCujMZhPs3wz3wJcb58ERyjJ3ihqteJjOzVmOQi9cfPNjkV
 8cX27C+SeYe5V+sJSHcSbGUMz31p74x5eyE6CaOttBdMjH9EMkVz/dR3H1bf8QK5QkTs1DGJ6Jo
 08VyNTOXyVRDePo0vvB71Ps3uVj0r8pwefhCm9wxHZNaSAawzVJgk4yKxZHrn///JLGzCoV8kvz
 +ccvf8nnIS9b+/fNWiRwYdeqPpqnpXBvSJsGW223QRXti0IQoT/yJMP9LEM6xhMbukprsw+325p
 f2CMY0yNc/83MceGFJaEgFtbGbdVmebcsg1pWVBVslg+Ekg3CTAJYBm6Dp1d7lYp5Phw/IPrBsF
 wb80zOHsImC57Ot9hz3moPzrhV070SaJeHuvb+akOrG0QVcGB8wNOpi5skM7B/
X-Google-Smtp-Source: AGHT+IE6d2LSdC6q+oqc6RwJA1fiu6p4LVLRShJBs9yHrS2whS8MUQ6qgmixDn44iQOJcXVuaAbG2Q==
X-Received: by 2002:a05:600c:4e15:b0:46e:1fb7:a1b3 with SMTP id
 5b1f17b1804b1-47d276f8addmr143618495e9.23.1766584033124; 
 Wed, 24 Dec 2025 05:47:13 -0800 (PST)
Received: from localhost.localdomain (218.170.88.92.rev.sfr.net.
 [92.88.170.218]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be2723b2bsm345661975e9.3.2025.12.24.05.47.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Dec 2025 05:47:12 -0800 (PST)
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
Subject: [PATCH v2 3/8] hw/char/serial: Let compiler pick serial_mm_ops[]
 array length
Date: Wed, 24 Dec 2025 14:46:39 +0100
Message-ID: <20251224134644.85582-4-philmd@linaro.org>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


