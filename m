Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnh1f-00007x-La
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 11:46:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnh1M-0008Rg-Bq
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 11:46:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnh1I-0007qt-BJ
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 11:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740674754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jqB9iJokqmluSAsMEShYfyYzEVhrNHlSWPdg3LihApk=;
 b=bKDMvz1iBnz0WSYYkgRtp6UxwYxnnKYmD7WTCibNl3QQu7g7V03kjsdyrqB2oRR7BSWj9q
 AkAgzK6kkZqnj6cEtqt1ZYUgaRQKPCGg+Cge2VdhOcjk+CiU1Hbqlw1NYWfLqFb+7EmYTP
 Faf4sdw6icSHaPwTHgSXjXLHUylz/XE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-NWFRIOFRN0O_zZ8tWnYhPw-1; Thu, 27 Feb 2025 11:45:51 -0500
X-MC-Unique: NWFRIOFRN0O_zZ8tWnYhPw-1
X-Mimecast-MFC-AGG-ID: NWFRIOFRN0O_zZ8tWnYhPw_1740674750
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-abb87e3a3c9so140346666b.2
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 08:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740674749; x=1741279549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jqB9iJokqmluSAsMEShYfyYzEVhrNHlSWPdg3LihApk=;
 b=Ib/vcBfetF1aHlLejQsqiw1fT/XoIO2oIPBc+uWc97QGqBuklVzWeV9q6j3H6+vcFg
 LZyLZeO92BynJP0pHoAzGMWz3i3yBTow7PwI/HDfvXPpztFFIRhhtF1SMBDxhk++EHvO
 dYwfQ13kJju5JlrEiPfu9tSPzZOGuZG7x7r2n2Q++09OoUUFaFhOYLvA6uh/nJkl3GoJ
 LbB7LMnIpVB1XucGJwNSnb6+Cw2rj3HrFTvD08Qubp58gRdd+G9Xyu2jTsT/fSEt594Y
 o7uBgefVz8g5dBe5gHU1ICKT00eEKbnnFhAnzrPulenRLxY8NGKcV2nbek/rqPYVQM2J
 HLhw==
X-Gm-Message-State: AOJu0Yw/o1vU0zcdNAwvSbDeLB8Wp8FjNWYkQDsOV9ARsEC+QeU1EoPu
 LUbYiBCUQ+Fh8j0lTd4h9hPrvApA0SECCeS8N0eb+TkCKvpMjSJXiEUIroMuAvvsZGl88irvdWi
 vckL4pAkTO/t+M0/nJMfTsD4ULreej/Y5M8H7OSK5N6qxZpZoLlSnj4fEv+hdtA==
X-Gm-Gg: ASbGncvT0qMeECt6S4jRBRFoko/gCORhdC86EfztoZ2cwGTldgDSyIsinVPPvR4KMbE
 TtXBV6lDpgUCoZ0rz6V9foyuWxIK1BwT7SQmsbY+Gw5xN+62lZuH4+LwUfrmJENmS/vNce0LhJb
 hstfTZWlq7NUyupFIPbRAGcHqaNu0YO4MPt2SQKMfhyAANmawqaaTGIev4IhacOXwQOXzsrYG6X
 mj2OgCxlc+84AMCJk21ATzDuhwKdWI7QeKDDFSPqI+Sa/ogCMuHMcY+KbfrQUP+8nTrO/dhKMct
 Rs/fsGRfsk83O1h9AA==
X-Received: by 2002:a17:906:da88:b0:abe:fed3:9eb8 with SMTP id
 a640c23a62f3a-abf2687fe85mr10583466b.41.1740674748985; 
 Thu, 27 Feb 2025 08:45:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiUSLoz/5h/sVOIyTG4cZUIUWywZC+7Ocvaw54WV8v2wYGoZqmW6mmP7rrKNmMD+kPyYuPCQ==
X-Received: by 2002:a17:906:da88:b0:abe:fed3:9eb8 with SMTP id
 a640c23a62f3a-abf2687fe85mr10580166b.41.1740674748602; 
 Thu, 27 Feb 2025 08:45:48 -0800 (PST)
Received: from [192.168.1.84] ([93.56.163.127])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c6ed7f1sm147260666b.120.2025.02.27.08.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 08:45:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 5/5] rust: pl011: pass around registers::Data
Date: Thu, 27 Feb 2025 17:45:34 +0100
Message-ID: <20250227164538.814576-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227164538.814576-1-pbonzini@redhat.com>
References: <20250227164538.814576-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mOAfq0K3nKTB8wT65QpjL-6XUp8nAZazjVVBxvL7i_w_1740674750
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 27 Feb 2025 16:46:12 -0000

The values stored in the Fifo are instances of the bitfield-struct
registers::Data.  Convert as soon as possible the value written
into DR, and always refer to the bitfield struct; it's generally
cleaner other than PL011State::receive having to do a double
conversion u8=>u32=>registers::Data.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 2283bae71eb..a679f6295f5 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -237,7 +237,7 @@ pub(self) fn write(
         match offset {
             DR => {
                 // interrupts always checked
-                let _ = self.loopback_tx(value);
+                let _ = self.loopback_tx(value.into());
                 self.int_level |= Interrupt::TX.0;
                 return true;
             }
@@ -304,7 +304,7 @@ pub(self) fn write(
 
     #[inline]
     #[must_use]
-    fn loopback_tx(&mut self, value: u32) -> bool {
+    fn loopback_tx(&mut self, value: registers::Data) -> bool {
         // Caveat:
         //
         // In real hardware, TX loopback happens at the serial-bit level
@@ -373,7 +373,7 @@ fn loopback_mdmctrl(&mut self) -> bool {
     }
 
     fn loopback_break(&mut self, enable: bool) -> bool {
-        enable && self.loopback_tx(registers::Data::BREAK.into())
+        enable && self.loopback_tx(registers::Data::BREAK)
     }
 
     fn set_read_trigger(&mut self) {
@@ -432,11 +432,11 @@ pub fn fifo_depth(&self) -> u32 {
     }
 
     #[must_use]
-    pub fn put_fifo(&mut self, value: u32) -> bool {
+    pub fn put_fifo(&mut self, value: registers::Data) -> bool {
         let depth = self.fifo_depth();
         assert!(depth > 0);
         let slot = (self.read_pos + self.read_count) & (depth - 1);
-        self.read_fifo[slot] = registers::Data::from(value);
+        self.read_fifo[slot] = value;
         self.read_count += 1;
         self.flags.set_receive_fifo_empty(false);
         if self.read_count == depth {
@@ -581,7 +581,8 @@ fn receive(&self, buf: &[u8]) {
             return;
         }
         let mut regs = self.regs.borrow_mut();
-        let update_irq = !regs.loopback_enabled() && regs.put_fifo(buf[0].into());
+        let c: u32 = buf[0].into();
+        let update_irq = !regs.loopback_enabled() && regs.put_fifo(c.into());
         // Release the BqlRefCell before calling self.update()
         drop(regs);
 
@@ -594,7 +595,7 @@ fn event(&self, event: Event) {
         let mut update_irq = false;
         let mut regs = self.regs.borrow_mut();
         if event == Event::CHR_EVENT_BREAK && !regs.loopback_enabled() {
-            update_irq = regs.put_fifo(registers::Data::BREAK.into());
+            update_irq = regs.put_fifo(registers::Data::BREAK);
         }
         // Release the BqlRefCell before calling self.update()
         drop(regs);
-- 
2.48.1


