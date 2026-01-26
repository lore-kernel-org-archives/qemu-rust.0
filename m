Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA563D1951B
	for <qemu-rust@archiver.kernel.org>; Mon, 26 Jan 2026 21:14:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vkTup-0008D3-BG; Mon, 26 Jan 2026 16:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kashif04x@gmail.com>)
 id 1vkTpp-0004Yq-Hf
 for qemu-rust@nongnu.org; Mon, 26 Jan 2026 16:09:22 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kashif04x@gmail.com>)
 id 1vkTpn-0005ix-1H
 for qemu-rust@nongnu.org; Mon, 26 Jan 2026 16:09:21 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-81dab89f286so2475596b3a.2
 for <qemu-rust@nongnu.org>; Mon, 26 Jan 2026 13:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769461756; x=1770066556; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kosn0WAQuevoMsLu0uEvasVX+DCTWkopGnDCnhcTRFo=;
 b=laVIgp7T+lDJFDCz6yf2xIGEjD8s3pPZb9DQShjk797hf4bxxV18v5J3li92gNFOIx
 6Wf+Wh8t8Mv58OctKpM6Hc10io2kFz5fb9/ekBuE/XhFHtWvumHowVsXgrN7BkBcVgCB
 TFnIA9HtBE8iVwapjr4h0BQPFr8KN2YeDChSEpbNjVmX5P+TUMioIrhQra1egdxy/0ZQ
 UxLOBYAz4IL9MPNCRXU3WFwTofnDLW0hHbcDmM5cA9rfagiwjYsT9AGcNWQjNlgjSqgl
 KlihK/YZc/Qz5VUvuOgdtbdb+3gi6p9Yu/a38WK7q3ZjXoIiBqqBUCIKju1G9P37CqWn
 k+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769461756; x=1770066556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kosn0WAQuevoMsLu0uEvasVX+DCTWkopGnDCnhcTRFo=;
 b=aMUmfgsJYLBdhAEuliV8VFwEQE00b7/DmYy+GF0pwg1tukU83UjOG5v4qLnyZXEgUD
 cLUrj63A0MXIZvPdD1Ap/pjqjme0wjq4kLHNu9konXA+p9X8/yxFne9SLgRcLMYzbTxB
 3VM0PDqA/CzfW7I5HSeLSQHlwnRHuZaZ2S5g2jp4blB/1qPe8CoVJyK5MhFKzh+Q64ud
 +Lcl2DFCJHadnlBbGXmL7fwHAQeu8UDyOezNePbtZRYuiE0hmOTPoBlm+q8n1fSXW0Xi
 bCvN6fVmCoHFy4/a3sUmOuY8AwvEbpLj3U9yIxUBHyBpteVNR8Nyhm9NQ3xsECa13UYv
 QrzA==
X-Gm-Message-State: AOJu0YwK8W85v4Wb15gMi2wdG8YYBIrO8oJiwYMrjLNHdbMCcU3kvMoz
 HVJ8M834yu/tuSCMKzeK0tvaxSLdM+ma260DTL/FoWFe/2c8aGKQsoyf68wXrg==
X-Gm-Gg: AZuq6aLpKdQnD7OOO+caT7RdAFhKbcrbvDvNG+CVELMy343KhRVZERr0xNGhcF1mXYB
 i21PC21Vu8aCnw4DnSFBt0F+WTh30JLcGwilI0ZY7hV5fuTlsFzyF2NyqbcvoR5U36jA8WOlPFR
 3WM6fwIW9tSMTk70tbS24dgSDdmX04tSm9gRtuoTeJ3yJBwk5PmzhkVLoXEj8b91k56U1mCg8L5
 g0uFcXF77sK9yRKSe1DXktxWxIt1X3hFdWeYFd0JFjA4jJYl5JT8pN/T2CdUDg1V0XTc6Q++/BF
 OID9Ax++1yijDGVTbBgWECkn52i+MZIUy/RqTIh7B25qfjP/T4CC0lZIx7BoK9o1DbuijfRCfBz
 umyeV7ekG8f2uNP1LvXhvlnzNJD/018xYNjp+ekNLRYrunZj31InIhVq9cr//B6yYnYMhxsVav+
 CfOpqr14GvwQN2KpbReQ==
X-Received: by 2002:a05:6a20:1604:b0:35f:5fc4:d88b with SMTP id
 adf61e73a8af0-38e9f0e9b7fmr5841985637.12.1769461755876; 
 Mon, 26 Jan 2026 13:09:15 -0800 (PST)
Received: from Third.localdomain ([157.49.1.62])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c635a3f1ebesm9350512a12.19.2026.01.26.13.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 13:09:15 -0800 (PST)
From: Mohd Kashif Khan <kashif04x@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Mohd Kashif Khan <kashif04x@gmail.com>
Subject: [PATCH] rust/hpet: remove stale TODO comment
Date: Tue, 27 Jan 2026 02:39:10 +0530
Message-ID: <20260126210910.28889-1-kashif04x@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=kashif04x@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Jan 2026 16:14:30 -0500
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

The irq binding is already implemented in the following line, so the TODO comment is obsolete.

Signed-off-by: Mohd Kashif Khan <kashif04x@gmail.com>
---
 rust/hw/timer/hpet/src/device.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 4757bf5fd5..ebf715d399 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -725,7 +725,6 @@ fn set_cfg_reg(&self, regs: &mut HPETRegisters, shift: u32, len: u32, val: u64)
             self.irqs[0].lower();
             self.irqs[RTC_ISA_IRQ].lower();
         } else if deactivating_bit(old_val, new_val, HPET_CFG_LEG_RT_SHIFT) {
-            // TODO: Add irq binding: qemu_irq_lower(s->irqs[0])
             self.irqs[0].lower();
             self.pit_enabled.set(true);
             self.irqs[RTC_ISA_IRQ].set(self.rtc_irq_level.get() != 0);
-- 
2.43.0


