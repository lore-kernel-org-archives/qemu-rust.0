Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42466CEBF96
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 08:49:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKuuC-00047Y-Er; Mon, 17 Nov 2025 03:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKuu7-000423-0f
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 03:48:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKuu4-00070o-09
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 03:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763369282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cn7Y8H+ZHnVPbLSpcflMd4rMa6WaX6x5Zv7H11YwVEk=;
 b=EGDVK29rq733i9Nw5PiXTa+YSZ2xcUX6ucJLceaNCcIYEuSmubFUSoPTHTHsoHw50GPgaO
 cDj9YFOt38HqBxsr4W1FgUk9LZIHXQjYUSLcQBRzQzkaPEajjq6WtTCbZqZhh6DOh7ZnIe
 n+3Y2rVPCdKdsNTiI0leFRylzpAP8wE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-XwHZcha4Pl6gAcLSkHmK2Q-1; Mon, 17 Nov 2025 03:48:00 -0500
X-MC-Unique: XwHZcha4Pl6gAcLSkHmK2Q-1
X-Mimecast-MFC-AGG-ID: XwHZcha4Pl6gAcLSkHmK2Q_1763369279
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477771366cbso24886175e9.0
 for <qemu-rust@nongnu.org>; Mon, 17 Nov 2025 00:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763369279; x=1763974079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Cn7Y8H+ZHnVPbLSpcflMd4rMa6WaX6x5Zv7H11YwVEk=;
 b=UNffXT18qYheJvbSEHQpQGd8AuvlI9ymQLUH4P+Mtv6SqgryLusF6pdemQgovmpAvO
 jzN4j++Aa1FmKooRxXxjz+A4YFGbr+WNYMnF0XhxZafNG6firYvUUYCsI4ZecUdT2MWU
 liCgQSzi8YQxpPUaWd9YfxehqSPMn0BH1I7+bt//Kl/R0W1hmMjraIruQen+pcogdO4f
 JfUS7kgotcGzZlGEes0E187R8MOqFkv9/5BatiavrainssszNuasA2lcmVuiFH+gYQwY
 o9er6PU+wYhqS5TLectkq1fMTcZPHyk0KyMeF9lMvMmgxIIczeOSoMzJhcepBlZ2HOvQ
 Tnlw==
X-Gm-Message-State: AOJu0Yzx8YXw6UAPvpYDvjOfD/PLoeNEimHHijzMKfCKlEcMkuv4MUHy
 FXHCCBjKYupGO2VNNNaTPye8L5e4RZk1MSe9KEl4K7RGJNmsRx8iVA57tw2UFJpVrGQmfj0zxTP
 GQO6Cn7DztdYh/Nj+uIPGZL60fa8Ehv7QRu6Ep8SoVCVM67UVG5GyWd4=
X-Gm-Gg: ASbGncsGKFzr4JNweKVcEdGXjPIDSLhPDklYm+MDImdHLizXyDQxDShAWUjzPWosyUU
 vJw/86ax/EUKXwq/E4P0r/X1alom8T/K4+wtpuuR4Ttb9L+j85O7KHH36L7k4yAAcFuh/O1ll0T
 3hI7YQXb9bjWTiTxcHsJJvtdj3BpvPLt+yVniVQOfGQrAV5kwvCHC9FLAIsmVzdhOU/nPCdYZlK
 qrjkrVr6azU6YGbXg/pVdLj8PNSxg1xW8rDwG+GjvBYNu6bBaOtkeiUCwNIM5OBfFvf82fz9qQ6
 4/2DIfDFDn15dEfvOTuPw44pHcq8x75/aW2gYCJU+L1kw8l4hzbWBekss2+22aGmCnOG2RGoZWe
 DzKhzvsyg3c4hVBRxMkQOH29PW6Gln2iH30FWTpbybhhz4Kt1nOUyU6mBJzhZOHHFaGzIPZfOlu
 S3Kxy9
X-Received: by 2002:a05:600c:1382:b0:477:3e0b:c0e3 with SMTP id
 5b1f17b1804b1-4778fea1743mr106795245e9.32.1763369278578; 
 Mon, 17 Nov 2025 00:47:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFprj2baOOhEB6xEp2DyXI+sJu+pBju1TU/tDTs3euXo6dskJazIaHO3PDmEB0fYo56Q36GAg==
X-Received: by 2002:a05:600c:1382:b0:477:3e0b:c0e3 with SMTP id
 5b1f17b1804b1-4778fea1743mr106794855e9.32.1763369277945; 
 Mon, 17 Nov 2025 00:47:57 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779973ddcfsm119750635e9.15.2025.11.17.00.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 00:47:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 1/5] rust/hpet: move hidden registers to HPETTimerRegisters
Date: Mon, 17 Nov 2025 09:47:48 +0100
Message-ID: <20251117084752.203219-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117084752.203219-1-pbonzini@redhat.com>
References: <20251117084752.203219-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XUiBK0s8G3ecN0wm32FI1sY9R-aD-pB-PhwYffH0bPs_1763369279
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Do not separate visible and hidden state; both of them are used in the
same circumstances and it's easiest to place both of them under the
same BqlRefCell.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/device.rs | 157 ++++++++++++++-----------------
 1 file changed, 71 insertions(+), 86 deletions(-)

diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index a1deef5a467..79d818b43da 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -171,9 +171,9 @@ const fn deactivating_bit(old: u64, new: u64, shift: usize) -> bool {
 }
 
 fn timer_handler(timer_cell: &BqlRefCell<HPETTimer>) {
-    let mut t = timer_cell.borrow_mut();
+    let t = timer_cell.borrow();
     // SFAETY: state field is valid after timer initialization.
-    let regs = &mut unsafe { t.state.as_mut() }.regs.borrow_mut();
+    let regs = &mut unsafe { t.state.as_ref() }.regs.borrow_mut();
     t.callback(regs)
 }
 
@@ -187,9 +187,35 @@ pub struct HPETTimerRegisters {
     cmp: u64,
     /// Timer N FSB Interrupt Route Register
     fsb: u64,
+
+    // Hidden register state
+    /// comparator (extended to counter width)
+    cmp64: u64,
+    /// Last value written to comparator
+    period: u64,
+    /// timer pop will indicate wrap for one-shot 32-bit
+    /// mode. Next pop will be actual timer expiration.
+    wrap_flag: u8,
+    /// last value armed, to avoid timer storms
+    last: u64,
 }
 
 impl HPETTimerRegisters {
+    /// calculate next value of the general counter that matches the
+    /// target (either entirely, or the low 32-bit only depending on
+    /// the timer mode).
+    fn update_cmp64(&mut self, cur_tick: u64) {
+        self.cmp64 = if self.is_32bit_mod() {
+            let mut result: u64 = cur_tick.deposit(0, 32, self.cmp);
+            if result < cur_tick {
+                result += 0x100000000;
+            }
+            result
+        } else {
+            self.cmp
+        }
+    }
+
     const fn is_fsb_route_enabled(&self) -> bool {
         self.config & (1 << HPET_TN_CFG_FSB_ENABLE_SHIFT) != 0
     }
@@ -234,17 +260,6 @@ pub struct HPETTimer {
     qemu_timer: Timer,
     /// timer block abstraction containing this timer
     state: NonNull<HPETState>,
-
-    // Hidden register state
-    /// comparator (extended to counter width)
-    cmp64: u64,
-    /// Last value written to comparator
-    period: u64,
-    /// timer pop will indicate wrap for one-shot 32-bit
-    /// mode. Next pop will be actual timer expiration.
-    wrap_flag: u8,
-    /// last value armed, to avoid timer storms
-    last: u64,
 }
 
 // SAFETY: Sync is not automatically derived due to the `state` field,
@@ -259,10 +274,6 @@ fn new(index: u8, state: *const HPETState) -> HPETTimer {
             // is initialized below.
             qemu_timer: unsafe { Timer::new() },
             state: NonNull::new(state.cast_mut()).unwrap(),
-            cmp64: 0,
-            period: 0,
-            wrap_flag: 0,
-            last: 0,
         }
     }
 
@@ -290,28 +301,6 @@ fn is_int_active(&self, regs: &HPETRegisters) -> bool {
         regs.is_timer_int_active(self.index.into())
     }
 
-    /// calculate next value of the general counter that matches the
-    /// target (either entirely, or the low 32-bit only depending on
-    /// the timer mode).
-    fn calculate_cmp64(&self, regs: &HPETRegisters, cur_tick: u64, target: u64) -> u64 {
-        // &HPETRegisters should be gotten from BqlRefCell<HPETRegisters>,
-        // but there's no lock guard to guarantee this. So we have to check BQL
-        // context explicitly. This check should be removed when we switch to
-        // Mutex<HPETRegisters>.
-        assert!(bql::is_locked());
-
-        let tn_regs = &regs.tn_regs[self.index as usize];
-        if tn_regs.is_32bit_mod() {
-            let mut result: u64 = cur_tick.deposit(0, 32, target);
-            if result < cur_tick {
-                result += 0x100000000;
-            }
-            result
-        } else {
-            target
-        }
-    }
-
     fn get_int_route(&self, regs: &HPETRegisters) -> usize {
         // &HPETRegisters should be gotten from BqlRefCell<HPETRegisters>,
         // but there's no lock guard to guarantee this. So we have to check BQL
@@ -394,47 +383,46 @@ fn update_irq(&self, regs: &mut HPETRegisters, set: bool) {
         self.set_irq(regs, set);
     }
 
-    fn arm_timer(&mut self, regs: &HPETRegisters, tick: u64) {
+    fn arm_timer(&self, tn_regs: &mut HPETTimerRegisters, tick: u64) {
         // &HPETRegisters should be gotten from BqlRefCell<HPETRegisters>,
         // but there's no lock guard to guarantee this. So we have to check BQL
         // context explicitly. This check should be removed when we switch to
         // Mutex<HPETRegisters>.
         assert!(bql::is_locked());
 
-        let tn_regs = &regs.tn_regs[self.index as usize];
         let mut ns = self.get_state().get_ns(tick);
 
         // Clamp period to reasonable min value (1 us)
-        if tn_regs.is_periodic() && ns - self.last < 1000 {
-            ns = self.last + 1000;
+        if tn_regs.is_periodic() && ns - tn_regs.last < 1000 {
+            ns = tn_regs.last + 1000;
         }
 
-        self.last = ns;
-        self.qemu_timer.modify(self.last);
+        tn_regs.last = ns;
+        self.qemu_timer.modify(tn_regs.last);
     }
 
-    fn set_timer(&mut self, regs: &HPETRegisters) {
+    fn set_timer(&self, regs: &mut HPETRegisters) {
         // &HPETRegisters should be gotten from BqlRefCell<HPETRegisters>,
         // but there's no lock guard to guarantee this. So we have to check BQL
         // context explicitly. This check should be removed when we switch to
         // Mutex<HPETRegisters>.
         assert!(bql::is_locked());
 
-        let tn_regs = &regs.tn_regs[self.index as usize];
+        let tn_regs = &mut regs.tn_regs[self.index as usize];
         let cur_tick: u64 = self.get_state().get_ticks();
 
-        self.wrap_flag = 0;
-        self.cmp64 = self.calculate_cmp64(regs, cur_tick, tn_regs.cmp);
+        tn_regs.wrap_flag = 0;
+        tn_regs.update_cmp64(cur_tick);
         if tn_regs.is_32bit_mod() {
             // HPET spec says in one-shot 32-bit mode, generate an interrupt when
             // counter wraps in addition to an interrupt with comparator match.
-            if !tn_regs.is_periodic() && self.cmp64 > hpet_next_wrap(cur_tick) {
-                self.wrap_flag = 1;
-                self.arm_timer(regs, hpet_next_wrap(cur_tick));
+            if !tn_regs.is_periodic() && tn_regs.cmp64 > hpet_next_wrap(cur_tick) {
+                tn_regs.wrap_flag = 1;
+                self.arm_timer(tn_regs, hpet_next_wrap(cur_tick));
                 return;
             }
         }
-        self.arm_timer(regs, self.cmp64);
+        self.arm_timer(tn_regs, tn_regs.cmp64);
     }
 
     fn del_timer(&self, regs: &mut HPETRegisters) {
@@ -485,7 +473,7 @@ fn prepare_tn_cfg_reg_new(
     }
 
     /// Configuration and Capability Register
-    fn set_tn_cfg_reg(&mut self, regs: &mut HPETRegisters, shift: u32, len: u32, val: u64) {
+    fn set_tn_cfg_reg(&self, regs: &mut HPETRegisters, shift: u32, len: u32, val: u64) {
         // &mut HPETRegisters should be gotten from BqlRefCell<HPETRegisters>,
         // but there's no lock guard to guarantee this. So we have to check BQL
         // context explicitly. This check should be removed when we switch to
@@ -508,7 +496,7 @@ fn set_tn_cfg_reg(&mut self, regs: &mut HPETRegisters, shift: u32, len: u32, val
         let tn_regs = &mut regs.tn_regs[self.index as usize];
         if tn_regs.is_32bit_mod() {
             tn_regs.cmp = u64::from(tn_regs.cmp as u32); // truncate!
-            self.period = u64::from(self.period as u32); // truncate!
+            tn_regs.period = u64::from(tn_regs.period as u32); // truncate!
         }
 
         if regs.is_hpet_enabled() {
@@ -517,7 +505,7 @@ fn set_tn_cfg_reg(&mut self, regs: &mut HPETRegisters, shift: u32, len: u32, val
     }
 
     /// Comparator Value Register
-    fn set_tn_cmp_reg(&mut self, regs: &mut HPETRegisters, shift: u32, len: u32, val: u64) {
+    fn set_tn_cmp_reg(&self, regs: &mut HPETRegisters, shift: u32, len: u32, val: u64) {
         // &mut HPETRegisters should be gotten from BqlRefCell<HPETRegisters>,
         // but there's no lock guard to guarantee this. So we have to check BQL
         // context explicitly. This check should be removed when we switch to
@@ -545,7 +533,7 @@ fn set_tn_cmp_reg(&mut self, regs: &mut HPETRegisters, shift: u32, len: u32, val
         }
 
         if tn_regs.is_periodic() {
-            self.period = self.period.deposit(shift, length, value);
+            tn_regs.period = tn_regs.period.deposit(shift, length, value);
         }
 
         tn_regs.clear_valset();
@@ -566,7 +554,7 @@ fn set_tn_fsb_route_reg(&self, regs: &mut HPETRegisters, shift: u32, len: u32, v
         tn_regs.fsb = tn_regs.fsb.deposit(shift, len, val);
     }
 
-    fn reset(&mut self, regs: &mut HPETRegisters) {
+    fn reset(&self, regs: &mut HPETRegisters) {
         // &mut HPETRegisters should be gotten from BqlRefCell<HPETRegisters>,
         // but there's no lock guard to guarantee this. So we have to check BQL
         // context explicitly. This check should be removed when we switch to
@@ -584,12 +572,12 @@ fn reset(&mut self, regs: &mut HPETRegisters) {
         // advertise availability of ioapic int
         tn_regs.config |=
             (u64::from(self.get_state().int_route_cap)) << HPET_TN_CFG_INT_ROUTE_CAP_SHIFT;
-        self.period = 0;
-        self.wrap_flag = 0;
+        tn_regs.period = 0;
+        tn_regs.wrap_flag = 0;
     }
 
     /// timer expiration callback
-    fn callback(&mut self, regs: &mut HPETRegisters) {
+    fn callback(&self, regs: &mut HPETRegisters) {
         // &mut HPETRegisters should be gotten from BqlRefCell<HPETRegisters>,
         // but there's no lock guard to guarantee this. So we have to check BQL
         // context explicitly. This check should be removed when we switch to
@@ -597,22 +585,21 @@ fn callback(&mut self, regs: &mut HPETRegisters) {
         assert!(bql::is_locked());
 
         let tn_regs = &mut regs.tn_regs[self.index as usize];
-        let period: u64 = self.period;
         let cur_tick: u64 = self.get_state().get_ticks();
 
-        if tn_regs.is_periodic() && period != 0 {
-            while hpet_time_after(cur_tick, self.cmp64) {
-                self.cmp64 += period;
+        if tn_regs.is_periodic() && tn_regs.period != 0 {
+            while hpet_time_after(cur_tick, tn_regs.cmp64) {
+                tn_regs.cmp64 += tn_regs.period;
             }
             if tn_regs.is_32bit_mod() {
-                tn_regs.cmp = u64::from(self.cmp64 as u32); // truncate!
+                tn_regs.cmp = u64::from(tn_regs.cmp64 as u32); // truncate!
             } else {
-                tn_regs.cmp = self.cmp64;
+                tn_regs.cmp = tn_regs.cmp64;
             }
-            self.arm_timer(regs, self.cmp64);
-        } else if self.wrap_flag != 0 {
-            self.wrap_flag = 0;
-            self.arm_timer(regs, self.cmp64);
+            self.arm_timer(tn_regs, tn_regs.cmp64);
+        } else if tn_regs.wrap_flag != 0 {
+            tn_regs.wrap_flag = 0;
+            self.arm_timer(tn_regs, tn_regs.cmp64);
         }
         self.update_irq(regs, true);
     }
@@ -635,7 +622,7 @@ fn read(&self, target: TimerRegister, regs: &HPETRegisters) -> u64 {
     }
 
     fn write(
-        &mut self,
+        &self,
         target: TimerRegister,
         regs: &mut HPETRegisters,
         value: u64,
@@ -796,7 +783,7 @@ fn set_cfg_reg(&self, regs: &mut HPETRegisters, shift: u32, len: u32, val: u64)
                 .set(ticks_to_ns(regs.counter) - CLOCK_VIRTUAL.get_ns());
 
             for timer in self.timers.iter().take(self.num_timers) {
-                let mut t = timer.borrow_mut();
+                let t = timer.borrow();
                 let id = t.index as usize;
                 let tn_regs = &regs.tn_regs[id];
 
@@ -937,7 +924,7 @@ fn reset_hold(&self, _type: ResetType) {
             let mut regs = self.regs.borrow_mut();
 
             for timer in self.timers.iter().take(self.num_timers) {
-                timer.borrow_mut().reset(&mut regs);
+                timer.borrow().reset(&mut regs);
             }
 
             regs.counter = 0;
@@ -989,7 +976,7 @@ fn read(&self, addr: hwaddr, size: u32) -> u64 {
         use DecodedRegister::*;
         use GlobalRegister::*;
         (match target {
-            Timer(timer, tn_target) => timer.borrow_mut().read(tn_target, regs),
+            Timer(timer, tn_target) => timer.borrow().read(tn_target, regs),
             Global(CAP) => regs.capability, /* including HPET_PERIOD 0x004 */
             Global(CFG) => regs.config,
             Global(INT_STATUS) => regs.int_status,
@@ -1020,7 +1007,7 @@ fn write(&self, addr: hwaddr, value: u64, size: u32) {
         use DecodedRegister::*;
         use GlobalRegister::*;
         match target {
-            Timer(timer, tn_target) => timer.borrow_mut().write(tn_target, regs, value, shift, len),
+            Timer(timer, tn_target) => timer.borrow().write(tn_target, regs, value, shift, len),
             Global(CAP) => {} // General Capabilities and ID Register: Read Only
             Global(CFG) => self.set_cfg_reg(regs, shift, len, value),
             Global(INT_STATUS) => self.set_int_status_reg(regs, shift, len, value),
@@ -1045,15 +1032,14 @@ fn pre_save(&self) -> Result<(), migration::Infallible> {
     }
 
     fn post_load(&self, _version_id: u8) -> Result<(), migration::Infallible> {
-        let regs = self.regs.borrow();
+        let mut regs = self.regs.borrow_mut();
+        let cnt = regs.counter;
 
-        for timer in self.timers.iter().take(self.num_timers) {
-            let mut t = timer.borrow_mut();
-            let cnt = regs.counter;
-            let cmp = regs.tn_regs[t.index as usize].cmp;
+        for index in 0..self.num_timers {
+            let tn_regs = &mut regs.tn_regs[index];
 
-            t.cmp64 = t.calculate_cmp64(&regs, cnt, cmp);
-            t.last = CLOCK_VIRTUAL.get_ns() - NANOSECONDS_PER_SECOND;
+            tn_regs.update_cmp64(cnt);
+            tn_regs.last = CLOCK_VIRTUAL.get_ns() - NANOSECONDS_PER_SECOND;
         }
 
         // Recalculate the offset between the main counter and guest time
@@ -1126,6 +1112,8 @@ impl ObjectImpl for HPETState {
             vmstate_of!(HPETTimerRegisters, config),
             vmstate_of!(HPETTimerRegisters, cmp),
             vmstate_of!(HPETTimerRegisters, fsb),
+            vmstate_of!(HPETTimerRegisters, period),
+            vmstate_of!(HPETTimerRegisters, wrap_flag),
         })
         .build()
 );
@@ -1136,9 +1124,6 @@ impl ObjectImpl for HPETState {
         .version_id(2)
         .minimum_version_id(2)
         .fields(vmstate_fields! {
-            vmstate_of!(HPETTimer, index),
-            vmstate_of!(HPETTimer, period),
-            vmstate_of!(HPETTimer, wrap_flag),
             vmstate_of!(HPETTimer, qemu_timer),
         })
         .build();
-- 
2.51.1


