Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3091FCFD2F6
	for <qemu-rust@archiver.kernel.org>; Sat, 29 Nov 2025 16:38:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vPNxr-0001FD-IA; Sat, 29 Nov 2025 11:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenmiao.ku@gmail.com>)
 id 1vPN6l-0001jS-Sp
 for qemu-rust@nongnu.org; Sat, 29 Nov 2025 10:43:35 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenmiao.ku@gmail.com>)
 id 1vPN6k-0007by-8t
 for qemu-rust@nongnu.org; Sat, 29 Nov 2025 10:43:35 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-3437ea05540so2212169a91.0
 for <qemu-rust@nongnu.org>; Sat, 29 Nov 2025 07:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764431013; x=1765035813; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TYQYrBtyfKJUAHag5BzfJ2Xcf0l0PHjigYu6ruxK0gU=;
 b=SC4I3+lNyLz2h60iUqeAjDk0rDdn9P+UP/dsIxD2hj3dJbDHtLNBcFcSR+9vbwmQBg
 RXlixBy9SDmR0iXEL+hkqUrDGeR2n1llxvgRDnown0OW249YJUAhZViqSqJIoVjFH0Dj
 h+Pby3+86H+0NGHaGG3GCQTg7YW989I8EahOCuE/iJH4vI9aRNtkHBFb0mD5+rFBpA2C
 y3x9LuVP9FEUXUWDpPjK1B1bF/5zLBdil71VuU0n76GKKpBxk8StO0ncExo7fRCTfu+M
 luxE4tJhbpr+xk+GlaJioccYVhm3k7VNI9FhIMeg7o9kz9vakIDImPhiiHdSy9Rvr8wV
 CC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764431013; x=1765035813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TYQYrBtyfKJUAHag5BzfJ2Xcf0l0PHjigYu6ruxK0gU=;
 b=wR8RPybpu/IgxFGiB275gPPiZRQqh9+rDT7A0EQpjL1QMWi/PYkdBllIRzpQU0M/Ho
 lrHlRk+uau2U0bQSJxp1tPEW1qwp/a0XdoHzic26efWGjfX8pKtX6A051MLqJUW8WnUF
 mH/sMQjA3hxHm2sTlqBiyA5KrFpxxvqLuuuix/Sz9JycZd3QU1ZiECCt1dCHwZ+3V7P4
 ZadaOm7bWmFkmyG7/x9srGa92opKwgri640ggKNiMNHV+111eVaRpJuJd4iabIC5rOmW
 SAj2YG5uirue5PsXpQof3kmdoKDfJ+nusr9Ck1mdEIUPcA/uelfCVFbjl7bumh8UsgJV
 OtqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJswae1y94MlJDZJkuTkHiDxHbeRMXtK0rGiy0wFsC4V1X3B2OwirU8OGALTIz4g8Zzh3odus5Daw=@nongnu.org
X-Gm-Message-State: AOJu0YzoxxHd74eHp1yI2GF21d0JSTiL8O7idSrmJIuLM14H6AM/47LT
 5DYltyrikioM201Bf8ZcrJIwpFWIgbAJsc/YgHcDBdmHs1vJymalcdvG
X-Gm-Gg: ASbGncvtG9xJdaRQIAGtvPFl2YR61qAIbXKyqh7/D+930kRP5JgPdHhYAfAlbjO9nFl
 22Hrujba3MGDRiJS40805wOqhkK48h8lJj8cIZxDJmdJFlC63QcegTxAsXJzQBKN4TH/tF29IA5
 3AHcj1vaWYNPxsMyQqA93VXjrkw9SQdpOgwqxv+ixTyUPWg/hEFlWTsbwx9JrSLjqbqwUYrv8DR
 0BxSa9d51q41xYNBg45Oslq27QDCf2U76UYYzwjYr4abs6sYECr+0UKE6xwPFEwPwaTw4Jv3eEC
 2Ku8GzGdzboF2nei/HBHHW1n9HQwYU/sMwZpir0881e8hACAB9cLibmYH3svJK4dh3HQEkWAQUc
 Zqgxx41IMEUMV/O1KgoDZiKmN0uQuKyEA7ltoTjFpYwA3JTX+TgLsSTwBGjlk8QMR6a2AHvomuJ
 q7yjbsKHdkatX5asDsIlspHmk/IIGfFddxwF4gXCR64qsZTw==
X-Google-Smtp-Source: AGHT+IFGADgMZeoPFYsyuLQg/56m5CSR3OcjwtVJ7hQIqFyGj5vDKBOWCyFXt9ilhVm9MdUX1lx9Lg==
X-Received: by 2002:a17:90b:3503:b0:340:be44:dd0b with SMTP id
 98e67ed59e1d1-34733f5d2femr25991880a91.34.1764431012822; 
 Sat, 29 Nov 2025 07:43:32 -0800 (PST)
Received: from nyaos.localdomain ([166.0.199.48])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3476a546ed0sm11799767a91.3.2025.11.29.07.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 07:43:32 -0800 (PST)
From: ChenMiao <chenmiao.ku@gmail.com>
To: zhao1.liu@intel.com, pbonzini@redhat.com, manos.pitsidianakis@linaro.org,
 richard.henderson@linaro.org, philmd@linaro.org
Cc: chao.liu@openatom.club , dzm91@openatom.club , qemu-rust@nongnu.org,
 qemu-devel@nongnu.org, hust-os-kernel-patches@googlegroups.com,
 chenmiao <chenmiao@openatom.club>
Subject: [RESEND RFC PATCH V3 1/4] rust/hw/core: Add the BusState of rust
 version
Date: Sat, 29 Nov 2025 15:43:18 +0000
Message-ID: <4e3b8548a26867260f137c719d3c26a24d7954bd.1764426204.git.chenmiao@openatom.club>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764426204.git.chenmiao@openatom.club>
References: <cover.1764426204.git.chenmiao@openatom.club>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=chenmiao.ku@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 29 Nov 2025 11:38:22 -0500
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
Message-ID: <20251129154318.vniu0RTs7_WiWlSw5GwABeDazbpjZIPMSmQ3F9NskyQ@z>

From: chenmiao <chenmiao@openatom.club>

A Rust version implementation has been designed for BusState,
which will be used for the subsequent I2CBus implementation.

Signed-off-by: Chen Miao <chenmiao@openatom.club>
Signed-off-by: Chao Liu <chao.liu@openatom.club>
---
 rust/hw/core/meson.build |  1 +
 rust/hw/core/src/bus.rs  | 44 ++++++++++++++++++++++++++++++++++++++++
 rust/hw/core/src/lib.rs  |  3 +++
 3 files changed, 48 insertions(+)
 create mode 100644 rust/hw/core/src/bus.rs

diff --git a/rust/hw/core/meson.build b/rust/hw/core/meson.build
index 1560dd20c6..efcda50fef 100644
--- a/rust/hw/core/meson.build
+++ b/rust/hw/core/meson.build
@@ -50,6 +50,7 @@ _hwcore_rs = static_library(
     [
       'src/lib.rs',
       'src/bindings.rs',
+      'src/bus.rs',
       'src/irq.rs',
       'src/qdev.rs',
       'src/sysbus.rs',
diff --git a/rust/hw/core/src/bus.rs b/rust/hw/core/src/bus.rs
new file mode 100644
index 0000000000..d3fbf519d4
--- /dev/null
+++ b/rust/hw/core/src/bus.rs
@@ -0,0 +1,44 @@
+// Copyright 2025 HUST OpenAtom Open Source Club.
+// Author(s): Chen Miao <chenmiao@openatom.club>
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+use std::ffi::CStr;
+
+pub use bindings::BusClass;
+use common::Opaque;
+use qom::{qom_isa, IsA, Object, ObjectDeref, ObjectType};
+
+use crate::{bindings, DeviceImpl};
+
+#[repr(transparent)]
+#[derive(Debug, common::Wrapper)]
+pub struct BusState(Opaque<bindings::BusState>);
+
+unsafe impl Send for BusState {}
+unsafe impl Sync for BusState {}
+
+unsafe impl ObjectType for BusState {
+    type Class = BusClass;
+    const TYPE_NAME: &'static std::ffi::CStr =
+        unsafe { CStr::from_bytes_with_nul_unchecked(bindings::TYPE_BUS) };
+}
+
+qom_isa!(BusState: Object);
+
+pub trait BusStateImpl: DeviceImpl + IsA<BusState> {}
+
+impl BusClass {
+    pub fn class_init<T: BusStateImpl>(self: &mut BusClass) {
+        self.parent_class.class_init::<T>();
+    }
+}
+
+pub trait BusMethods: ObjectDeref
+where
+    Self::Target: IsA<BusState>,
+{
+    // TODO: Since the bus does not currently provide services to other
+    // components, we have not implemented any functions yet.
+}
+
+impl<R: ObjectDeref> BusMethods for R where R::Target: IsA<BusState> {}
diff --git a/rust/hw/core/src/lib.rs b/rust/hw/core/src/lib.rs
index b40801eb84..10cc516664 100644
--- a/rust/hw/core/src/lib.rs
+++ b/rust/hw/core/src/lib.rs
@@ -13,3 +13,6 @@
 
 mod sysbus;
 pub use sysbus::*;
+
+mod bus;
+pub use bus::*;
-- 
2.43.0


