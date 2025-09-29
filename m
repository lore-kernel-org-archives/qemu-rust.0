Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F0ACAC5B5
	for <qemu-rust@archiver.kernel.org>; Mon, 29 Sep 2025 15:52:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3G9f-0001U2-V8; Mon, 29 Sep 2025 11:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G96-00010g-9S
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8n-0000b2-2J
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759161012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6xM/ox5jvRdTn+yGMrz0OpMCK/hH4jqDMxHh4/RbrLg=;
 b=RfWC/T76599Idg5LOwARI84HYiW/ZbVEB93v4jYTxTJ4F6xg4u1DhLuaF0MxbLOhuDDeYo
 nK7ZStMFO1T1Rek7IjyidFmWGDTdSbWunnd9FJMChbMBm3q3GrcBFVWi9SmL0yBYmPYvlt
 RfRYefjNyrES2DTb0uICW2XeV2tKLVE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-v3qmejFDOhyx3i57tSgl9A-1; Mon, 29 Sep 2025 11:50:11 -0400
X-MC-Unique: v3qmejFDOhyx3i57tSgl9A-1
X-Mimecast-MFC-AGG-ID: v3qmejFDOhyx3i57tSgl9A_1759161010
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-634ae21c4cdso6407160a12.3
 for <qemu-rust@nongnu.org>; Mon, 29 Sep 2025 08:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759161010; x=1759765810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6xM/ox5jvRdTn+yGMrz0OpMCK/hH4jqDMxHh4/RbrLg=;
 b=kw1MKHAX+kvcB2gSlBY0L5Wbn+o/+IMiIMuXMPBKCmZLxjMSbQTErDh1EuiIxaxS/N
 iKhlMFgUn6/z69Zo4i8AgCxV9R/JUqWN/JwnNlKCctM2SOk39xjx4jmuA4zNclyRObSK
 GVk2jl2L53i2shI/eDpwIQ/JkPPiwtYPbQtgEg6eIiv9dL6BVaZT0LeHX4AopT5GCGST
 Mj3fGlfmwCa4ujMFKOcEuLfcF5wEANzrGlo4OwgnUCufDPBEmYfaR+087qQsEijPG3Jo
 m4T2l0ecxmvnIUnoT0X8i2+1IOBP3i9ZYO22XDwo3K8c9KB3UQEu0y/ts2A7wz8Lu0hp
 UCXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEZUrJqCkwVZBNt53zPzw26ArW0bbaRjbhMGCxf1aMi8yDTkDvSd+Ny94+5eqOaO5crydmjr7Rqik=@nongnu.org
X-Gm-Message-State: AOJu0YzfbQREdgVbJx5D0RNPpsEDhsRwIVqX3UPCleFSp0wX27Yeka/U
 L8s6ymGhz5EyMqA8sSxtEqd1ouylz2DE4DAGSbTnWRr7uefoKOkjv+qpNBK6LKxew7dFdbcEHXz
 PS534DmrFH5qDNfOM+WTX4kATfSKLy86Q/CyOOIiiw40Pf51aL2y+k+k=
X-Gm-Gg: ASbGncvJywcGOlTtEqy4q5VSZCc+2uYHAzf+iy7aXjAvBLPuUCWm5P+iIvQq/hGiDAo
 TSN1HPcypCCuaN8lkxt+LxA56k/TLqJMsZ9YPj6F9juNrAOP+VodR0Tdh3SScmLfRlF7EnqnJim
 hZnkbhUPmmZzEvd7tsZaVhmU4Vb75CwpEbK7zxvgcaYKosTjIDpctCDo4lMddd9dSoz4t2K7QVQ
 RnzLj8fWnXH3H6oBHHGWzbBDmT9/JqlalrlSm72VamI0frKZoLG5x5TJkaBHfvPPzGcrJgNrQxa
 EGO6ticUZLa3s20QAci3n5tMrHEGYk8JIbYfxqkoORFwTEUPoQEjK0YwtKgQCyzVUNN+2sxaL+q
 KmHahumUDgAPU9ZQuWW3hDuTQCgH27aYAueENKuJIzSy3rA==
X-Received: by 2002:a05:6402:1806:b0:634:5381:530b with SMTP id
 4fb4d7f45d1cf-6349f9e69d2mr11729351a12.13.1759161009822; 
 Mon, 29 Sep 2025 08:50:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVnmIw0jUoeyvBAr7W+rxG6zzqBZgzWS/rdEuDiMTI1qjGzsXgi9zf2/bTcStUy2ivrAkSxw==
X-Received: by 2002:a05:6402:1806:b0:634:5381:530b with SMTP id
 4fb4d7f45d1cf-6349f9e69d2mr11729323a12.13.1759161009325; 
 Mon, 29 Sep 2025 08:50:09 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3629badsm7845552a12.9.2025.09.29.08.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 08:50:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tanish Desai <tanishdesai37@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-rust@nongnu.org
Subject: [PATCH 11/16] rust: pl011: add tracepoints
Date: Mon, 29 Sep 2025 17:49:33 +0200
Message-ID: <20250929154938.594389-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929154938.594389-1-pbonzini@redhat.com>
References: <20250929154938.594389-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2RmHbXkVyuROtM0e4vu1Hb9noxNsx0Qrq4dcXB3ePyM_1759161010
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Finally bring parity between C and Rust versions of the PL011 device model.
Changing some types of the arguments makes for nicer Rust code; C does not
care. :)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/char/trace-events             | 14 ++++----
 rust/Cargo.lock                  |  1 +
 rust/hw/char/pl011/Cargo.toml    |  1 +
 rust/hw/char/pl011/meson.build   |  1 +
 rust/hw/char/pl011/src/device.rs | 57 ++++++++++++++++++++++----------
 5 files changed, 50 insertions(+), 24 deletions(-)

diff --git a/hw/char/trace-events b/hw/char/trace-events
index 05a33036c12..9e74be2c14f 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -58,15 +58,15 @@ imx_serial_write(const char *chrname, uint64_t addr, uint64_t value) "%s:[0x%03"
 imx_serial_put_data(const char *chrname, uint32_t value) "%s: 0x%" PRIx32
 
 # pl011.c
-pl011_irq_state(int level) "irq state %d"
-pl011_read(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
-pl011_read_fifo(unsigned rx_fifo_used, size_t rx_fifo_depth) "RX FIFO read, used %u/%zu"
-pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
-pl011_can_receive(uint32_t lcr, unsigned rx_fifo_used, size_t rx_fifo_depth, unsigned rx_fifo_available) "LCR 0x%02x, RX FIFO used %u/%zu, can_receive %u chars"
-pl011_fifo_rx_put(uint32_t c, unsigned read_count, size_t rx_fifo_depth) "RX FIFO push char [0x%02x] %d/%zu depth used"
+pl011_irq_state(bool level) "irq state %d"
+pl011_read(uint64_t addr, uint32_t value, const char *regname) "addr 0x%03" PRIx64 " value 0x%08x reg %s"
+pl011_read_fifo(unsigned rx_fifo_used, unsigned rx_fifo_depth) "RX FIFO read, used %u/%u"
+pl011_write(uint64_t addr, uint32_t value, const char *regname) "addr 0x%03" PRIx64 " value 0x%08x reg %s"
+pl011_can_receive(uint32_t lcr, unsigned rx_fifo_used, unsigned rx_fifo_depth, unsigned rx_fifo_available) "LCR 0x%02x, RX FIFO used %u/%u, can_receive %u chars"
+pl011_fifo_rx_put(uint32_t c, unsigned read_count, unsigned rx_fifo_depth) "RX FIFO push char [0x%02x] %d/%u depth used"
 pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
-pl011_receive(int size) "recv %d chars"
+pl011_receive(size_t size) "recv %zd chars"
 
 # cmsdk-apb-uart.c
 cmsdk_apb_uart_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB UART read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
diff --git a/rust/Cargo.lock b/rust/Cargo.lock
index 3428dbaf0b3..f84a3dd0764 100644
--- a/rust/Cargo.lock
+++ b/rust/Cargo.lock
@@ -159,6 +159,7 @@ dependencies = [
  "migration",
  "qom",
  "system",
+ "trace",
  "util",
 ]
 
diff --git a/rust/hw/char/pl011/Cargo.toml b/rust/hw/char/pl011/Cargo.toml
index b2418abc4bf..dc41d0e499e 100644
--- a/rust/hw/char/pl011/Cargo.toml
+++ b/rust/hw/char/pl011/Cargo.toml
@@ -24,6 +24,7 @@ qom = { path = "../../../qom" }
 chardev = { path = "../../../chardev" }
 system = { path = "../../../system" }
 hwcore = { path = "../../../hw/core" }
+trace = { path = "../../../trace" }
 
 [lints]
 workspace = true
diff --git a/rust/hw/char/pl011/meson.build b/rust/hw/char/pl011/meson.build
index ffdc8af53f1..ed28b158add 100644
--- a/rust/hw/char/pl011/meson.build
+++ b/rust/hw/char/pl011/meson.build
@@ -39,6 +39,7 @@ _libpl011_rs = static_library(
     chardev_rs,
     system_rs,
     hwcore_rs,
+    trace_rs
   ],
 )
 
diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 1b4587d5f60..8889d6e54fb 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -21,6 +21,8 @@
 
 use crate::registers::{self, Interrupt, RegisterOffset};
 
+::trace::include_trace!("hw_char");
+
 // TODO: You must disable the UART before any of the control registers are
 // reprogrammed. When the UART is disabled in the middle of transmission or
 // reception, it completes the current character before stopping
@@ -208,13 +210,7 @@ pub(self) fn read(&mut self, offset: RegisterOffset) -> (bool, u32) {
         (update, result)
     }
 
-    pub(self) fn write(
-        &mut self,
-        offset: RegisterOffset,
-        value: u32,
-        char_backend: &CharBackend,
-    ) -> bool {
-        // eprintln!("write offset {offset} value {value}");
+    pub(self) fn write(&mut self, offset: RegisterOffset, value: u32, device: &PL011State) -> bool {
         use RegisterOffset::*;
         match offset {
             DR => return self.write_data_register(value),
@@ -229,9 +225,11 @@ pub(self) fn write(
             }
             IBRD => {
                 self.ibrd = value;
+                device.trace_baudrate_change(self.ibrd, self.fbrd);
             }
             FBRD => {
                 self.fbrd = value;
+                device.trace_baudrate_change(self.ibrd, self.fbrd);
             }
             LCR_H => {
                 let new_val: registers::LineControl = value.into();
@@ -242,7 +240,7 @@ pub(self) fn write(
                 }
                 let update = (self.line_control.send_break() != new_val.send_break()) && {
                     let break_enable = new_val.send_break();
-                    let _ = char_backend.send_break(break_enable);
+                    let _ = device.char_backend.send_break(break_enable);
                     self.loopback_break(break_enable)
                 };
                 self.line_control = new_val;
@@ -279,12 +277,13 @@ pub(self) fn write(
     }
 
     fn read_data_register(&mut self, update: &mut bool) -> u32 {
+        let depth = self.fifo_depth();
         self.flags.set_receive_fifo_full(false);
         let c = self.read_fifo[self.read_pos];
 
         if self.read_count > 0 {
             self.read_count -= 1;
-            self.read_pos = (self.read_pos + 1) & (self.fifo_depth() - 1);
+            self.read_pos = (self.read_pos + 1) & (depth - 1);
         }
         if self.read_count == 0 {
             self.flags.set_receive_fifo_empty(true);
@@ -292,6 +291,7 @@ fn read_data_register(&mut self, update: &mut bool) -> u32 {
         if self.read_count + 1 == self.read_trigger {
             self.int_level &= !Interrupt::RX;
         }
+        trace::trace_pl011_read_fifo(self.read_count, depth);
         self.receive_status_error_clear.set_from_data(c);
         *update = true;
         u32::from(c)
@@ -447,7 +447,9 @@ pub fn fifo_rx_put(&mut self, value: registers::Data) -> bool {
         self.read_fifo[slot] = value;
         self.read_count += 1;
         self.flags.set_receive_fifo_empty(false);
+        trace::trace_pl011_fifo_rx_put(value.into(), self.read_count, depth);
         if self.read_count == depth {
+            trace::trace_pl011_fifo_rx_full();
             self.flags.set_receive_fifo_full(true);
         }
 
@@ -516,8 +518,21 @@ unsafe fn init(mut this: ParentInit<Self>) {
         uninit_field_mut!(*this, clock).write(clock);
     }
 
-    const fn clock_update(&self, _event: ClockEvent) {
-        /* pl011_trace_baudrate_change(s); */
+    pub fn trace_baudrate_change(&self, ibrd: u32, fbrd: u32) {
+        let divider = 4.0 / f64::from(ibrd * (FBRD_MASK + 1) + fbrd);
+        let hz = self.clock.hz();
+        let rate = if ibrd == 0 {
+            0
+        } else {
+            ((hz as f64) * divider) as u32
+        };
+        trace::trace_pl011_baudrate_change(rate, hz, ibrd, fbrd);
+    }
+
+    fn clock_update(&self, _event: ClockEvent) {
+        let regs = self.regs.borrow();
+        let (ibrd, fbrd) = (regs.ibrd, regs.fbrd);
+        self.trace_baudrate_change(ibrd, fbrd)
     }
 
     pub fn clock_needed(&self) -> bool {
@@ -543,6 +558,7 @@ fn read(&self, offset: hwaddr, _size: u32) -> u64 {
             }
             Ok(field) => {
                 let (update_irq, result) = self.regs.borrow_mut().read(field);
+                trace::trace_pl011_read(offset, result, c"");
                 if update_irq {
                     self.update();
                     self.char_backend.accept_input();
@@ -557,6 +573,7 @@ fn write(&self, offset: hwaddr, value: u64, _size: u32) {
         if let Ok(field) = RegisterOffset::try_from(offset) {
             // qemu_chr_fe_write_all() calls into the can_receive
             // callback, so handle writes before entering PL011Registers.
+            trace::trace_pl011_write(offset, value as u32, c"");
             if field == RegisterOffset::DR {
                 // ??? Check if transmitter is enabled.
                 let ch: [u8; 1] = [value as u8];
@@ -565,10 +582,7 @@ fn write(&self, offset: hwaddr, value: u64, _size: u32) {
                 let _ = self.char_backend.write_all(&ch);
             }
 
-            update_irq = self
-                .regs
-                .borrow_mut()
-                .write(field, value as u32, &self.char_backend);
+            update_irq = self.regs.borrow_mut().write(field, value as u32, self);
         } else {
             log_mask_ln!(
                 Log::GuestError,
@@ -582,11 +596,19 @@ fn write(&self, offset: hwaddr, value: u64, _size: u32) {
 
     fn can_receive(&self) -> u32 {
         let regs = self.regs.borrow();
-        // trace_pl011_can_receive(s->lcr, s->read_count, r);
-        regs.fifo_depth() - regs.read_count
+        let fifo_available = regs.fifo_depth() - regs.read_count;
+        trace::trace_pl011_can_receive(
+            regs.line_control.into(),
+            regs.read_count,
+            regs.fifo_depth(),
+            fifo_available,
+        );
+        fifo_available
     }
 
     fn receive(&self, buf: &[u8]) {
+        trace::trace_pl011_receive(buf.len());
+
         let mut regs = self.regs.borrow_mut();
         if regs.loopback_enabled() {
             // In loopback mode, the RX input signal is internally disconnected
@@ -635,6 +657,7 @@ fn reset_hold(&self, _type: ResetType) {
     fn update(&self) {
         let regs = self.regs.borrow();
         let flags = regs.int_level & regs.int_enabled;
+        trace::trace_pl011_irq_state(flags != 0);
         for (irq, i) in self.interrupts.iter().zip(IRQMASK) {
             irq.set(flags.any_set(i));
         }
-- 
2.51.0


