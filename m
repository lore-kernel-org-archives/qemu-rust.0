Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D950DCEACEF
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 08:48:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKuuG-0004Gf-W2; Mon, 17 Nov 2025 03:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKuuD-00049d-FN
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 03:48:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKuuB-00072C-I0
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 03:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763369291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XAhaWrOrXw2Sb3mRyhoDdnRIUBL1rpuESpFW8PbKSLU=;
 b=gvwt7hk3cHX1JNvhjdrmKclapb2mvD9ks2Wed27At16i6z0Ko/jWtPQ9edrEkPkbAG8rYi
 h6Gfi6Hunggk1gbHAKdHUer5TANiB1YhIN/pd6ik2NaSwYpbev2KSsknMvRMo3Nki9GqB9
 6IRnGmy5V9TA12SG//UEAn1U6VmB1D8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-YAAzhp0GMCuc0aJjt7MrYQ-1; Mon, 17 Nov 2025 03:48:09 -0500
X-MC-Unique: YAAzhp0GMCuc0aJjt7MrYQ-1
X-Mimecast-MFC-AGG-ID: YAAzhp0GMCuc0aJjt7MrYQ_1763369288
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477632ef599so23832225e9.1
 for <qemu-rust@nongnu.org>; Mon, 17 Nov 2025 00:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763369288; x=1763974088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XAhaWrOrXw2Sb3mRyhoDdnRIUBL1rpuESpFW8PbKSLU=;
 b=IU5y8r+tT8T5z7attlEAY1iMWVKB5WAzzD1Gw9Hej/Tjyn9X/Drzi1B/dQR/5fjcDr
 htdFEny2QxevGxL1Mn+4fKxMatQziDrQfrBl8WE9tbYLB9/mKzo5U3t7AE9ndNB5cxtq
 rXPW6MsqihtNx2wVsXdSh5jCCZ7mMbrCoVxq8LCpBaKDv5z1whWTz5aQku1b86f33+a2
 MMHz6E1osmrTr/qLEoTNCHi7O2x9vl2fd3z9LV1RKCSB3q49Xba8rPamEXVQSdatXF31
 Zy4If1mGl7alz5ciHmsYqxbZEgIYtHFLJ786saqRyaMl+XmU/Fle49smRhXvaVfa+4VP
 b/Lg==
X-Gm-Message-State: AOJu0Yz7anbjdknMBl6bNH465aItq+vmcd1ulow2aVaffVUcXH6v7bik
 tk0gLKFk9O0HjDg5rB/gR+i2/Gz1qiDfaK09JRuMrN/nqKnziIXL3irT8B5R/8eho1UUUK/y5av
 D4ihQb0bnUMbxsvj1o0mPYA6thjR1rr6HauEUu3M6BgfxI86sayqaS18=
X-Gm-Gg: ASbGncsUwjqYLdcPCQYPeXR4zMaMya0K+71YCCTaQebeeqaQMmw0oSu2ZVZUdreZn9Q
 J2BEXeMle/FuG1bFMbUEXT8o82bxAHXgK636tU33YDul6hF6Q7KFtIggbbgVHkSPLzctiOh8Kbv
 xOFh/xG53bwv5TzdE8kPBxosP2e+o7LgXJCgBXQxMGiiO/rWcjYOP+mnjtMKRLN2kH4XWOArUjn
 denYtZc1e1FdBQJu/ODywwtTOzc+Ct+cww3OO4/G4Xs3sGpD9IvtBWdCUszM9hb6Yj3sk5SN5jP
 h+sC0CGg6ClqRc3YVtvfWCW3ZbRb0Bs8y0BkR7hPb3B75LY+2Hx5mxCoBAnPzq2etNV5cMtKRiw
 vS54KDCwHeErkGahxCknr+eviZm8XuXbDG5f5vUOtrgj4nE5l+kZMMx5uqN3JI2a7FxbjcTiCUF
 HVf2MD
X-Received: by 2002:a05:600c:4c14:b0:477:9d88:2da6 with SMTP id
 5b1f17b1804b1-4779d88318amr34495435e9.0.1763369288350; 
 Mon, 17 Nov 2025 00:48:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFw0W2ipaq0kWQ1T37VeNBSCQQ8dr59stNSv1yRpErDMjT7NZnpiKOcR/EjdLifFsnEcaCfmw==
X-Received: by 2002:a05:600c:4c14:b0:477:9d88:2da6 with SMTP id
 5b1f17b1804b1-4779d88318amr34495205e9.0.1763369287812; 
 Mon, 17 Nov 2025 00:48:07 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e8e6a1sm287075055e9.11.2025.11.17.00.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 00:48:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 5/5] rust/hpet: Apply Migratable<> wrapper and ToMigrationState
Date: Mon, 17 Nov 2025 09:47:52 +0100
Message-ID: <20251117084752.203219-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117084752.203219-1-pbonzini@redhat.com>
References: <20251117084752.203219-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U6_pReyEVvdiLt3Imyou-Dnkk0XcfPS43t8RB1xX4nI_1763369288
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Zhao Liu <zhao1.liu@intel.com>

Before using Mutex<> to protect HPETRegisters, it's necessary to apply
Migratable<> wrapper and ToMigrationState first since there's no
pre-defined VMState for Mutex<>.

In addition, this allows to move data from HPETTimerRegisters to
HPETTimer, so as to preserve the original migration format of the C
implementation.  To do that, HPETTimer is wrapped with Migratable<>
as well but the implementation of ToMigrationStateShared is
hand-written.

Note that even though the HPETRegistersMigration struct is
generated by ToMigrationState macro, its VMState still needs to be
implemented by hand.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Link: https://lore.kernel.org/r/20251113051937.4017675-21-zhao1.liu@intel.com
[Added HPETTimer implementation and restored compatible migration format. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/device.rs | 139 +++++++++++++++++++++++--------
 1 file changed, 102 insertions(+), 37 deletions(-)

diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 373ec37bbd3..fde4469ec16 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -13,7 +13,7 @@
 use bql::prelude::*;
 use common::prelude::*;
 use hwcore::prelude::*;
-use migration::{self, prelude::*};
+use migration::{self, prelude::*, ToMigrationStateShared};
 use qom::prelude::*;
 use system::{
     bindings::{address_space_memory, address_space_stl_le},
@@ -176,7 +176,6 @@ fn timer_handler(t: &HPETTimer) {
     t.callback(regs)
 }
 
-#[repr(C)]
 #[derive(Debug, Default)]
 pub struct HPETTimerRegisters {
     // Memory-mapped, software visible timer registers
@@ -650,11 +649,13 @@ fn write(
     }
 }
 
-#[repr(C)]
-#[derive(Default)]
+#[derive(Default, ToMigrationState)]
 pub struct HPETRegisters {
     // HPET block Registers: Memory-mapped, software visible registers
     /// General Capabilities and ID Register
+    ///
+    /// Constant and therefore not migrated.
+    #[migration_state(omit)]
     capability: u64,
     ///  General Configuration Register
     config: u64,
@@ -666,9 +667,15 @@ pub struct HPETRegisters {
     counter: u64,
 
     /// HPET Timer N Registers
+    ///
+    /// Migrated as part of `Migratable<HPETTimer>`
+    #[migration_state(omit)]
     tn_regs: [HPETTimerRegisters; HPET_MAX_TIMERS],
 
     /// Offset of main counter relative to qemu clock.
+    ///
+    /// Migrated as a subsection and therefore snapshotted into [`HPETState`]
+    #[migration_state(omit)]
     pub hpet_offset: u64,
 }
 
@@ -702,7 +709,7 @@ fn is_timer_int_active(&self, index: usize) -> bool {
 pub struct HPETState {
     parent_obj: ParentField<SysBusDevice>,
     iomem: MemoryRegion,
-    regs: BqlRefCell<HPETRegisters>,
+    regs: Migratable<BqlRefCell<HPETRegisters>>,
 
     // Internal state
     /// Capabilities that QEMU HPET supports.
@@ -728,7 +735,7 @@ pub struct HPETState {
 
     /// HPET timer array managed by this timer block.
     #[doc(alias = "timer")]
-    timers: [HPETTimer; HPET_MAX_TIMERS],
+    timers: [Migratable<HPETTimer>; HPET_MAX_TIMERS],
     #[property(rename = "timers", default = HPET_MIN_TIMERS)]
     num_timers: usize,
     num_timers_save: BqlCell<u8>,
@@ -763,9 +770,12 @@ fn init_timers(this: &mut MaybeUninit<Self>) {
 
             // Initialize in two steps, to avoid calling Timer::init_full on a
             // temporary that can be moved.
-            let timer = timer.write(HPETTimer::new(index.try_into().unwrap(), state));
+            let timer = timer.write(Migratable::new(HPETTimer::new(
+                index.try_into().unwrap(),
+                state,
+            )));
             // SAFETY: HPETState is pinned
-            let timer = unsafe { Pin::new_unchecked(timer) };
+            let timer = unsafe { Pin::new_unchecked(&mut **timer) };
             HPETTimer::init_timer(timer);
         }
     }
@@ -1109,47 +1119,102 @@ impl ObjectImpl for HPETState {
         })
         .build();
 
-impl_vmstate_struct!(
-    HPETTimerRegisters,
-    VMStateDescriptionBuilder::<HPETTimerRegisters>::new()
-        .name(c"hpet_timer/regs")
+#[derive(Default)]
+pub struct HPETTimerMigration {
+    index: u8,
+    config: u64,
+    cmp: u64,
+    fsb: u64,
+    period: u64,
+    wrap_flag: u8,
+    qemu_timer: i64,
+}
+
+impl ToMigrationState for HPETTimer {
+    type Migrated = HPETTimerMigration;
+
+    fn snapshot_migration_state(
+        &self,
+        target: &mut Self::Migrated,
+    ) -> Result<(), migration::Infallible> {
+        let state = self.get_state();
+        let regs = state.regs.borrow_mut();
+        let tn_regs = &regs.tn_regs[self.index as usize];
+
+        target.index = self.index;
+        target.config = tn_regs.config;
+        target.cmp = tn_regs.cmp;
+        target.fsb = tn_regs.fsb;
+        target.period = tn_regs.period;
+        target.wrap_flag = tn_regs.wrap_flag;
+        self.qemu_timer
+            .snapshot_migration_state(&mut target.qemu_timer)?;
+
+        Ok(())
+    }
+
+    fn restore_migrated_state_mut(
+        &mut self,
+        source: Self::Migrated,
+        version_id: u8,
+    ) -> Result<(), migration::Infallible> {
+        self.restore_migrated_state(source, version_id)
+    }
+}
+
+impl ToMigrationStateShared for HPETTimer {
+    fn restore_migrated_state(
+        &self,
+        source: Self::Migrated,
+        version_id: u8,
+    ) -> Result<(), migration::Infallible> {
+        let state = self.get_state();
+        let mut regs = state.regs.borrow_mut();
+        let tn_regs = &mut regs.tn_regs[self.index as usize];
+
+        tn_regs.config = source.config;
+        tn_regs.cmp = source.cmp;
+        tn_regs.fsb = source.fsb;
+        tn_regs.period = source.period;
+        tn_regs.wrap_flag = source.wrap_flag;
+        self.qemu_timer
+            .restore_migrated_state(source.qemu_timer, version_id)?;
+
+        Ok(())
+    }
+}
+
+const VMSTATE_HPET_TIMER: VMStateDescription<HPETTimerMigration> =
+    VMStateDescriptionBuilder::<HPETTimerMigration>::new()
+        .name(c"hpet_timer")
         .version_id(1)
         .minimum_version_id(1)
         .fields(vmstate_fields! {
-            vmstate_of!(HPETTimerRegisters, config),
-            vmstate_of!(HPETTimerRegisters, cmp),
-            vmstate_of!(HPETTimerRegisters, fsb),
-            vmstate_of!(HPETTimerRegisters, period),
-            vmstate_of!(HPETTimerRegisters, wrap_flag),
-        })
-        .build()
-);
-
-const VMSTATE_HPET_TIMER: VMStateDescription<HPETTimer> =
-    VMStateDescriptionBuilder::<HPETTimer>::new()
-        .name(c"hpet_timer")
-        .version_id(2)
-        .minimum_version_id(2)
-        .fields(vmstate_fields! {
-            vmstate_of!(HPETTimer, qemu_timer),
+            vmstate_of!(HPETTimerMigration, index),
+            vmstate_of!(HPETTimerMigration, config),
+            vmstate_of!(HPETTimerMigration, cmp),
+            vmstate_of!(HPETTimerMigration, fsb),
+            vmstate_of!(HPETTimerMigration, period),
+            vmstate_of!(HPETTimerMigration, wrap_flag),
+            vmstate_of!(HPETTimerMigration, qemu_timer),
         })
         .build();
 
-impl_vmstate_struct!(HPETTimer, VMSTATE_HPET_TIMER);
+impl_vmstate_struct!(HPETTimerMigration, VMSTATE_HPET_TIMER);
 
 const VALIDATE_TIMERS_NAME: &CStr = c"num_timers must match";
 
+// HPETRegistersMigration is generated by ToMigrationState macro.
 impl_vmstate_struct!(
-    HPETRegisters,
-    VMStateDescriptionBuilder::<HPETRegisters>::new()
+    HPETRegistersMigration,
+    VMStateDescriptionBuilder::<HPETRegistersMigration>::new()
         .name(c"hpet/regs")
         .version_id(2)
         .minimum_version_id(2)
         .fields(vmstate_fields! {
-            vmstate_of!(HPETRegisters, config),
-            vmstate_of!(HPETRegisters, int_status),
-            vmstate_of!(HPETRegisters, counter),
-            vmstate_of!(HPETRegisters, tn_regs),
+            vmstate_of!(HPETRegistersMigration, config),
+            vmstate_of!(HPETRegistersMigration, int_status),
+            vmstate_of!(HPETRegistersMigration, counter),
         })
         .build()
 );
@@ -1157,8 +1222,8 @@ impl ObjectImpl for HPETState {
 const VMSTATE_HPET: VMStateDescription<HPETState> =
     VMStateDescriptionBuilder::<HPETState>::new()
         .name(c"hpet")
-        .version_id(3)
-        .minimum_version_id(3)
+        .version_id(2)
+        .minimum_version_id(2)
         .pre_save(&HPETState::pre_save)
         .post_load(&HPETState::post_load)
         .fields(vmstate_fields! {
-- 
2.51.1


