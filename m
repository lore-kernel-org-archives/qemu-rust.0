Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYidU-0002cT-SI
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYidR-0002bd-RM
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:27:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYidL-0003RV-7t
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737106038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BITrw44P4w2bvCQ1NpWsRn31RrbjunDLRRexWgq3HHQ=;
 b=PE/DzH75cZbjHrC6hdUE8UOmaiKg0O0ezvjH5RnlOYoKqK2KWfr361R12foURgi0ZFRfp3
 npbep2BFxhEf+1+eP8JWPlhbhs/Gjent20/v/dNs4ltEXzFQlonRggAPQFVBd8ybBHjSbN
 Exevbw5QRalLDFrOFWINQhUuqK8tc4k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-iv35mcTxNTi5x6WRHCdNpw-1; Fri, 17 Jan 2025 04:27:17 -0500
X-MC-Unique: iv35mcTxNTi5x6WRHCdNpw-1
X-Mimecast-MFC-AGG-ID: iv35mcTxNTi5x6WRHCdNpw
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5d9e4d33f04so1852856a12.0
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737106035; x=1737710835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BITrw44P4w2bvCQ1NpWsRn31RrbjunDLRRexWgq3HHQ=;
 b=UuPKPuPWo4wowE1ZAHebU0FyzC7TPSC0fR0SiCcHvTrlbcq+aubEJpjbP5CJCVFJK4
 N12aAR9MJGLXVA4mIK/JUoqQF5xlp92NSuYsN3B1LpFgGqSqoIHSzhISRQ7GQ4Df5y8K
 WumgRXvoHGyqMv2zMa6LoOIFx8UvwpFwbBtiYJpje+t3Mp/Cj4p0UNmDoNapJVWtyJEn
 MckZq7Wi8ah6GHjgZAaXoMGTTUEOgWCgGdoG1Jg46s/KcrmipdavGr/e6/EhSOlw60mP
 8dfdNoTUoG2olT1CoGcV1+7VDOG6JMyfqd9xhqeJmd+lwqt8ZBQp6dQwiyqPuUxcxvHG
 V+6A==
X-Gm-Message-State: AOJu0YwzPMIQnkluB2FWeo7pA0fSabMB/eQGqGElsqFycMZH9qMuLF0H
 XpKpuFETC9InuRTskcjI4V5WmhwS9Pglys9CGX/a+VMpb+ON8QY6f0FJr6EGIPJxX+a1ps7dpug
 6us+3zyxx1WH8bvyq4ihMjyLluRGZ7I5X6li3q52C6AEh0puROz+dpX9x+OsiAQ==
X-Gm-Gg: ASbGnctLSmn7ME1ypLUN6cI5KMSxY7GdzU+rZUX1Yg86utYfNcT0Hq5mt5jLXkp6CpQ
 uU3MF5If13LQr1IoLzoJtPVFDZw0PJjDQ6m9HWuTCjq3s4o5tZJtrEXFGjDnCux3c07ibdtjfod
 807wf5Gm8fzQYPUjcTdeJDZdE3p9D/hlDKHz5Kc1tR5Nt1rb7zwyqExmn1704xJOQZQSKnbRaxO
 CeRhM5YGaHe8f0Q7c3DYAoF5bxeHCsfbDnN+tOGfG6YfKsP3YYW9H66MDNo
X-Received: by 2002:a17:907:d87:b0:aab:d4f0:c598 with SMTP id
 a640c23a62f3a-ab38b163e88mr182766266b.27.1737106035468; 
 Fri, 17 Jan 2025 01:27:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHM3xBiLlu1RrP/TGFxrKCGnXWRBJYhH422XRXl47H2MI/ZbKF33AxiB9YjlvutaayNsAPfgA==
X-Received: by 2002:a17:907:d87:b0:aab:d4f0:c598 with SMTP id
 a640c23a62f3a-ab38b163e88mr182764766b.27.1737106035051; 
 Fri, 17 Jan 2025 01:27:15 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384f2242bsm137373666b.118.2025.01.17.01.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:27:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 07/10] rust: pl011: wrap registers with BqlRefCell
Date: Fri, 17 Jan 2025 10:26:54 +0100
Message-ID: <20250117092657.1051233-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117092657.1051233-1-pbonzini@redhat.com>
References: <20250117092657.1051233-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sKRYpJlqYHmhQpHBCblPtTiPe5sazZmBjvH8egPnnBM_1737106036
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.797,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 17 Jan 2025 09:27:26 -0000

This is a step towards making memory ops use a shared reference to the
device type; it's not yet possible due to the calls to character device
functions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs       | 38 +++++++++++++-------------
 rust/hw/char/pl011/src/device_class.rs |  8 +++---
 rust/hw/char/pl011/src/memory_ops.rs   |  2 +-
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 476abe765a9..1d3da59e481 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -102,14 +102,14 @@ pub struct PL011Registers {
 }
 
 #[repr(C)]
-#[derive(Debug, qemu_api_macros::Object, qemu_api_macros::offsets)]
+#[derive(qemu_api_macros::Object, qemu_api_macros::offsets)]
 /// PL011 Device Model in QEMU
 pub struct PL011State {
     pub parent_obj: ParentField<SysBusDevice>,
     pub iomem: MemoryRegion,
     #[doc(alias = "chr")]
     pub char_backend: CharBackend,
-    pub regs: PL011Registers,
+    pub regs: BqlRefCell<PL011Registers>,
     /// QEMU interrupts
     ///
     /// ```text
@@ -530,8 +530,8 @@ fn post_init(&self) {
         }
     }
 
+    #[allow(clippy::needless_pass_by_ref_mut)]
     pub fn read(&mut self, offset: hwaddr, _size: u32) -> ControlFlow<u64, u64> {
-        let regs = &mut self.regs;
         match RegisterOffset::try_from(offset) {
             Err(v) if (0x3f8..0x400).contains(&(v >> 2)) => {
                 let device_id = self.get_class().device_id;
@@ -541,7 +541,7 @@ pub fn read(&mut self, offset: hwaddr, _size: u32) -> ControlFlow<u64, u64> {
                 // qemu_log_mask(LOG_GUEST_ERROR, "pl011_read: Bad offset 0x%x\n", (int)offset);
                 ControlFlow::Break(0)
             }
-            Ok(field) => match regs.read(field) {
+            Ok(field) => match self.regs.borrow_mut().read(field) {
                 ControlFlow::Break(value) => ControlFlow::Break(value.into()),
                 ControlFlow::Continue(value) => {
                     self.update();
@@ -552,7 +552,7 @@ pub fn read(&mut self, offset: hwaddr, _size: u32) -> ControlFlow<u64, u64> {
     }
 
     pub fn write(&mut self, offset: hwaddr, value: u64) {
-        let regs = &mut self.regs;
+        let mut regs = self.regs.borrow_mut();
         if let Ok(field) = RegisterOffset::try_from(offset) {
             if regs.write(field, value as u32, &mut self.char_backend) {
                 self.update();
@@ -564,19 +564,19 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
 
     pub fn can_receive(&self) -> bool {
         // trace_pl011_can_receive(s->lcr, s->read_count, r);
-        let regs = &self.regs;
+        let regs = self.regs.borrow();
         regs.read_count < regs.fifo_depth()
     }
 
-    pub fn receive(&mut self, ch: u32) {
-        let regs = &mut self.regs;
+    pub fn receive(&self, ch: u32) {
+        let mut regs = self.regs.borrow_mut();
         if !regs.loopback_enabled() && regs.put_fifo(ch) {
             self.update();
         }
     }
 
-    pub fn event(&mut self, event: QEMUChrEvent) {
-        let regs = &mut self.regs;
+    pub fn event(&self, event: QEMUChrEvent) {
+        let mut regs = self.regs.borrow_mut();
         if event == bindings::QEMUChrEvent::CHR_EVENT_BREAK && !regs.loopback_enabled() {
             let update = regs.put_fifo(registers::Data::BREAK.into());
             if update {
@@ -603,19 +603,19 @@ pub fn realize(&mut self) {
     }
 
     pub fn reset(&mut self) {
-        self.regs.reset();
+        self.regs.borrow_mut().reset();
     }
 
     pub fn update(&self) {
-        let regs = &self.regs;
+        let regs = self.regs.borrow();
         let flags = regs.int_level & regs.int_enabled;
         for (irq, i) in self.interrupts.iter().zip(IRQMASK) {
             irq.set(flags & i != 0);
         }
     }
 
-    pub fn post_load(&mut self, _version_id: u32) -> Result<(), ()> {
-        self.regs.post_load()
+    pub fn post_load(&self, _version_id: u32) -> Result<(), ()> {
+        self.regs.borrow_mut().post_load()
     }
 }
 
@@ -657,10 +657,10 @@ pub fn post_load(&mut self, _version_id: u32) -> Result<(), ()> {
 pub unsafe extern "C" fn pl011_receive(opaque: *mut c_void, buf: *const u8, size: c_int) {
     unsafe {
         debug_assert!(!opaque.is_null());
-        let mut state = NonNull::new_unchecked(opaque.cast::<PL011State>());
+        let state = NonNull::new_unchecked(opaque.cast::<PL011State>());
         if size > 0 {
             debug_assert!(!buf.is_null());
-            state.as_mut().receive(u32::from(buf.read_volatile()));
+            state.as_ref().receive(u32::from(buf.read_volatile()));
         }
     }
 }
@@ -673,8 +673,8 @@ pub fn post_load(&mut self, _version_id: u32) -> Result<(), ()> {
 pub unsafe extern "C" fn pl011_event(opaque: *mut c_void, event: QEMUChrEvent) {
     unsafe {
         debug_assert!(!opaque.is_null());
-        let mut state = NonNull::new_unchecked(opaque.cast::<PL011State>());
-        state.as_mut().event(event)
+        let state = NonNull::new_unchecked(opaque.cast::<PL011State>());
+        state.as_ref().event(event)
     }
 }
 
@@ -700,7 +700,7 @@ pub fn post_load(&mut self, _version_id: u32) -> Result<(), ()> {
 }
 
 #[repr(C)]
-#[derive(Debug, qemu_api_macros::Object)]
+#[derive(qemu_api_macros::Object)]
 /// PL011 Luminary device model.
 pub struct PL011Luminary {
     parent_obj: ParentField<PL011State>,
diff --git a/rust/hw/char/pl011/src/device_class.rs b/rust/hw/char/pl011/src/device_class.rs
index e25645ceb0d..06178778a8e 100644
--- a/rust/hw/char/pl011/src/device_class.rs
+++ b/rust/hw/char/pl011/src/device_class.rs
@@ -6,7 +6,7 @@
 use std::os::raw::{c_int, c_void};
 
 use qemu_api::{
-    bindings::*, c_str, vmstate_clock, vmstate_fields, vmstate_of, vmstate_struct,
+    bindings::*, c_str, prelude::*, vmstate_clock, vmstate_fields, vmstate_of, vmstate_struct,
     vmstate_subsections, vmstate_unused, zeroable::Zeroable,
 };
 
@@ -35,8 +35,8 @@ extern "C" fn pl011_clock_needed(opaque: *mut c_void) -> bool {
 extern "C" fn pl011_post_load(opaque: *mut c_void, version_id: c_int) -> c_int {
     unsafe {
         debug_assert!(!opaque.is_null());
-        let mut state = NonNull::new_unchecked(opaque.cast::<PL011State>());
-        let result = state.as_mut().post_load(version_id as u32);
+        let state = NonNull::new_unchecked(opaque.cast::<PL011State>());
+        let result = state.as_ref().post_load(version_id as u32);
         if result.is_err() {
             -1
         } else {
@@ -76,7 +76,7 @@ extern "C" fn pl011_post_load(opaque: *mut c_void, version_id: c_int) -> c_int {
     post_load: Some(pl011_post_load),
     fields: vmstate_fields! {
         vmstate_unused!(core::mem::size_of::<u32>()),
-        vmstate_struct!(PL011State, regs, &VMSTATE_PL011_REGS, PL011Registers),
+        vmstate_struct!(PL011State, regs, &VMSTATE_PL011_REGS, BqlRefCell<PL011Registers>),
     },
     subsections: vmstate_subsections! {
         VMSTATE_PL011_CLOCK
diff --git a/rust/hw/char/pl011/src/memory_ops.rs b/rust/hw/char/pl011/src/memory_ops.rs
index c4e8599ba43..8f66c8d492c 100644
--- a/rust/hw/char/pl011/src/memory_ops.rs
+++ b/rust/hw/char/pl011/src/memory_ops.rs
@@ -26,7 +26,7 @@
 unsafe extern "C" fn pl011_read(opaque: *mut c_void, addr: hwaddr, size: c_uint) -> u64 {
     assert!(!opaque.is_null());
     let mut state = unsafe { NonNull::new_unchecked(opaque.cast::<PL011State>()) };
-    let val = unsafe { state.as_mut().read(addr, size) };
+    let val = unsafe { state.as_mut() }.read(addr, size);
     match val {
         std::ops::ControlFlow::Break(val) => val,
         std::ops::ControlFlow::Continue(val) => {
-- 
2.47.1


