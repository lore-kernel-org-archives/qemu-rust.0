Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tlWRu-000804-5R
	for mharc-qemu-rust@gnu.org; Fri, 21 Feb 2025 12:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRr-0007mG-1U
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRn-0001VR-Tw
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740157459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrxstZfwC92BCL08iYO3tMXByMssL0Rad+3hL3bRI4k=;
 b=eWD1408HCylTW165APXhwrZAPwtx2OgigAZuANaZWpRM9TXW7Q7blcSN2xsIabWtMFGFVd
 M1uJiIkxJ3PWDjw9y+V8UPfGT0o3smY8tXUHYCZlIhDn8uNS1hCJxwBK41B4cJgkYdMcLb
 hj4tnnThMCUrOesi+2o5kWdihoiv6oM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-MNUGWPPVNaK5pm1IcS7HxA-1; Fri, 21 Feb 2025 12:04:17 -0500
X-MC-Unique: MNUGWPPVNaK5pm1IcS7HxA-1
X-Mimecast-MFC-AGG-ID: MNUGWPPVNaK5pm1IcS7HxA_1740157457
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5e095e02b69so2820748a12.0
 for <qemu-rust@nongnu.org>; Fri, 21 Feb 2025 09:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740157456; x=1740762256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wrxstZfwC92BCL08iYO3tMXByMssL0Rad+3hL3bRI4k=;
 b=s+jMetChPRzkN7C0M9tfMVc61Ols9QtK/slk3rmJ+Ge5ffiJ7VbdW8ZYkfTXjMCGwr
 fX4ef3NBQerQPgxCUNPrxtkk9Nvlkg8i+b7vEfd+6FG0PdztxLBAhJAy+7CIXuGj9F2B
 9Z5jbo3hykQtoUnLoXnVu0OBNnKX8UcoaBwOiDMxu68jJ8bCxMPM2HeIUqUObscUjTF5
 UlSuRwo56OEB6F3GOi1KtD+FzWP+cNwGJs5d3cZFamr/Asc7t9TUaTF/ZCRcnQfpNYKP
 H4a/EVMXP0fjdET4R2Nr3s7TNit3ZiGG6cnV1OsZEiEubrtkpvOXKK4or3BJ0XUE40r8
 k32Q==
X-Gm-Message-State: AOJu0Yx9zdJMi0y2e5uhInlicK/fyGP+pTQcHmnBdTzdvZUL4m9myDg7
 czLaE22T2gD/7JN77zf5RPofBuvbqF1DwN/X6ggfTvNPk6ny3rvNUbypyPAgysm67lnsz3r+dR4
 Rh388GriCQp6nvtaYThWyTTSYdFFB0OSSnM4C5y/ctgq+ToiTZ4E=
X-Gm-Gg: ASbGncvUP5r5EVJUdml3o7wX26ffIvn9YLWV1XBaO/Dz/j37h3sqAa6dXhgPc4NiA3K
 2ciqmeacy6vh9U97ttg+mrfGgbIdtC9NDOdJWlyjsVFc3K2Wjw2kD/p8MJ34kQqcqq4GJXmnXmN
 QbLeFWjlU74Koori9Xnp+cvsYVHC2u+8pcxqCz+RQJY9kJ/0yHz/rxIV2s5ndUyV9y0HDI0xFxn
 HR15Q/IISt52AUiyxrGHyV6YR8dPZGuvnkKNfTBEJTDzYT/iZxJ4XOfJ5GtFHBJerjzKzDEyaoF
 PUFwPMK501cN2mtZLUQ=
X-Received: by 2002:a05:6402:1ecf:b0:5e0:8a3f:ef65 with SMTP id
 4fb4d7f45d1cf-5e0b62f9bbdmr4044707a12.7.1740157456129; 
 Fri, 21 Feb 2025 09:04:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExONKfMjCtfDcseZA+TksGC0DWhptB5rhNYjv195XCgFnxhHIkfqbSWPIwA2s61byRocY23g==
X-Received: by 2002:a05:6402:1ecf:b0:5e0:8a3f:ef65 with SMTP id
 4fb4d7f45d1cf-5e0b62f9bbdmr4044457a12.7.1740157454033; 
 Fri, 21 Feb 2025 09:04:14 -0800 (PST)
Received: from [192.168.10.48] ([151.95.61.185])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e09072247esm4486329a12.51.2025.02.21.09.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 09:04:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 12/15] rust: sysbus: wrap SysBusDevice with Opaque<>
Date: Fri, 21 Feb 2025 18:03:39 +0100
Message-ID: <20250221170342.63591-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221170342.63591-1-pbonzini@redhat.com>
References: <20250221170342.63591-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DU0JIfaYql7c974hPvM-yARLAGdEg8N1NbJplqbfsqw_1740157457
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.424,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 21 Feb 2025 17:04:23 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/hpet.rs |  2 +-
 rust/qemu-api/src/bindings.rs  |  3 ---
 rust/qemu-api/src/sysbus.rs    | 25 ++++++++++++++++++-------
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
index be27eb0eff4..19e63465cff 100644
--- a/rust/hw/timer/hpet/src/hpet.rs
+++ b/rust/hw/timer/hpet/src/hpet.rs
@@ -741,7 +741,7 @@ fn reset_hold(&self, _type: ResetType) {
         HPETFwConfig::update_hpet_cfg(
             self.hpet_id.get(),
             self.capability.get() as u32,
-            sbd.mmio[0].addr,
+            unsafe { *sbd.as_ptr() }.mmio[0].addr,
         );
 
         // to document that the RTC lowers its output on reset as well
diff --git a/rust/qemu-api/src/bindings.rs b/rust/qemu-api/src/bindings.rs
index 6e70a75a0e6..b791ca6d87f 100644
--- a/rust/qemu-api/src/bindings.rs
+++ b/rust/qemu-api/src/bindings.rs
@@ -40,9 +40,6 @@ unsafe impl Sync for MemoryRegion {}
 unsafe impl Send for ObjectClass {}
 unsafe impl Sync for ObjectClass {}
 
-unsafe impl Send for SysBusDevice {}
-unsafe impl Sync for SysBusDevice {}
-
 // SAFETY: this is a pure data struct
 unsafe impl Send for CoalescedMemoryRange {}
 unsafe impl Sync for CoalescedMemoryRange {}
diff --git a/rust/qemu-api/src/sysbus.rs b/rust/qemu-api/src/sysbus.rs
index 48803a655f9..78909fb9931 100644
--- a/rust/qemu-api/src/sysbus.rs
+++ b/rust/qemu-api/src/sysbus.rs
@@ -6,11 +6,11 @@
 
 use std::{ffi::CStr, ptr::addr_of_mut};
 
-pub use bindings::{SysBusDevice, SysBusDeviceClass};
+pub use bindings::SysBusDeviceClass;
 
 use crate::{
     bindings,
-    cell::bql_locked,
+    cell::{bql_locked, Opaque},
     irq::{IRQState, InterruptSource},
     memory::MemoryRegion,
     prelude::*,
@@ -18,6 +18,14 @@
     qom::Owned,
 };
 
+/// A safe wrapper around [`bindings::SysBusDevice`].
+#[repr(transparent)]
+#[derive(Debug, qemu_api_macros::Wrapper)]
+pub struct SysBusDevice(Opaque<bindings::SysBusDevice>);
+
+unsafe impl Send for SysBusDevice {}
+unsafe impl Sync for SysBusDevice {}
+
 unsafe impl ObjectType for SysBusDevice {
     type Class = SysBusDeviceClass;
     const TYPE_NAME: &'static CStr =
@@ -49,7 +57,7 @@ pub trait SysBusDeviceMethods: ObjectDeref
     fn init_mmio(&self, iomem: &MemoryRegion) {
         assert!(bql_locked());
         unsafe {
-            bindings::sysbus_init_mmio(self.as_mut_ptr(), iomem.as_mut_ptr());
+            bindings::sysbus_init_mmio(self.upcast().as_mut_ptr(), iomem.as_mut_ptr());
         }
     }
 
@@ -60,7 +68,7 @@ fn init_mmio(&self, iomem: &MemoryRegion) {
     fn init_irq(&self, irq: &InterruptSource) {
         assert!(bql_locked());
         unsafe {
-            bindings::sysbus_init_irq(self.as_mut_ptr(), irq.as_ptr());
+            bindings::sysbus_init_irq(self.upcast().as_mut_ptr(), irq.as_ptr());
         }
     }
 
@@ -69,7 +77,7 @@ fn mmio_map(&self, id: u32, addr: u64) {
         assert!(bql_locked());
         let id: i32 = id.try_into().unwrap();
         unsafe {
-            bindings::sysbus_mmio_map(self.as_mut_ptr(), id, addr);
+            bindings::sysbus_mmio_map(self.upcast().as_mut_ptr(), id, addr);
         }
     }
 
@@ -81,7 +89,7 @@ fn connect_irq(&self, id: u32, irq: &Owned<IRQState>) {
         let id: i32 = id.try_into().unwrap();
         let irq: &IRQState = irq;
         unsafe {
-            bindings::sysbus_connect_irq(self.as_mut_ptr(), id, irq.as_mut_ptr());
+            bindings::sysbus_connect_irq(self.upcast().as_mut_ptr(), id, irq.as_mut_ptr());
         }
     }
 
@@ -89,7 +97,10 @@ fn sysbus_realize(&self) {
         // TODO: return an Error
         assert!(bql_locked());
         unsafe {
-            bindings::sysbus_realize(self.as_mut_ptr(), addr_of_mut!(bindings::error_fatal));
+            bindings::sysbus_realize(
+                self.upcast().as_mut_ptr(),
+                addr_of_mut!(bindings::error_fatal),
+            );
         }
     }
 }
-- 
2.48.1


