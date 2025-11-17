Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F109CEBF61
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 08:49:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKuuE-0004Aa-FY; Mon, 17 Nov 2025 03:48:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKuuB-00044Y-2n
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 03:48:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKuu8-00071X-FI
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 03:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763369287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXWL09IpvxzHJJZXvTmfbHjqEOYFpT3gc+RY/7fbQEk=;
 b=VTo1/rdqpKI4/9otDsZ7xE1kYPDPqZcyoqyglFq5zTxluSgpaDkpcY1q1/BQVHbCoXZegh
 2SrwpbPRF1xZ3rMpc9TTXHDhVOBOrfjbA5JRMnKQwkbpGXKzFT+IfM+fEhmGTf8Jh4mvAQ
 f3Dvn6zSsDW9Vy9dtSjtHfctswTmnRw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-FXXtnqCSOc6ggPDch3mHbg-1; Mon, 17 Nov 2025 03:48:05 -0500
X-MC-Unique: FXXtnqCSOc6ggPDch3mHbg-1
X-Mimecast-MFC-AGG-ID: FXXtnqCSOc6ggPDch3mHbg_1763369284
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47777158a85so34821645e9.3
 for <qemu-rust@nongnu.org>; Mon, 17 Nov 2025 00:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763369284; x=1763974084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bXWL09IpvxzHJJZXvTmfbHjqEOYFpT3gc+RY/7fbQEk=;
 b=mT0f5NTkolhdlEegDMlsL0eYVZ0LnxktMzytVdIzGfsOQgSGoRFhaWlVnbdTZt8f3M
 fFwiU2E3TWYiyMSXNTEivFz5AGJUrCRyaNdiKB8vaJbXv9GsKOuv3VJSdlFTMExJZnGj
 5TRKdaH0LF0SGeDJsOmnLY8pv6YXQYA74E1J+deVI4JD9dHWgFjKPwZGrzhgxx0rktjW
 H8NjxPEIG39Tv3Ekx/GFSfFjndFXVSSvrDANEKFjEzsSA0LqGOJVLPOl2SEanXTNtupf
 sl0wf4qePkHOMrG2gPJleWfO5r/c8etOuWQnnJCK+nuwsydy1EquH+XkdutODPaLp7Ce
 BPPA==
X-Gm-Message-State: AOJu0YykhhWqVGsyLPRKXlybfprobYnWwYm0ZlJp+alDcVT6n4b81vkd
 VGdDNzUSSNoVMFNDnCp0w1hxF8KKmn3ju1BxIHY7HgaPfANTitH5pvTchhy0g2+VuRefQmnEmD3
 vwL/PHwSfIbMOPr8BU6SgrIrmprHMLOobDYC32+ao98pnsEK2TN6mgiM=
X-Gm-Gg: ASbGncsv6oCTn0uUjsNwk3lFDxBPK9iXNRBUycEA3WKStTFodAovcTwHLUp7xSb9gtZ
 gE7YLgB8xytyrDiWjo5iaMoBHkZCf0nsMRG6Jh6lAPhCrTNfKDgtyTVCKQUjfrS6nW+09WJ5n0g
 NS5r5cXElwKAqylJ37JvO0C1IiWw3RVdBKUXk5abDry6PiTT14+WF5wiNKpIUL9cXHYlAZYG+PE
 dnGk+/ez0qeAX6bpfS9C9gmDYGqw8YLQCpxoDSFwOWesvIUoSGpBWrBv8N0BzioRk33MDgEHXdy
 SpqtDyqV8HYUjTfafzIr2//5034Hbk+gt7lW7UsUnfS0cS40K9OYpcVk0uH0yc3xpfoV+axu7Yz
 ZfkqeDyLfY8OumbaZm5wLIhpAt2NO8fTZ0vIX53mAWmI191GYuy2QYg0+jAZ7pJCLOeeDecakk6
 9Onc9J
X-Received: by 2002:a05:600c:4fcf:b0:477:63b5:6f39 with SMTP id
 5b1f17b1804b1-4778fe9ab26mr96050895e9.19.1763369283795; 
 Mon, 17 Nov 2025 00:48:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0ztVFNwTbxHTpp0X4RABgpbGcZmzYcWa+a09nVBRT8CMcaQAFP3/azAIRVghZvEQIoH3Fag==
X-Received: by 2002:a05:600c:4fcf:b0:477:63b5:6f39 with SMTP id
 5b1f17b1804b1-4778fe9ab26mr96050615e9.19.1763369283275; 
 Mon, 17 Nov 2025 00:48:03 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4778bae1122sm113161345e9.0.2025.11.17.00.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 00:48:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 3/5] rust/hpet: remove BqlRefCell around HPETTimer
Date: Mon, 17 Nov 2025 09:47:50 +0100
Message-ID: <20251117084752.203219-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117084752.203219-1-pbonzini@redhat.com>
References: <20251117084752.203219-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P6_iJ1j5lgTHR67xYeo-qa9kodRF_IYT_sWKIX_3gvI_1763369284
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

HPETTimer now has all of its state stored in HPETRegisters, so it does not
need its own BqlRefCell anymore.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/device.rs | 53 ++++++++++++++++----------------
 rust/util/src/timer.rs           | 12 +++++---
 2 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 19676af74bc..5bcf151a680 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -126,7 +126,7 @@ enum DecodedRegister<'a> {
     Global(GlobalRegister),
 
     /// Register in the timer block `0x100`...`0x3ff`
-    Timer(&'a BqlRefCell<HPETTimer>, TimerRegister),
+    Timer(&'a HPETTimer, TimerRegister),
 
     /// Invalid address
     #[allow(dead_code)]
@@ -170,8 +170,7 @@ const fn deactivating_bit(old: u64, new: u64, shift: usize) -> bool {
     (old & mask != 0) && (new & mask == 0)
 }
 
-fn timer_handler(timer_cell: &BqlRefCell<HPETTimer>) {
-    let t = timer_cell.borrow();
+fn timer_handler(t: &HPETTimer) {
     // SFAETY: state field is valid after timer initialization.
     let regs = &mut unsafe { t.state.as_ref() }.regs.borrow_mut();
     t.callback(regs)
@@ -277,12 +276,16 @@ fn new(index: u8, state: *const HPETState) -> HPETTimer {
         }
     }
 
-    fn init_timer_with_cell(cell: &BqlRefCell<Self>) {
-        let mut timer = cell.borrow_mut();
-        // SAFETY: HPETTimer is only used as part of HPETState, which is
-        // always pinned.
-        let qemu_timer = unsafe { Pin::new_unchecked(&mut timer.qemu_timer) };
-        qemu_timer.init_full(None, CLOCK_VIRTUAL, Timer::NS, 0, timer_handler, cell);
+    fn init_timer(timer: Pin<&mut Self>) {
+        Timer::init_full(
+            timer,
+            None,
+            CLOCK_VIRTUAL,
+            Timer::NS,
+            0,
+            timer_handler,
+            |t| &mut t.qemu_timer,
+        );
     }
 
     fn get_state(&self) -> &HPETState {
@@ -726,7 +729,7 @@ pub struct HPETState {
 
     /// HPET timer array managed by this timer block.
     #[doc(alias = "timer")]
-    timers: [BqlRefCell<HPETTimer>; HPET_MAX_TIMERS],
+    timers: [HPETTimer; HPET_MAX_TIMERS],
     #[property(rename = "timers", default = HPET_MIN_TIMERS)]
     num_timers: usize,
     num_timers_save: BqlCell<u8>,
@@ -761,11 +764,10 @@ fn init_timers(this: &mut MaybeUninit<Self>) {
 
             // Initialize in two steps, to avoid calling Timer::init_full on a
             // temporary that can be moved.
-            let timer = timer.write(BqlRefCell::new(HPETTimer::new(
-                index.try_into().unwrap(),
-                state,
-            )));
-            HPETTimer::init_timer_with_cell(timer);
+            let timer = timer.write(HPETTimer::new(index.try_into().unwrap(), state));
+            // SAFETY: HPETState is pinned
+            let timer = unsafe { Pin::new_unchecked(timer) };
+            HPETTimer::init_timer(timer);
         }
     }
 
@@ -787,8 +789,7 @@ fn set_cfg_reg(&self, regs: &mut HPETRegisters, shift: u32, len: u32, val: u64)
             // Enable main counter and interrupt generation.
             regs.hpet_offset = ticks_to_ns(regs.counter) - CLOCK_VIRTUAL.get_ns();
 
-            for timer in self.timers.iter().take(self.num_timers) {
-                let t = timer.borrow();
+            for t in self.timers.iter().take(self.num_timers) {
                 let id = t.index as usize;
                 let tn_regs = &regs.tn_regs[id];
 
@@ -801,8 +802,8 @@ fn set_cfg_reg(&self, regs: &mut HPETRegisters, shift: u32, len: u32, val: u64)
             // Halt main counter and disable interrupt generation.
             regs.counter = regs.get_ticks();
 
-            for timer in self.timers.iter().take(self.num_timers) {
-                timer.borrow().del_timer(regs);
+            for t in self.timers.iter().take(self.num_timers) {
+                t.del_timer(regs);
             }
         }
 
@@ -830,9 +831,9 @@ fn set_int_status_reg(&self, regs: &mut HPETRegisters, shift: u32, _len: u32, va
         let new_val = val << shift;
         let cleared = new_val & regs.int_status;
 
-        for (index, timer) in self.timers.iter().take(self.num_timers).enumerate() {
-            if cleared & (1 << index) != 0 {
-                timer.borrow().update_irq(regs, false);
+        for t in self.timers.iter().take(self.num_timers) {
+            if cleared & (1 << t.index) != 0 {
+                t.update_irq(regs, false);
             }
         }
     }
@@ -928,8 +929,8 @@ fn reset_hold(&self, _type: ResetType) {
         {
             let mut regs = self.regs.borrow_mut();
 
-            for timer in self.timers.iter().take(self.num_timers) {
-                timer.borrow().reset(&mut regs);
+            for t in self.timers.iter().take(self.num_timers) {
+                t.reset(&mut regs);
             }
 
             regs.counter = 0;
@@ -981,7 +982,7 @@ fn read(&self, addr: hwaddr, size: u32) -> u64 {
         use DecodedRegister::*;
         use GlobalRegister::*;
         (match target {
-            Timer(timer, tn_target) => timer.borrow().read(tn_target, regs),
+            Timer(t, tn_target) => t.read(tn_target, regs),
             Global(CAP) => regs.capability, /* including HPET_PERIOD 0x004 */
             Global(CFG) => regs.config,
             Global(INT_STATUS) => regs.int_status,
@@ -1012,7 +1013,7 @@ fn write(&self, addr: hwaddr, value: u64, size: u32) {
         use DecodedRegister::*;
         use GlobalRegister::*;
         match target {
-            Timer(timer, tn_target) => timer.borrow().write(tn_target, regs, value, shift, len),
+            Timer(t, tn_target) => t.write(tn_target, regs, value, shift, len),
             Global(CAP) => {} // General Capabilities and ID Register: Read Only
             Global(CFG) => self.set_cfg_reg(regs, shift, len, value),
             Global(INT_STATUS) => self.set_int_status_reg(regs, shift, len, value),
diff --git a/rust/util/src/timer.rs b/rust/util/src/timer.rs
index c6b3e4088ec..829f52d111e 100644
--- a/rust/util/src/timer.rs
+++ b/rust/util/src/timer.rs
@@ -45,14 +45,14 @@ impl Timer {
     }
 
     /// Create a new timer with the given attributes.
-    pub fn init_full<'timer, 'opaque: 'timer, T, F>(
-        self: Pin<&'timer mut Self>,
+    pub fn init_full<T, F>(
+        opaque: Pin<&mut T>,
         timer_list_group: Option<&TimerListGroup>,
         clk_type: ClockType,
         scale: u32,
         attributes: u32,
         _cb: F,
-        opaque: &'opaque T,
+        field: impl FnOnce(&mut T) -> &mut Self,
     ) where
         F: for<'a> FnCall<(&'a T,)>,
     {
@@ -70,8 +70,10 @@ pub fn init_full<'timer, 'opaque: 'timer, T, F>(
 
         // SAFETY: the opaque outlives the timer
         unsafe {
+            let opaque = Pin::into_inner_unchecked(opaque);
+            let timer = field(opaque).as_mut_ptr();
             timer_init_full(
-                self.as_mut_ptr(),
+                timer,
                 if let Some(g) = timer_list_group {
                     g as *const TimerListGroup as *mut _
                 } else {
@@ -81,7 +83,7 @@ pub fn init_full<'timer, 'opaque: 'timer, T, F>(
                 scale as c_int,
                 attributes as c_int,
                 Some(timer_cb),
-                (opaque as *const T).cast::<c_void>().cast_mut(),
+                (opaque as *mut T).cast::<c_void>(),
             )
         }
     }
-- 
2.51.1


