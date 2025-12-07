Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D61D2CE17
	for <qemu-rust@archiver.kernel.org>; Sun,  7 Dec 2025 04:34:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vS6TS-0001du-HI; Sat, 06 Dec 2025 23:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenmiao.ku@gmail.com>)
 id 1vS5XE-0002uc-4r
 for qemu-rust@nongnu.org; Sat, 06 Dec 2025 22:34:08 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenmiao.ku@gmail.com>)
 id 1vS5X4-0002Tl-33
 for qemu-rust@nongnu.org; Sat, 06 Dec 2025 22:34:01 -0500
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7bc248dc16aso2674675b3a.0
 for <qemu-rust@nongnu.org>; Sat, 06 Dec 2025 19:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765078428; x=1765683228; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TYQYrBtyfKJUAHag5BzfJ2Xcf0l0PHjigYu6ruxK0gU=;
 b=mCqhMVgSYTupCxvSl0a2p1Bd65IKi1t3SGE+vKv3n1uZOohAIky8ZYGihrgE4N305h
 xzWW2bBvIYH8X0cBrQxsjcf3vWQmxLK+xHBiTKnAzyeLpSJKg0Xn4sAe+AsKU9Xqdd0v
 KZPBUGWQJaPw7WAxTjwKoWtlJ56RZjcaEn821o08niPlzaxokAqv7xDktWD9IAgfWWDw
 lomKfdZetRm83g1od+tSM/ay7Xvv8wx5MM6ep04ewO7xWj2eqRYn5mIb1iGIkcHK8smd
 9Si0yk+eZ1DmcbJro6ptWaOMHShpoyTc4CElf6BO4+QDmFD2NBFtzql82XbsIT7aiUnn
 MbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765078428; x=1765683228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TYQYrBtyfKJUAHag5BzfJ2Xcf0l0PHjigYu6ruxK0gU=;
 b=eJn9CRsANnpnrJPYFvWRNqBR4LiSqJ1azDn6PLsSgH3OywyM5INCWZryHEmlnKcusE
 3UQZjJYyW+EwiAqbH67DQu/VjbRAjYPFGoKAQn1VkJYBw8gbhmKJDyDAXA97xUALFRPs
 zi2DPKnPMOQFL6iYkpbuyooCaysnGCTsT6YJX6p3E72C4+qT/IJrUo/IKQY4Pc+mE0fg
 UoggX/OnqmwbXEgCeKlIqbrQOKhSJk8E7N2/S8UKTSAHfieKqAIOO81F+wEWovdQEVdS
 OgqLaxKym0KmkwW2mPuQPKAK9uVLHPxsL5IA7q054W3MNhxQiA56lnD/+t9EW1WrR2gA
 qoFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv4HkA7+8mEg5nQcZFBzr/vXVAzORpxiJSk5xhpAIKhzw7TB5IUopZK1ehvMEKn3YhaAl1zkN3QDA=@nongnu.org
X-Gm-Message-State: AOJu0Yw7mKetKaan18faXgQQnk2Urp37fmE8t7KMaJKX8s9qLlb4pirQ
 yx3rqhOhO7WY5WCtK0Uw6aA3vtsGo17kclkQJylTngHCfXUOVRmwglgv
X-Gm-Gg: ASbGncsrBpUtdJf3zqEG9u6rtKT7Dt1MrP3h0iwb2BT2eSpwYvufJQf95qD9/MbzR94
 rn+GNvCvvgUKXLoyzdUe6pqPPaO5sKdqJyEboeRtTFTbJxnZNz1+LcXn+SeApFGgQbYnxSUd4MD
 RKde2ttNbmwUyGTdQdXR3QtTH2cNULE8ZTqAaFTHlmFDEkvs2pRf9x14sCX9AviGL51bqdEohbJ
 nQU/Hhx6uypiEF2DRyX/EnqXzkXsp2lBpJEYL+GOCfNP3aVwiUFRUqL57nqgf/weUBcB7IUj+tE
 7FdhVKFnmN2UEsJhQrBfNy0FvB71cHeXa+L9X+ons+3bp/jD0H9q2+hy9OIM2C7J3nB0e2l1JJc
 J170JwmlJNiZBGJpvAWgm8O/6zVJplhLCVYngAGBo95KqSbrvPu5wQ+lYhsgNiQkJr/IZpgnuV9
 TnqlBSan5C6ITe+zSLiD8FI+B2Rswcxq1oYwW7cSUkTA/CaA==
X-Google-Smtp-Source: AGHT+IHLKeAyCUZ8NBnh10nkmhn9X2UWmYQZyZk1k2lI1Wod142J5tzz9PMYLXTZNInaffP16H73Cw==
X-Received: by 2002:a05:6a21:32a0:b0:34f:4309:ed32 with SMTP id
 adf61e73a8af0-36617e6f4e5mr4032494637.23.1765078427849; 
 Sat, 06 Dec 2025 19:33:47 -0800 (PST)
Received: from nyaos.localdomain ([166.0.199.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bf6a1caeea7sm8496390a12.24.2025.12.06.19.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Dec 2025 19:33:47 -0800 (PST)
From: ChenMiao <chenmiao.ku@gmail.com>
To: zhao1.liu@intel.com, pbonzini@redhat.com, manos.pitsidianakis@linaro.org,
 richard.henderson@linaro.org, philmd@linaro.org
Cc: chao.liu@openatom.club , dzm91@openatom.club , qemu-rust@nongnu.org,
 qemu-devel@nongnu.org, hust-os-kernel-patches@googlegroups.com,
 chenmiao <chenmiao@openatom.club>
Subject: [PATCH v3 1/4] rust/hw/core: Add the BusState of rust version
Date: Sun,  7 Dec 2025 03:33:28 +0000
Message-ID: <4e3b8548a26867260f137c719d3c26a24d7954bd.1765077679.git.chenmiao@openatom.club>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765077679.git.chenmiao@openatom.club>
References: <cover.1765077679.git.chenmiao@openatom.club>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=chenmiao.ku@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 06 Dec 2025 23:34:17 -0500
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


