Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB93D116EA
	for <qemu-rust@archiver.kernel.org>; Sat, 29 Nov 2025 16:38:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vPNxq-0001FB-QK; Sat, 29 Nov 2025 11:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenmiao.ku@gmail.com>)
 id 1vPN6t-0001lR-RL
 for qemu-rust@nongnu.org; Sat, 29 Nov 2025 10:43:43 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenmiao.ku@gmail.com>)
 id 1vPN6s-0007ic-C7
 for qemu-rust@nongnu.org; Sat, 29 Nov 2025 10:43:43 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-34361025290so2168264a91.1
 for <qemu-rust@nongnu.org>; Sat, 29 Nov 2025 07:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764431020; x=1765035820; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q7GAq65ALZiNekqSL+tWMcLPurYu/ToQPTuazfohejU=;
 b=CITmvM3tekMHPnRJl1LjAVOlvhAsO/kTWIgC2JDMI0kEXK+F6j8xhaJJe2ulco7rCs
 AdzIff4dqiMj0HQYnVqj5ZUmeedmID6oV4AGhmE6TJvSPVSpcCI+LK9SMPoUGHK3RBgk
 xUB1Wpra0Ldr1exQQwhp/tJCMqsHu4F9yOFzpZMcrPJObyXqebERhbZzuD5D2/5XpVyG
 6N6rSQ3r1mSZCIRDZRZzOPOT+6JUsI+YgijV2QS4RJO+Mj+z7nfKQds4oiPdqrmq/wgM
 f23lLdv4qFcqoWykLOxbKVj4f95u2fE/yn/+jupmWguiqTJjK4hh8GZh6oXFCILi9E9t
 m84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764431020; x=1765035820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q7GAq65ALZiNekqSL+tWMcLPurYu/ToQPTuazfohejU=;
 b=vvCYmfYTsMkaHVEzj/XTKNbDnR7tFa4LlImvVfxaaNsueUiGppHjYmIOoZs3BGD/Dn
 qQ6RtBaxzwEkgqt0YlF+HJwD8J1ZTQygMh+fwmVmqbysQkV6+5owIWv5bwHhptosuBp2
 PB6LP4lI/9VvIHrAmykCowNgK4m17UxCdj7Vs6HokF6QweYgeHDYqqbXftkXs7RfFIO4
 jM9ZDxaaEtR/JWKAB9uIPqPepx3OoaGJENv9PsgYntrDNLBLwOF11di9HeQER8xEeyoW
 f9q9BhsnLa5/uharUaozg8EUG5hsnqSJqKlLf0gtbjrf2HRf04oGEnbxptF9BB347/ov
 a6Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/pUzKk2r0DE3un2mnsEn8gHK5R3j5lOo2YrqzL3whCZLsrAawop0f0wLiZN73KwRG5MD4F1eCzpo=@nongnu.org
X-Gm-Message-State: AOJu0Ywu7NlGdDkm5ualwQIVmGK9qIxiqli4d1zUeFIpNk7C/1jhsv/w
 mKo6yurvtgcDFiNPGnCaAI+yyUoKngLNCfx7gOE44KxE0HSq+K+865idmKGIoxOs
X-Gm-Gg: ASbGnctN33P0adBmm9Hmh0n8LD1EaFAJoKx5+geLmgkfYCs1qEXZp+Rel3MZPardTOh
 0LgDg4kg6gkwUQ9QUYBPzasuPwUvlpbIacxAhxK8d+BLafYdrKt7xFeIFR2WGdLGvnUyjT0M7Kp
 EkhqJDCZjCzBQ50qmjnyJ6pWDOADaXlTuKB2jJTBJsCItCJaeIDTqo2JZKTlIBQHJV7pCwv3h7j
 vh6jPUQWTlqpz2V2rTL62qiBdZUfRV0DWxJwlnUObi3t97azwf6CA1/S+cYoD3ikbjIa/2cvJyR
 RvNqKGuBcYLVjlgkxWjDhync8WLgXa65dJVpYPVzAA3rHtLYY+roIjK3aR93TngjRRkujNpxoiE
 3gb1ZjAxW/buLzizSc/d4xBV8LpyZXAyH5OukOkkirbTCatA0tLwJ7++LGVMxDPCeOVBCCW/etN
 Pjiz/NSBDxdD8yqfUUG65tjE07Sz8sNbc0LfGa4nSQZAZ3ag==
X-Google-Smtp-Source: AGHT+IHQHOBIA87g9yFL6b+/gFHAgieOClg/YNZv1M4P+X+n82NC2dGj9RTNXYxcCBoGtRGdG8I6uA==
X-Received: by 2002:a17:90b:5404:b0:341:124f:474f with SMTP id
 98e67ed59e1d1-3475ed6bcffmr15805700a91.32.1764431020348; 
 Sat, 29 Nov 2025 07:43:40 -0800 (PST)
Received: from nyaos.localdomain ([166.0.199.48])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3476a546ed0sm11799767a91.3.2025.11.29.07.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 07:43:39 -0800 (PST)
From: ChenMiao <chenmiao.ku@gmail.com>
To: zhao1.liu@intel.com, pbonzini@redhat.com, manos.pitsidianakis@linaro.org,
 richard.henderson@linaro.org, philmd@linaro.org
Cc: chao.liu@openatom.club , dzm91@openatom.club , qemu-rust@nongnu.org,
 qemu-devel@nongnu.org, hust-os-kernel-patches@googlegroups.com,
 chenmiao <chenmiao@openatom.club>
Subject: [RESEND RFC PATCH V3 3/4] rust/hw/core: Provide some interfaces for
 the GPIO device
Date: Sat, 29 Nov 2025 15:43:20 +0000
Message-ID: <69e22b6002d411a8edee3f589c568ce8217c2f37.1764426204.git.chenmiao@openatom.club>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764426204.git.chenmiao@openatom.club>
References: <cover.1764426204.git.chenmiao@openatom.club>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=chenmiao.ku@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 29 Nov 2025 11:38:24 -0500
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
Message-ID: <20251129154320.aSM65zgtxbhbecbzkfEgK0G7vAyExKjcLd5p-zRP2yw@z>

From: chenmiao <chenmiao@openatom.club>

In qdev.rs, we implemented the init_gpio_out_named function, which corresponds
to the C function qdev_init_gpio_out_named. We also refactored the
init_gpio_out function to reuse the init_gpio_out_named interface.

Signed-off-by: Chen Miao <chenmiao@openatom.club>
---
 rust/hw/core/src/qdev.rs | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs
index c3097a284d..28da94dd0a 100644
--- a/rust/hw/core/src/qdev.rs
+++ b/rust/hw/core/src/qdev.rs
@@ -17,7 +17,7 @@
 
 pub use crate::bindings::{ClockEvent, DeviceClass, Property, ResetType};
 use crate::{
-    bindings::{self, qdev_init_gpio_in, qdev_init_gpio_out, ResettableClass},
+    bindings::{self, qdev_init_gpio_in, qdev_init_gpio_out_named, ResettableClass},
     irq::InterruptSource,
 };
 
@@ -399,11 +399,22 @@ fn do_init_gpio_in(
     }
 
     fn init_gpio_out(&self, pins: &[InterruptSource]) {
+        self.init_gpio_out_named(pins, "unnamed-gpio-out", pins.len());
+    }
+
+    fn init_gpio_out_named(&self, pins: &[InterruptSource], name: &str, n: usize) {
+        let c_name = if name.is_empty() {
+            CString::new("unnamed-gpio-out").unwrap()
+        } else {
+            CString::new(name).unwrap()
+        };
+
         unsafe {
-            qdev_init_gpio_out(
+            qdev_init_gpio_out_named(
                 self.upcast().as_mut_ptr(),
                 InterruptSource::slice_as_ptr(pins),
-                pins.len() as c_int,
+                c_name.as_ptr(),
+                n as c_int,
             );
         }
     }
-- 
2.43.0


