Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnh1j-0000GJ-AZ
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 11:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnh1E-0008MM-Dk
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 11:45:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnh1B-0007oF-0Z
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 11:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740674747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rMJXw2z6gbTxYfWWplVTHw1usKZlq5SZRfFTDJ86AUQ=;
 b=TZIi2TUps6lcHue8BENrS1OF5GlVvlx0Lp47hnzR5uaGtwCx+V8lBwxDuoO44usFY734Y1
 ieqqi/wn97UyOXW9Iyl1y8B9fQWZtySFY/6mEvaKacOE5gW8NDeoGZofW2LnFHx5ylHjEy
 xQ/gIbBK6Ke+PNc5OpDOn6BCLzt7WNo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-Hxcoy3CYNTavnTRz283Rdw-1; Thu, 27 Feb 2025 11:45:46 -0500
X-MC-Unique: Hxcoy3CYNTavnTRz283Rdw-1
X-Mimecast-MFC-AGG-ID: Hxcoy3CYNTavnTRz283Rdw_1740674745
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-abbae81829fso129895666b.3
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 08:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740674744; x=1741279544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rMJXw2z6gbTxYfWWplVTHw1usKZlq5SZRfFTDJ86AUQ=;
 b=DcDU4krS0jlWfaCZ4w/q1S+re6jQLF8FRP8gjHGZ4gWAKe21yFgVZifk/rlsH5JtJ9
 OodcXWinN7TKIwNx82Yn4IrQ350T6Zvfx5lb1piAJBFG4nbDDYU/4/oyrAuty7R0pXRz
 WcIXX/AFIepCezXzySKeCnhR/Do5DPNEom5n4GPqCHe0zsnMQ0he96gHgyMbl1wmWjgN
 /qxf2dCicdMaLZpIQPllQ3cahwCb5dVQst7SaaOHVMolQpa2pdbCukjNgLLDgpgk2GMR
 d6S/HpmNINO9w0ez+KWK95cxwW5zBnaTdtZ0oCniXSh3CwwyX/crV+Y9DsfCVuVy3ka+
 rtAw==
X-Gm-Message-State: AOJu0Yw/EkRTEIA+40B9XZTKrRIRSZGY+TL8ERC+kBW9w9R0TUnq9T5g
 8JE70W+EdpXJXW0Ce08UNKnHSKxhWukflha1R2V1WwvIn7HKt6kcX6Uj9JejVxBE3I6+uXzTop+
 pN0yqwQWIx3bcMEZ/XQw9xOpfjsZS7xInlQ3aLSdn7VFtD53Ug5JBopDFefTLGA==
X-Gm-Gg: ASbGncsihkDnVFwcQmTbvbQPIF6rY0beNWa2Ry5MC2955K0Ug2wKV2UHE7p4DxBxPlw
 /TLt7fGUb12zz3iH/4rKxvkFIp9T1aWpCRI0YRqDgJuYOnfArjza4CxrDCgG3GmrY75blagH0Dy
 DO1rRtuKj3RjpvcegDLXCUELoQ9O25nG3gpOuo3GLiYfyyMAgjrGeey1pU8P/8iht20mSv0tZAa
 z/Hp8X/9REuMnKblVFCKThVwXhdNnlOGfPruyNvLAON5wsx3H0uv7rvHfmBihbJ16zLXm2AXx4O
 DLbYORRJvxsaC3tEmA==
X-Received: by 2002:a17:906:dc8d:b0:ab6:d575:3c4c with SMTP id
 a640c23a62f3a-abf25fbb503mr14696366b.17.1740674744357; 
 Thu, 27 Feb 2025 08:45:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0HQpKmBJxKb6ttFfE87pBaF4i8de8emI/ci2S56wYBnBM/4Yyp4zUzV0TrZvvPcpYqt/kYw==
X-Received: by 2002:a17:906:dc8d:b0:ab6:d575:3c4c with SMTP id
 a640c23a62f3a-abf25fbb503mr14693666b.17.1740674743960; 
 Thu, 27 Feb 2025 08:45:43 -0800 (PST)
Received: from [192.168.1.84] ([93.56.163.127])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf21ae000dsm34397566b.126.2025.02.27.08.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 08:45:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 3/5] rust: pl011: clean up visibilities of callbacks
Date: Thu, 27 Feb 2025 17:45:32 +0100
Message-ID: <20250227164538.814576-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227164538.814576-1-pbonzini@redhat.com>
References: <20250227164538.814576-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XQrQ9bnQPc6D9SbjoGYf6sBb4xAvBpulIl6XLZxRJP0_1740674745
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
X-List-Received-Date: Thu, 27 Feb 2025 16:45:59 -0000

Do not make callbacks unnecessarily "pub", they are only used
through function pointers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 01540654cc9..4cdbbf4b73d 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -537,7 +537,7 @@ fn post_init(&self) {
         }
     }
 
-    pub fn read(&self, offset: hwaddr, _size: u32) -> u64 {
+    fn read(&self, offset: hwaddr, _size: u32) -> u64 {
         match RegisterOffset::try_from(offset) {
             Err(v) if (0x3f8..0x400).contains(&(v >> 2)) => {
                 let device_id = self.get_class().device_id;
@@ -560,7 +560,7 @@ pub fn read(&self, offset: hwaddr, _size: u32) -> u64 {
         }
     }
 
-    pub fn write(&self, offset: hwaddr, value: u64, _size: u32) {
+    fn write(&self, offset: hwaddr, value: u64, _size: u32) {
         let mut update_irq = false;
         if let Ok(field) = RegisterOffset::try_from(offset) {
             // qemu_chr_fe_write_all() calls into the can_receive
@@ -621,7 +621,7 @@ pub fn event(&self, event: QEMUChrEvent) {
         }
     }
 
-    pub fn realize(&self) {
+    fn realize(&self) {
         // SAFETY: self.char_backend has the correct size and alignment for a
         // CharBackend object, and its callbacks are of the correct types.
         unsafe {
@@ -638,11 +638,11 @@ pub fn realize(&self) {
         }
     }
 
-    pub fn reset_hold(&self, _type: ResetType) {
+    fn reset_hold(&self, _type: ResetType) {
         self.regs.borrow_mut().reset();
     }
 
-    pub fn update(&self) {
+    fn update(&self) {
         let regs = self.regs.borrow();
         let flags = regs.int_level & regs.int_enabled;
         for (irq, i) in self.interrupts.iter().zip(IRQMASK) {
-- 
2.48.1


